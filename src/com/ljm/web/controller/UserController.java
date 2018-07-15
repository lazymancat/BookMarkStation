package com.ljm.web.controller;

import com.ljm.web.model.User;
import com.ljm.web.service.UserService;
import com.ljm.web.staticFunc.StaticFunc;

import net.sf.json.JSONArray;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@Controller
public class UserController {
    @Resource
    private UserService userService;

    /**
     * 用户登录
     * @param req
     * @param res
     * @param session
     * @return
     */
    @RequestMapping({"/User_doLogin"})
    public String doLogin(HttpServletRequest req, HttpServletResponse res,
        HttpSession session) {
        User user = new User();
        user.setUsername(req.getParameter("username"));
        user.setPassword(req.getParameter("password"));

        User checkUserResult = this.userService.checkUserInfoCorrect(user);

        try {
            if (checkUserResult != null) {
                session.setAttribute("loggedUser", checkUserResult);
                res.getWriter().write("success");
            } else {
                res.getWriter().write("error");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    /**
     * 用户注销
     * @param model
     * @param session
     * @return
     */
    @RequestMapping({"/User_doLogout"})
    public String doLogout(Model model, HttpSession session) {
        session.setAttribute("loggedUser", null);
        model.addAttribute("user", null);

        return "redirect:/index";
    }

    /**
     * 发送验证码
     * @param req
     * @param res
     */
    @RequestMapping({"/User_sendValiCode"})
    public void sendValiCode(HttpServletRequest req, HttpServletResponse res) {
        String valiCode = StaticFunc.getValiCode(6);
        String receiveMail = req.getParameter("rgstMail");
        try {
        	//将邮箱和验证码一起md5 防止发送验证码后用户又偷偷改邮箱
            StaticFunc.sendMail(receiveMail,
                "您的验证码是:" + valiCode);
            
            res.getWriter().write(StaticFunc.getMD5(receiveMail + valiCode));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 检查用户名是否存在
     * @param req
     * @param res
     */
    @RequestMapping({"/User_checkUserNameExist"})
    public void checkUserNameExist(HttpServletRequest req,
        HttpServletResponse res) {
        String username = req.getParameter("username");

        try {
            if (this.userService.checkUsernameExist(username)) {
                res.getWriter().write("error");
            } else {
                res.getWriter().write("success");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 用户注册
     * @param req
     * @param res
     */
    @RequestMapping({"/User_doRegister"})
    public void doRegister(HttpServletRequest req, HttpServletResponse res) {
        User user = new User();
        user.setUsername(req.getParameter("username"));
        user.setPassword(req.getParameter("password"));
        user.setEmail(req.getParameter("email"));
        user.setRgstDate(req.getParameter("rgstDate"));

        try {
            if (this.userService.registerUser(user)) {
                res.getWriter().write("success");
            } else {
                res.getWriter().write("error");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 进入用户个人中心
     * @param model
     * @param session
     * @return
     */
    @RequestMapping({"/User_homepage"})
    public String homepage(Model model, HttpSession session) {
        User user = (User)session.getAttribute("loggedUser");
        user = this.userService.getUserByID(user.getID());
        session.setAttribute("loggedUser", user);
        model.addAttribute("user", user);

        return "homepage";
    }
    
    /**
     * 修改资料
     * @param req
     * @param res
     */
    @RequestMapping({"/User_modifyInfo"})
    public void modifyInfo(HttpServletRequest req, HttpServletResponse res) {
        String description = req.getParameter("description");
        String birthday = req.getParameter("birthday");
        String sex = req.getParameter("sex");
        int userID = Integer.parseInt(req.getParameter("userID"));
        
        boolean result = this.userService.modifyInfo(description, birthday, sex, userID);
        
        String json = "{\"result\":" + result + "}";

        try {
            res.setCharacterEncoding("utf-8");

            res.setContentType("text/json");

            res.getWriter().write(json);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 跳转到找回密码页面
     * @param model
     * @param session
     * @return
     */
    @RequestMapping({"/User_jumpFindPassword"})
    public String jumpFindPassword(Model model, HttpSession session){
    	return "findPassword";
    }

    /**
     * 检查邮箱是否被已注册
     * @param req
     * @param res
     */
    @RequestMapping({"/User_checkEmailRgst"})
    public void checkEmailRgst(HttpServletRequest req, HttpServletResponse res){
    	String email = req.getParameter("rgstMail");
    	
    	boolean result = this.userService.checkEmailRgst(email);
    	
    	 String json = "{\"result\":" + result + "}";

         try {
             res.setCharacterEncoding("utf-8");

             res.setContentType("text/json");

             res.getWriter().write(json);
         } catch (Exception e) {
             e.printStackTrace();
         }
    }
    
    /**
     * 找回密码
     * @param req
     * @param res
     */
    @RequestMapping({"/User_findPassword", "/User_updatePassword"})
    public void findPassword(HttpServletRequest req, HttpServletResponse res){
    	String newPassword = req.getParameter("newPassword");
    	int userID = Integer.parseInt(req.getParameter("userID"));
    	
    	boolean result = this.userService.findPassword(newPassword, userID);
    	
    	String json = "{\"result\":" + result + "}";

        try {
            res.setCharacterEncoding("utf-8");

            res.setContentType("text/json");

            res.getWriter().write(json);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 文件上传
     * @param req
     * @param res
     * @param file
     * @throws Exception
     */
    @RequestMapping({"/User_photoUpload"})
    public void photoUpload(HttpServletRequest req, HttpServletResponse res, 
    		@RequestParam("file") MultipartFile file) throws Exception{
    	boolean result = false;
    	String filename = "";
        //如果文件不为空，写入上传路径
        if(!file.isEmpty()) {
            //上传文件路径
            String path = req.getServletContext().getRealPath("/img/user/");
            //上传文件名
            filename = file.getOriginalFilename();
            filename = UUID.randomUUID() + filename.substring(filename.lastIndexOf("."));
            File filepath = new File(path,filename);
            //判断路径是否存在，如果不存在就创建一个
            if (!filepath.getParentFile().exists()) { 
                filepath.getParentFile().mkdirs();
            }
            //将上传文件保存到一个目标文件当中
            file.transferTo(new File(path + File.separator + filename));
            
            result = true;
        }
        
        String json = "{\"result\":" + result + ", \"filename\":\"" + filename + "\"}";

        try {
            res.setCharacterEncoding("utf-8");

            res.setContentType("text/json");

            res.getWriter().write(json);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    /**
     * 头像更换
     * @param req
     * @param res
     * @param file
     * @param userID
     * @param filename
     * @throws Exception
     */
    @RequestMapping({"/User_savePhoto"})
    public void savePhoto(HttpServletRequest req, HttpServletResponse res, 
    		@RequestParam("file") MultipartFile file, @RequestParam("userID") int userID,
    		@RequestParam("filename") String filename)throws Exception{
    	boolean result = false;
        //如果文件不为空，写入上传路径
        if(!file.isEmpty()) {
            //上传文件路径
            String path = "E:/Software/MyEclipse10.7/WorkSpace/BookMarkStation/WebRoot/img/user/";
            
            File filepath = new File(path,filename);
            //判断路径是否存在，如果不存在就创建一个
            if (!filepath.getParentFile().exists()) { 
                filepath.getParentFile().mkdirs();
            }
            //将上传文件保存到一个目标文件当中
            file.transferTo(new File(path + File.separator + filename));
            
            result = true;
            
            result = this.userService.savePhoto(filename, userID);
        }
        
        String json = "{\"result\":" + result + "}";

        try {
            res.setCharacterEncoding("utf-8");

            res.setContentType("text/json");

            res.getWriter().write(json);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    /**
     * 进入用户搜索页
     * @param word
     * @param session
     * @param model
     * @return
     */
    @RequestMapping({"/User_userList"})
    public String goUserList(String word, HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedUser");

        if (user != null) {
            model.addAttribute("user", user);
        }

        model.addAttribute("word", word);

        return "userList";
    }
    
    /**
     * 获取用户数据
     * @param req
     * @param res
     * @param pageNum
     * @param pageSize
     * @param word
     */
    @RequestMapping({"/User_getUserListPage"})
    public void getUserListPage(HttpServletRequest req, HttpServletResponse res, 
    		@RequestParam("pageNum") int pageNum, @RequestParam("pageSize") int pageSize, @RequestParam("word") String word){
    	try{
        	word = new String(word.getBytes("iso8859-1"),"utf-8");
        }catch(Exception e){
        	e.printStackTrace();
        }
    	
    	ArrayList<User> result = this.userService.getUserListPage(word, pageNum, pageSize);
    	
    	int count = this.userService.getUserListCount(word);

        String data = JSONArray.fromObject(result).toString();
        String json = "{\"total\":" + count + ", \"data\": " + data + "}";

        try {
            req.setCharacterEncoding("utf-8");
            res.setCharacterEncoding("utf-8");

            res.setContentType("text/json");

            res.getWriter().write(json);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    /**
     * 获取用户关注列表
     * @param req
     * @param res
     * @param fromUserID
     */
    @RequestMapping({"/User_getUserFocusList"})
    public void getUserFocusList(HttpServletRequest req, HttpServletResponse res, 
    		@RequestParam("fromUserID") int fromUserID){
    	
    	ArrayList<User> result = this.userService.getUserFocusList(fromUserID);
    	
    	String data = JSONArray.fromObject(result).toString();
        String json = "{\"data\": " + data + "}";

        try {
            req.setCharacterEncoding("utf-8");
            res.setCharacterEncoding("utf-8");

            res.setContentType("text/json");

            res.getWriter().write(json);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    /**
     * 添加关注
     * @param req
     * @param res
     * @param fromUserID
     * @param toUserID
     */
    @RequestMapping({"/User_addFocus"})
    public void addFocus(HttpServletRequest req, HttpServletResponse res, 
    		@RequestParam("fromUserID") int fromUserID, @RequestParam("toUserID") int toUserID){
    	boolean result = this.userService.addFocus(fromUserID, toUserID);
    	
        String json = "{\"result\": " + result + "}";

        try {
            req.setCharacterEncoding("utf-8");
            res.setCharacterEncoding("utf-8");

            res.setContentType("text/json");

            res.getWriter().write(json);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    /**
     * 取消关注
     * @param req
     * @param res
     * @param fromUserID
     * @param toUserID
     */
    @RequestMapping({"/User_removeFocus"})
    public void removeFocus(HttpServletRequest req, HttpServletResponse res, 
    		@RequestParam("fromUserID") int fromUserID, @RequestParam("toUserID") int toUserID){
    	boolean result = this.userService.removeFocus(fromUserID, toUserID);
    	
        String json = "{\"result\": " + result + "}";

        try {
            req.setCharacterEncoding("utf-8");
            res.setCharacterEncoding("utf-8");

            res.setContentType("text/json");

            res.getWriter().write(json);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    /**
     * 查看用户信息页
     * @param ID
     * @param session
     * @param model
     * @return
     */
    @RequestMapping({"/User_viewUser"})
    public String viewUser(int ID, HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedUser");
        User viewUser = this.userService.getUserByID(ID);
        if (user != null) {
            model.addAttribute("user", user);
        }

        model.addAttribute("viewUser", viewUser);

        return "viewUser";
    }
    
    /**
     * 检查用户是否已被当前登录用户关注
     * @param req
     * @param res
     * @param fromUserID
     * @param toUserID
     */
    @RequestMapping({"/User_checkUserBeFocus"})
    public void checkUserBeFocus(HttpServletRequest req, HttpServletResponse res, 
    		@RequestParam("fromUserID") int fromUserID, @RequestParam("toUserID") int toUserID){
    	
    	boolean result = this.userService.checkUserBeFocus(fromUserID, toUserID);
    	
        String json = "{\"result\": " + result + "}";

        try {
            req.setCharacterEncoding("utf-8");
            res.setCharacterEncoding("utf-8");

            res.setContentType("text/json");

            res.getWriter().write(json);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    /**
     * 获取当前用户关注列表 分页
     * @param req
     * @param res
     * @param fromUserID
     * @param pageNum
     * @param pageSize
     * @param word
     */
    @RequestMapping({"/User_getFocusUserListPage"})
    public void getFocusUserListPage(HttpServletRequest req, HttpServletResponse res, 
    		@RequestParam("fromUserID") int fromUserID, @RequestParam("pageNum") int pageNum,
    		@RequestParam("pageSize") int pageSize, @RequestParam("word") String word){
    	
    	ArrayList<User> result = this.userService.getFocusUserListPage(fromUserID, pageNum, pageSize, word);
    	
    	int count = this.userService.getFocusUserListCount(fromUserID, word);

        String data = JSONArray.fromObject(result).toString();
        String json = "{\"total\":" + count + ", \"data\": " + data + "}";

        try {
            req.setCharacterEncoding("utf-8");
            res.setCharacterEncoding("utf-8");

            res.setContentType("text/json");

            res.getWriter().write(json);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    /**
     * 检查用户是否被禁用
     * @param req
     * @param res
     * @param username
     * @param password
     */
    @RequestMapping({"/User_checkUserIsBan"})
    public void checkUserIsBan(HttpServletRequest req, HttpServletResponse res, 
    		@RequestParam("username") String username, @RequestParam("password") String password){
    	boolean result = this.userService.checkUserIsBan(username, password);
    	
    	String json = "{\"result\": " + result + "}";

        try {
            req.setCharacterEncoding("utf-8");
            res.setCharacterEncoding("utf-8");

            res.setContentType("text/json");

            res.getWriter().write(json);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    /**
     * 后台管理获取用户数据
     * @param req
     * @param res
     * @param word
     * @param pageNum
     * @param pageSize
     */
    @RequestMapping({"/Admin_getUserListPage"})
    public void getUserListPage_Admin(HttpServletRequest req, HttpServletResponse res, 
    		@RequestParam("word") String word, @RequestParam("pageNum") int pageNum,
    		@RequestParam("pageSize") int pageSize){
    	
    	ArrayList<User> result = this.userService.getUserListPage_Admin(word, pageNum, pageSize);
    	
    	int count = this.userService.getUserListCount_Admin(word);

        String data = JSONArray.fromObject(result).toString();
        String json = "{\"total\":" + count + ", \"data\": " + data + "}";

        try {
            req.setCharacterEncoding("utf-8");
            res.setCharacterEncoding("utf-8");

            res.setContentType("text/json");

            res.getWriter().write(json);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    /**
     * 禁用用户
     * @param req
     * @param res
     * @param userID
     */
    @RequestMapping({"/Admin_banUser"})
    public void banUser(HttpServletRequest req, HttpServletResponse res, 
    		@RequestParam("userID") int userID){
    	boolean result = this.userService.banUser(userID);
    	
    	String json = "{\"result\": " + result + "}";

        try {
            req.setCharacterEncoding("utf-8");
            res.setCharacterEncoding("utf-8");

            res.setContentType("text/json");

            res.getWriter().write(json);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    /**
     * 解禁用户
     * @param req
     * @param res
     * @param userID
     */
    @RequestMapping({"/Admin_unBanUser"})
    public void unBanUser(HttpServletRequest req, HttpServletResponse res, 
    		@RequestParam("userID") int userID){
    	boolean result = this.userService.unBanUser(userID);
    	
    	String json = "{\"result\": " + result + "}";

        try {
            req.setCharacterEncoding("utf-8");
            res.setCharacterEncoding("utf-8");

            res.setContentType("text/json");

            res.getWriter().write(json);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    /**
     * 重置密码
     * @param req
     * @param res
     * @param userID
     * @param email
     */
    @RequestMapping({"/Admin_resetPWD"})
    public void resetPWD(HttpServletRequest req, HttpServletResponse res, 
    		@RequestParam("userID") int userID, @RequestParam("email") String email){
    	boolean result = false;
    	String newPWD = StaticFunc.getValiCode(6);
    	try{
    		StaticFunc.sendMail(email, "您的密码已被重置为： " + newPWD + "，请保管好您的密码");
    		
    		result = this.userService.findPassword(newPWD, userID);
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    	
    	String json = "{\"result\": " + result + "}";

        try {
            req.setCharacterEncoding("utf-8");
            res.setCharacterEncoding("utf-8");

            res.setContentType("text/json");

            res.getWriter().write(json);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    /**
     * 检查原密码是否正确
     * @param req
     * @param res
     * @param userID
     * @param password
     */
    @RequestMapping({"/User_checkOldPasswordCorrect"})
    public void checkOldPasswordCorrect(HttpServletRequest req, HttpServletResponse res, 
    		@RequestParam("userID") int userID, @RequestParam("password") String password){
    	boolean result = this.userService.checkOldPasswordCorrect(userID, password);
    	
    	String json = "{\"result\": " + result + "}";

        try {
            req.setCharacterEncoding("utf-8");
            res.setCharacterEncoding("utf-8");

            res.setContentType("text/json");

            res.getWriter().write(json);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
