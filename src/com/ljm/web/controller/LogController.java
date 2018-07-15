package com.ljm.web.controller;

import com.ljm.web.model.Comment;
import com.ljm.web.model.Log;
import com.ljm.web.service.CommentService;
import com.ljm.web.service.LogService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.ibatis.annotations.Param;
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
public class LogController {
    @Resource
    private LogService logService;

    /**
     * 添加系统日志
     * @param req
     * @param res
     * @param type
     * @param userID
     * @param bookmarkID
     */
    @RequestMapping({"/Log_addLog"})
    public void addLog(HttpServletRequest req, HttpServletResponse res,
    		@RequestParam("type") String type, @RequestParam("userID") int userID, @RequestParam("bookmarkID") int bookmarkID){
    	this.logService.addLog(type, userID, bookmarkID);
    }
    
    /**
     * 获取系统日志数据
     * @param req
     * @param res
     * @param word
     * @param pageNum
     * @param pageSize
     */
    @RequestMapping({"/Admin_getLogListPage"})
    public void getLogListPage(HttpServletRequest req, HttpServletResponse res,
    		@RequestParam("word") String word, @RequestParam("pageNum") int pageNum, @RequestParam("pageSize") int pageSize){
    	ArrayList<Log> result = this.logService.getLogListPage(word, pageNum, pageSize);
    	
    	int count = this.logService.getLogListCount(word);

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
     * 获取用户周报数据
     * @param req
     * @param res
     * @param date
     */
    @RequestMapping({"/Admin_getUserAtyWeek"})
    public void getUserAtyWeek(HttpServletRequest req, HttpServletResponse res,
    		@RequestParam("date") String[] date){
    	
    	ArrayList<Integer> userLoginWeek = this.logService.getUserLoginWeek(date);
    	ArrayList<Integer> userRgstWeek = this.logService.getUserRgstWeek(date);

    	String data1 = JSONArray.fromObject(userLoginWeek).toString();
    	String data2 = JSONArray.fromObject(userRgstWeek).toString();
    	String json = "{\"login\":" + data1 + ", \"rgst\": " + data2 + "}";

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
     * 获取书签周报数据
     * @param req
     * @param res
     * @param date
     */
    @RequestMapping({"/Admin_getBookMarkAtyWeek"})
    public void getBookMarkAtyWeek(HttpServletRequest req, HttpServletResponse res,
    		@RequestParam("date") String[] date){
    	
    	ArrayList<Integer> bookmarkVisitWeek = this.logService.getBookMarkVisitWeek(date);
    	ArrayList<Integer> bookmarkShareWeek = this.logService.getBookMarkShareWeek(date);
    	ArrayList<Integer> bookmarkCollectWeek = this.logService.getBookMarkCollectWeek(date);
    	ArrayList<Integer> bookmarkAddWeek = this.logService.getBookMarkAddWeek(date);

    	String data1 = JSONArray.fromObject(bookmarkVisitWeek).toString();
    	String data2 = JSONArray.fromObject(bookmarkShareWeek).toString();
    	String data3 = JSONArray.fromObject(bookmarkCollectWeek).toString();
    	String data4 = JSONArray.fromObject(bookmarkAddWeek).toString();
    	String json = "{\"visit\":" + data1 + ", \"share\": " + data2 + ", \"collect\": " + data3 +", \"add\": " + data4 + "}";

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
