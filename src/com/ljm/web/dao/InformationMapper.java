package com.ljm.web.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.ljm.web.model.Information;

public abstract interface InformationMapper {

	public abstract int checkNewInformation(@Param("userID") int userID);
	
	public abstract ArrayList<Information> queryInformationListPage(@Param("beginPos") int beginPos, 
			@Param("pageSize") int pageSize, @Param("toUserID") int toUserID);

	public abstract int queryInformationListCount(@Param("toUserID") int toUserID);
	
	public abstract int checkedInformation(@Param("informationID") int informationID);
	
	public abstract int shareBookMark(@Param("fromUserID") int fromUserID, @Param("toUserID") int toUserID, 
			@Param("bookmarkID") int bookmarkID, @Param("date") String date, @Param("content") String content);

	public abstract ArrayList<Integer> getUserIDArr();
	
	public abstract int sendInformation(@Param("userIDArr") ArrayList<Integer> userIDArr, @Param("content") String content, 
			@Param("date") String date);
}
