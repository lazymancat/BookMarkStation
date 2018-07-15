package com.ljm.web.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ljm.web.dao.CollectMapper;
import com.ljm.web.dao.LogMapper;
import com.ljm.web.model.Collect;
import com.ljm.web.staticFunc.StaticFunc;

@Service
public class CollectService {
	@Resource
	private CollectMapper collectMapper;
	@Resource
	private LogMapper logMapper;
	
	public Collect checkBookMarkMarked(int userID, int bookmarkID){
		return this.collectMapper.checkBookMarkMarked(userID, bookmarkID);
	}
	
	public boolean addCollect( int userID, int bookmarkID){
		this.logMapper.addLog("收藏书签", userID, bookmarkID, StaticFunc.getDate_YMD());
		return this.collectMapper.addCollect(userID, bookmarkID) != 0?true:false;
	}
	
	public boolean deleteCollect( int userID, int bookmarkID){
		return this.collectMapper.deleteCollect(userID, bookmarkID) != 0?true:false;
	}
}
