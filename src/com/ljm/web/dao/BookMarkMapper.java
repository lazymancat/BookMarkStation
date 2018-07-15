package com.ljm.web.dao;

import com.ljm.web.model.BookMark;
import com.ljm.web.model.Img;
import com.ljm.web.model.Label;

import java.util.ArrayList;
import org.apache.ibatis.annotations.Param;

public abstract interface BookMarkMapper{
	public abstract ArrayList<BookMark> getBookMarkListPage_type0(@Param("word") String paramString, 
			@Param("beginPos") int paramInt1, @Param("pageSize") int paramInt2);
  
	public abstract ArrayList<BookMark> getBookMarkListPage_type1(@Param("word") String paramString, 
			@Param("beginPos") int paramInt1, @Param("pageSize") int paramInt2);
  
	public abstract ArrayList<BookMark> getBookMarkListPage_type2(@Param("word") String paramString, 
			@Param("beginPos") int paramInt1, @Param("pageSize") int paramInt2);
  
	public abstract ArrayList<BookMark> getBookMarkListPage_type3(@Param("word") String paramString, 
			@Param("beginPos") int paramInt1, @Param("pageSize") int paramInt2);
  
	public abstract ArrayList<BookMark> getBookMarkListPage_User(@Param("word") String paramString, 
			@Param("beginPos") int paramInt1, @Param("pageSize") int paramInt2, @Param("userID") int userID);
 
	public abstract ArrayList<BookMark> getBookMarkListPage_Manage(@Param("word") String paramString, 
			@Param("beginPos") int paramInt1, @Param("pageSize") int paramInt2, @Param("userID") int userID);
  
	public abstract int getBookMarkListCount(@Param("word") String paramString);
  
	public abstract int getBookMarkListCount_User(@Param("word") String paramString, 
			@Param("userID") int userID);
  
	public abstract int getBookMarkListCount_Manage(@Param("word") String paramString, 
			@Param("userID") int userID);
  
	public abstract BookMark getBookMarkByID(@Param("ID") int ID);
  
	public abstract ArrayList<BookMark> getRecentBookMark();
  
	public abstract ArrayList<BookMark> getPopularBookMark();
  
	public abstract int saveBookMarkImg(Img img);
  
	public abstract int addBookMark(BookMark bm);
  
	public abstract int modifyBookMarkImg(@Param("imgID") int imgID, @Param("bookmarkID") int bookmarkID);
  
	public abstract int modifyBookMark(@Param("title") String title, @Param("link") String link, 
			@Param("summary") String summary, @Param("bookmarkID") int bookmarkID);

	public abstract int removeBookMark(@Param("bookmarkID") int bookmarkID);

	public abstract ArrayList<Label> getLabelByBookMarkID(@Param("ID") int bookmarkID);
  
	public abstract int removeLabels(@Param("bookmarkID") int bookmarkID);
  
	public abstract int addLabels(@Param("bookmarkID") int bookmarkID, 
			@Param("labels") ArrayList<String> labels);
  
}
