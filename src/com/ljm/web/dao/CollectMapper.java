package com.ljm.web.dao;

import org.apache.ibatis.annotations.Param;

import com.ljm.web.model.Collect;

public abstract interface CollectMapper {
	public abstract Collect checkBookMarkMarked(@Param("userID") int userID, 
			@Param("bookmarkID") int bookmarkID);

	public abstract int addCollect(@Param("userID") int userID, @Param("bookmarkID") int bookmarkID);
	
	public abstract int deleteCollect(@Param("userID") int userID, @Param("bookmarkID") int bookmarkID);
}
