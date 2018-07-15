package com.ljm.web.controller;

import com.ljm.web.model.Comment;
import com.ljm.web.service.CommentService;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;

import javax.annotation.Resource;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@Controller
public class CommentController {
    @Resource
    private CommentService commentService;

    /**
     * 分页查询书签的评论列表
     * @param req
     * @param res
     * @param session
     */
    @RequestMapping({"/Comment_getCommentsListPage"})
    public void getCommentsListPage(HttpServletRequest req,
        HttpServletResponse res, HttpSession session) {
        int bookmarkID = Integer.parseInt(req.getParameter("bookmarkID"));
        int pageNum = Integer.parseInt(req.getParameter("pageNum"));
        int pageSize = Integer.parseInt(req.getParameter("pageSize"));

        ArrayList<Comment> result = commentService.getCommentsListPage(bookmarkID,
                (pageNum - 1) * pageSize, pageSize);
        int count = commentService.getCommentsListCount(bookmarkID);

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
     * 添加评论
     * @param req
     * @param res
     */
    @RequestMapping({"/Comment_addComment"})
    public void addComment(HttpServletRequest req,
            HttpServletResponse res){
    	String content = req.getParameter("content");
    	String date = req.getParameter("date");
    	int bookmarkID = Integer.parseInt(req.getParameter("bookmarkID"));
    	int userID = Integer.parseInt(req.getParameter("userID"));
    	
    	boolean result = this.commentService.addComment(content, date, bookmarkID, userID);
    	
    	String json = "{\"result\":" + result + "}";

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
