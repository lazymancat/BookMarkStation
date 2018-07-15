package com.ljm.web.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ljm.web.dao.LogMapper;
import com.ljm.web.model.Log;
import com.ljm.web.staticFunc.StaticFunc;


@Service
public class LogService {
	@Resource
	private LogMapper logMapper;
	
	public int addLog(String type, int userID, int bookmarkID){
		return this.logMapper.addLog(type, userID, bookmarkID, StaticFunc.getDate_YMD());
	}
	
	public ArrayList<Log> getLogListPage(String word, int pageNum, int pageSize){
		return this.logMapper.getLogListPage(word, (pageNum - 1) * pageSize, pageSize);
	}
	
	public int getLogListCount(String word){
		return this.logMapper.getLogListCount(word);
	}
	
	public ArrayList<Integer> getUserLoginWeek(String[] date){
		ArrayList<Integer> temp = new ArrayList<Integer>();
		for(int i = 0; i < 7; i++){
			temp.add(this.logMapper.getUserLogin(date[i]));
		}
		
		return temp;
	}
	
	public ArrayList<Integer> getUserRgstWeek(String[] date){
		ArrayList<Integer> temp = new ArrayList<Integer>();
		for(int i = 0; i < 7; i++){
			temp.add(this.logMapper.getUserRgst(date[i]));
		}
		
		return temp;
	}
	
	public ArrayList<Integer> getBookMarkVisitWeek(String[] date){
		ArrayList<Integer> temp = new ArrayList<Integer>();
		for(int i = 0; i < 7; i++){
			temp.add(this.logMapper.getBookMarkVisit(date[i]));
		}
		
		return temp;
	}
	
	public ArrayList<Integer> getBookMarkShareWeek(String[] date){
		ArrayList<Integer> temp = new ArrayList<Integer>();
		for(int i = 0; i < 7; i++){
			temp.add(this.logMapper.getBookMarkShare(date[i]));
		}
		
		return temp;
	}
	
	public ArrayList<Integer> getBookMarkCollectWeek(String[] date){
		ArrayList<Integer> temp = new ArrayList<Integer>();
		for(int i = 0; i < 7; i++){
			temp.add(this.logMapper.getBookMarkCollect(date[i]));
		}
		
		return temp;
	}
	
	public ArrayList<Integer> getBookMarkAddWeek(String[] date){
		ArrayList<Integer> temp = new ArrayList<Integer>();
		for(int i = 0; i < 7; i++){
			temp.add(this.logMapper.getBookMarkAdd(date[i]));
		}
		
		return temp;
	}
}
