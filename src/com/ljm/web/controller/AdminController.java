package com.ljm.web.controller;

import com.ljm.web.model.Admin;
import com.ljm.web.model.Comment;
import com.ljm.web.service.AdminService;
import com.ljm.web.service.CommentService;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;

import javax.annotation.Resource;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@Controller
public class AdminController {
    @Resource
    private AdminService adminService;
    
    /*
     * 后台登录界面
     */
    @RequestMapping({"/Admin_index", "/Admin"})
    public String index(HttpSession session, Model model){
    	if(session.getAttribute("admin") != null){
    		return "admin/home";
    	}
    	
    	return "admin/index";
    }
    
    /**
     * 后台登录
     * @param req
     * @param res
     * @param session
     * @param account 账号
     * @param password 密码
     */
    @RequestMapping({"/Admin_login"})
    public void login(HttpServletRequest req, HttpServletResponse res, HttpSession session,
    		@RequestParam("account") String account, @RequestParam("password") String password){
    	Admin admin = this.adminService.getAdminByInfo(account, password);
    	
    	boolean result = false;
    	if(admin != null){
    		result = true;
        	session.setAttribute("admin", admin);
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
     * 跳转后台管理中心
     * @param session
     * @param model
     * @return
     */
    @RequestMapping({"/Admin_home"})
    public String home(HttpSession session, Model model){
    	Admin admin = (Admin)session.getAttribute("admin");
    	model.addAttribute("admin", admin);
    	
    	return "admin/home";
    }
}
