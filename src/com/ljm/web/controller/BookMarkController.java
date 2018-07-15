package com.ljm.web.controller;

import com.ljm.web.model.BookMark;
import com.ljm.web.model.Label;
import com.ljm.web.model.User;
import com.ljm.web.service.BookMarkService;
import com.ljm.web.service.LogService;

import net.sf.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class BookMarkController {
    @Resource
    private BookMarkService bookmarkService;
    @Resource
    private LogService logService;

    /**
     * 书签详情
     * @param ID
     * @param model
     * @param session
     * @return
     */
    @RequestMapping({"/BookMark_show"})
    public String showBookMark(int ID, Model model, HttpSession session) {
        User user = (User) session.getAttribute("loggedUser");
        
        BookMark bm = bookmarkService.getBookMarkByID(ID);
        
        model.addAttribute("user", user);
        model.addAttribute("shownBookMark", bm);
        
        return "bookmark";
    }

    /**
     * 分页查询书签列表
     * @param req
     * @param res
     * @param session
     */
    @RequestMapping({"/BookMark_getBookMarkListPage"})
    public void getBookMarkListPage(HttpServletRequest req,
        HttpServletResponse res, HttpSession session) {
        String word = req.getParameter("word");
        int type = Integer.parseInt(req.getParameter("type"));
        try{
        	word = new String(word.getBytes("iso8859-1"),"utf-8");
        }catch(Exception e){
        	e.printStackTrace();
        }
        int pageNum = Integer.parseInt(req.getParameter("pageNum"));
        int pageSize = Integer.parseInt(req.getParameter("pageSize"));

        word = (word == null) ? "" : word;

        ArrayList<BookMark> result = this.bookmarkService.getBookMarkListPage(word,
                (pageNum - 1) * pageSize, pageSize, type);
        
        int count = this.bookmarkService.getBookMarkListCount(word);

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
     * 分页查询用户收藏的书签列表
     * @param req
     * @param res
     * @param session
     */
    @RequestMapping({"/BookMark_getBookMarkListPage_User"})
    public void getBookMarkListPage_User(HttpServletRequest req,
        HttpServletResponse res, HttpSession session) {
        String word = req.getParameter("word");
        int pageNum = Integer.parseInt(req.getParameter("pageNum"));
        int pageSize = Integer.parseInt(req.getParameter("pageSize"));
        int userID = Integer.parseInt(req.getParameter("userID"));

        word = (word == null) ? "" : word;

        ArrayList<BookMark> result = this.bookmarkService.getBookMarkListPage_User(word,
                (pageNum - 1) * pageSize, pageSize, userID);
        int count = this.bookmarkService.getBookMarkListCount_User(word, userID);

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
     * 获取最新书签
     * @param req
     * @param res
     * @param session
     */
    @RequestMapping({"/BookMark_getRecentBookMark"})
    public void getRecentBookMark(HttpServletRequest req,
        HttpServletResponse res, HttpSession session) {

        ArrayList<BookMark> result = this.bookmarkService.getRecentBookMark();
        
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
     * 获取热门书签
     * @param req
     * @param res
     * @param session
     */
    @RequestMapping({"/BookMark_getPopularBookMark"})
    public void getPopularBookMark(HttpServletRequest req,
        HttpServletResponse res, HttpSession session) {

        ArrayList<BookMark> result = this.bookmarkService.getPopularBookMark();
        
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
     * 分页查询用户收藏的书签列表
     * @param req
     * @param res
     * @param session
     */
    @RequestMapping({"/BookMark_getBookMarkListPage_Manage"})
    public void getBookMarkListPage_Manage(HttpServletRequest req,
        HttpServletResponse res, HttpSession session) {
        String word = req.getParameter("word");
        int pageNum = Integer.parseInt(req.getParameter("pageNum"));
        int pageSize = Integer.parseInt(req.getParameter("pageSize"));
        int userID = Integer.parseInt(req.getParameter("userID"));

        word = (word == null) ? "" : word;

        ArrayList<BookMark> result = this.bookmarkService.getBookMarkListPage_Manage(word,
                (pageNum - 1) * pageSize, pageSize, userID);
        int count = this.bookmarkService.getBookMarkListCount_Manage(word, userID);

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
     * 书签图片上传
     * @param req
     * @param res
     * @param file
     * @throws Exception
     */
    @RequestMapping({"/BookMark_bookmarkImgUpload", "/Admin_bookmarkImgUpload"})
    public void bookmarkImgUpload(HttpServletRequest req, HttpServletResponse res, 
    		@RequestParam("file") MultipartFile file) throws Exception{
    	boolean result = false;
    	String filename = "";
        //如果文件不为空，写入上传路径
        if(!file.isEmpty()) {
            //上传文件路径
            String path = req.getServletContext().getRealPath("/img/bookmark/");
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
     * 添加书签
     * @param req
     * @param res
     * @param file
     * @param title
     * @param link
     * @param summary
     * @param date
     * @param userID
     * @param filename
     * @throws Exception
     */
    @RequestMapping({"/BookMark_addBookMark"})
    public void addBookMark(HttpServletRequest req, HttpServletResponse res, 
    		@RequestParam("file") MultipartFile file, @RequestParam("title") String title,
    		@RequestParam("link") String link,@RequestParam("summary") String summary,
    		@RequestParam("date") String date,@RequestParam("userID") int userID,
    		@RequestParam("filename") String filename, 
    		@RequestParam("labels") ArrayList<String> labels)throws Exception{
    	
        //如果文件不为空，写入上传路径
        if(!file.isEmpty()) {
            //上传文件路径
            String path = "E:/Software/MyEclipse10.7/WorkSpace/BookMarkStation/WebRoot/img/bookmark/";
            
            File filepath = new File(path,filename);
            //判断路径是否存在，如果不存在就创建一个
            if (!filepath.getParentFile().exists()) { 
                filepath.getParentFile().mkdirs();
            }
            //将上传文件保存到一个目标文件当中
            file.transferTo(new File(path + File.separator + filename));
        }
        
        boolean result = this.bookmarkService.addBookMark(filename, title, link, summary, date, userID, labels);
        
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
     * 修改书签
     * @param req
     * @param res
     * @param file
     * @param title
     * @param link
     * @param summary
     * @param bookmarkID
     * @param filename
     * @throws Exception
     */
    @RequestMapping({"/BookMark_modifyBookMark", "/Admin_modifyBookMark"})
    public void modifyBookMark(HttpServletRequest req, HttpServletResponse res, 
    		@RequestParam("file") MultipartFile file, @RequestParam("title") String title,
    		@RequestParam("link") String link,@RequestParam("summary") String summary,
    		@RequestParam("bookmarkID") int bookmarkID, @RequestParam("filename") String filename,
    		@RequestParam("labels") ArrayList<String> labels)throws Exception{
    	
        //如果文件不为空，写入上传路径
        if(!file.isEmpty()) {
            //上传文件路径
            String path = "E:/Software/MyEclipse10.7/WorkSpace/BookMarkStation/WebRoot/img/bookmark/";
            
            File filepath = new File(path,filename);
            //判断路径是否存在，如果不存在就创建一个
            if (!filepath.getParentFile().exists()) { 
                filepath.getParentFile().mkdirs();
            }
            //将上传文件保存到一个目标文件当中
            file.transferTo(new File(path + File.separator + filename));
        }
        
        boolean result = this.bookmarkService.modifyBookMark(filename, title, link, summary, bookmarkID, labels);
        
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
     * 移除书签
     * @param req
     * @param res
     * @param bookmarkID
     * @throws Exception
     */
    @RequestMapping({"/BookMark_removeBookMark", "/Admin_removeBookMark"})
    public void removeBookMark(HttpServletRequest req, HttpServletResponse res, 
    		@RequestParam("bookmarkID") int bookmarkID)throws Exception{
        
        boolean result = this.bookmarkService.removeBookMark(bookmarkID);
        
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
     * 获取书签持有的标签列表
     * @param req
     * @param res
     * @param bookmarkID
     * @throws Exception
     */
    @RequestMapping({"/BookMark_getLabelByBookMarkID"})
    public void getLabelByBookMarkID(HttpServletRequest req, HttpServletResponse res, 
    		@RequestParam("bookmarkID") int bookmarkID)throws Exception{
        
        ArrayList<Label> result = this.bookmarkService.getLabelByBookMarkID(bookmarkID);
        
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
     * 后台管理获取书签数据
     * @param req
     * @param res
     * @param word
     * @param pageNum
     * @param pageSize
     */
    @RequestMapping({"/Admin_getBookMarkListPage"})
    public void getBookMarkListPage_Admin(HttpServletRequest req, HttpServletResponse res, 
    		@RequestParam("word") String word, @RequestParam("pageNum") int pageNum,
    		@RequestParam("pageSize") int pageSize){
    	ArrayList<BookMark> result = this.bookmarkService.getBookMarkListPage(word, (pageNum - 1) * pageSize, pageSize, 0);
    
    	int count = this.bookmarkService.getBookMarkListCount(word);

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
}
