package com.ljm.web.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ljm.web.dao.CommentMapper;
import com.ljm.web.model.Comment;

@Service
public class CommentService {
	@Resource
	private CommentMapper commentMapper;
	
	public ArrayList<Comment> getCommentsListPage(int bookmarkID, int beginPos, int pageSize){
		return this.commentMapper.getCommentsListPage(bookmarkID, beginPos, pageSize);
	}
	
	public int getCommentsListCount(int bookmarkID){
		return this.commentMapper.getCommentsListCount(bookmarkID);
	}
	
	public boolean addComment(String content, String date, int bookmarkID, int userID){
		return this.commentMapper.addComment(content, date, bookmarkID, userID) == 0?false:true;
	}
}
