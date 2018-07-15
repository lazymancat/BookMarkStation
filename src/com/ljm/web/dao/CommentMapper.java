package com.ljm.web.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.ljm.web.model.Comment;

public abstract interface CommentMapper {
	public abstract ArrayList<Comment> getCommentsListPage(@Param("bookmarkID") int bookmarkID, 
			@Param("beginPos")int beginPos, @Param("pageSize") int pageSize);
	
	public abstract int getCommentsListCount(@Param("bookmarkID") int bookmarkID);
	
	public abstract int addComment(@Param("content") String content, 
			@Param("date") String date, @Param("bookmarkID") int bookmarkID, @Param("userID") int userID);
}
