package com.ljm.web.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.ljm.web.model.Log;

public abstract interface LogMapper {
	public abstract int addLog(@Param("type") String type, @Param("userID") int userID, 
			@Param("bookmarkID") int bookmarkID, @Param("date") String date);
	
	public abstract ArrayList<Log> getLogListPage(@Param("word") String word, @Param("beginPos") int beginPos, @Param("pageSize") int pageSize);

	public abstract int getLogListCount(@Param("word") String word);
	
	public abstract int getUserLogin(@Param("date") String date);
	
	public abstract int getUserRgst(@Param("date") String date);
	
	public abstract int getBookMarkVisit(@Param("date") String date);
	
	public abstract int getBookMarkShare(@Param("date") String date);
	
	public abstract int getBookMarkCollect(@Param("date") String date);
	
	public abstract int getBookMarkAdd(@Param("date") String date);
}
