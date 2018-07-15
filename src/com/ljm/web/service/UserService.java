package com.ljm.web.service;

import java.util.ArrayList;

import com.ljm.web.dao.LogMapper;
import com.ljm.web.dao.UserMapper;
import com.ljm.web.model.Img;
import com.ljm.web.model.User;
import com.ljm.web.staticFunc.StaticFunc;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

@Service
public class UserService
{
	@Resource
	private UserMapper userMapper;
	@Resource
	private LogMapper logMapper;
  
	public boolean checkUsernameExist(String username){
		if (this.userMapper.getUserByUsername(username) == null) {
			return false;
		}
		return true;
	}
  
	public boolean registerUser(User user) throws Exception{
	  	int result = this.userMapper.insertUser(user);
	  	this.logMapper.addLog("用户注册", user.getID(), 0, StaticFunc.getDate_YMD());
		if (result == 0) {
		  return false;
		}
		return true;
	}
  
	public User checkUserInfoCorrect(User user){
		user = this.userMapper.getUserByUserInfo(user);
		if(user != null){
			this.logMapper.addLog("用户登录", user.getID(), 0, StaticFunc.getDate_YMD());
		}
		
		return user;
	}
  
	public User getUserByID(int userID){
		return this.userMapper.getUserByID(userID);
	}
  
	public boolean modifyInfo(String description, String birthday, String sex, int userID){
		return this.userMapper.modifyInfo(description, birthday, sex, userID) == 0?false:true;
	}
  
	public boolean checkEmailRgst(String email){
		int result = this.userMapper.checkEmailRgst(email);
		return result == 0?false:true;
	}
  
	public boolean findPassword(String newPassword, int userID){
		return this.userMapper.findPassword(newPassword, userID) == 0? false: true;
	}
  
	public boolean savePhoto(String filename, int userID){
		Img img = new Img();
		img.setName(filename);
		this.userMapper.savePhoto(img);
		int imgID = img.getID();
		return this.userMapper.modifyPhoto(userID, imgID) == 0?false:true;
	}
  
	public ArrayList<User> getUserListPage(String word, int pageNum, int pageSize){
		return this.userMapper.getUserListPage(word, (pageNum - 1) * pageSize, pageSize);
	}
  
	public int getUserListCount(String word){
		return this.userMapper.getUserListCount(word);
	}
  
	public ArrayList<User> getUserFocusList(int fromUserID){
		return this.userMapper.getUserFocusList(fromUserID);
	}
  
	public boolean addFocus(int fromUserID, int toUserID){
		return this.userMapper.addFocus(fromUserID, toUserID) == 0?false:true;
	}
  
 	public boolean removeFocus(int fromUserID, int toUserID){
 		return this.userMapper.removeFocus(fromUserID, toUserID) == 0?false:true;
	}
  
	public boolean checkUserBeFocus(int fromUserID, int toUserID){
		return this.userMapper.checkUserBeFocus(fromUserID, toUserID) == 0?false:true;
	}
  
	public ArrayList<User> getFocusUserListPage(int fromUserID, int pageNum, int pageSize, String word){
		return this.userMapper.getFocusUserListPage(fromUserID, (pageNum - 1) * pageSize, pageSize, word);
	}
  
	public int getFocusUserListCount(int fromUserID, String word){
		return this.userMapper.getFocusUserListCount(fromUserID, word);
	}
  
	public boolean checkUserIsBan(String username, String password){
		return this.userMapper.checkUserIsBan(username, password) == 0?false:true;
	}
  
	public ArrayList<User> getUserListPage_Admin(String word, int pageNum, int pageSize){
		return this.userMapper.getUserListPage_Admin(word, (pageNum - 1) * pageSize, pageSize);
	}
  
	public int getUserListCount_Admin(String word){
		return this.userMapper.getUserListCount_Admin(word);
	}
  
	public boolean banUser(int userID){
		return this.userMapper.banUser(userID) == 0?false:true;
	}
  
	public boolean unBanUser(int userID){
		return this.userMapper.unBanUser(userID) == 0?false:true;
	}
  
	public boolean checkOldPasswordCorrect(int userID, String password){
		return this.userMapper.checkOldPasswordCorrect(userID, password) == 0?false:true;
	}
}
