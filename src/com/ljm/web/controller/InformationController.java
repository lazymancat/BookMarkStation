package com.ljm.web.controller;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ljm.web.model.Information;
import com.ljm.web.service.InformationService;

@Controller
public class InformationController {
	@Resource
	private InformationService informationService;
	
	/**
	 * 检查是否有未读通知
	 * @param req
	 * @param res
	 * @param userID
	 */
	@RequestMapping({"/Information_checkNewInformation"})
	public void checkNewInformation(HttpServletRequest req,
            HttpServletResponse res, @RequestParam("userID") int userID){
		
		int result = this.informationService.checkNewInformation(userID);
		
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
	
	/**
	 * 获取系统通知数据
	 * @param req
	 * @param res
	 * @param toUserID
	 * @param pageNum
	 * @param pageSize
	 */
	@RequestMapping({"/Information_queryInformationListPage"})
	public void queryInformationListPage(HttpServletRequest req,
            HttpServletResponse res, @RequestParam("toUserID") int toUserID,
            @RequestParam("pageNum") int pageNum, @RequestParam("pageSize") int pageSize){
		
		ArrayList<Information> result = this.informationService.queryInformationListPage(pageNum, pageSize, toUserID);
		int count = this.informationService.queryInformationListCount(toUserID);
		
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
	 * 用户查看通知详情 更新通知状态为已被查看
	 * @param req
	 * @param res
	 * @param informationID
	 */
	@RequestMapping({"/Information_checkedInformation"})
	public void checkedInformation(HttpServletRequest req,
            HttpServletResponse res, @RequestParam("informationID") int informationID){
		boolean result = this.informationService.checkedInformation(informationID);
		
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
	 * 分享书签
	 * @param req
	 * @param res
	 * @param fromUserID
	 * @param toUserID
	 * @param bookmarkID
	 * @param date
	 * @param content
	 */
	@RequestMapping({"/Information_shareBookMark"})
	public void shareBookmark(HttpServletRequest req, HttpServletResponse res, 
			@RequestParam("fromUserID") int fromUserID, @RequestParam("toUserID") int toUserID,
			@RequestParam("bookmarkID") int bookmarkID, @RequestParam("date") String date,
			@RequestParam("content") String content){
		
		boolean result = this.informationService.shareBookMark(fromUserID, toUserID, bookmarkID, date, content);
		
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
	
	@RequestMapping("/Admin_sendInformation")
	public void sendInformation(HttpServletRequest req, HttpServletResponse res,
			@RequestParam("content") String content, @RequestParam("date") String date){
		
		boolean result = this.informationService.sendInformation(content, date);
		
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
