package com.ljm.web.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.ljm.web.model.Img;
import com.ljm.web.model.User;

public abstract interface UserMapper
{
  public abstract User getUserByUsername(String paramString);
  
  public abstract int insertUser(User paramUser)
    throws Exception;
  
  public abstract User getUserByUserInfo(User paramUser);
  
  public abstract User getUserByID(@Param("userID") int userID);
  
  public abstract int modifyInfo(@Param("description") String description, @Param("birthday") String birthday, 
		  @Param("sex") String sex, @Param("userID") int userID);
  
  public abstract int checkEmailRgst(@Param("email") String email);
  
  public abstract int findPassword(@Param("newPassword") String newPassword, @Param("userID") int userID);
  
  public abstract int savePhoto(Img img);
  
  public abstract int modifyPhoto(@Param("userID") int userID, @Param("imgID") int imgID);
  
  public abstract ArrayList<User> getUserListPage(@Param("word") String word, @Param("beginPos") int beginPos, @Param("pageSize") int pageSize);

  public abstract int getUserListCount(@Param("word") String word);
  
  public abstract ArrayList<User> getUserFocusList(@Param("fromUserID") int fromUserID);
  
  public abstract int addFocus(@Param("fromUserID") int fromUserID, @Param("toUserID") int toUserID);
  
  public abstract int removeFocus(@Param("fromUserID") int fromUserID, @Param("toUserID") int toUserID);

  public abstract int checkUserBeFocus(@Param("fromUserID") int fromUserID, @Param("toUserID") int toUserID);
  
  public abstract ArrayList<User> getFocusUserListPage(@Param("fromUserID") int fromUserID, @Param("beginPos") int beginPos, @Param("pageSize") int pageSize, @Param("word") String word);
  
  public abstract int getFocusUserListCount(@Param("fromUserID") int fromUserID, @Param("word") String word);
  
  public abstract int checkUserIsBan(@Param("username") String username, @Param("password") String password);

  public abstract ArrayList<User> getUserListPage_Admin(@Param("word") String word, @Param("beginPos") int beginPos, @Param("pageSize") int pageSize);
  
  public abstract int getUserListCount_Admin(@Param("word") String word); 
  
  public abstract int banUser(@Param("userID") int userID);
  
  public abstract int unBanUser(@Param("userID") int userID);
  
  public abstract int checkOldPasswordCorrect(@Param("userID") int userID, @Param("password") String password);
}
