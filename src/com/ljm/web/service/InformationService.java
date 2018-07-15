package com.ljm.web.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ljm.web.dao.InformationMapper;
import com.ljm.web.dao.LogMapper;
import com.ljm.web.model.Information;
import com.ljm.web.staticFunc.StaticFunc;

@Service
public class InformationService {
	@Resource
	private InformationMapper informationMapper;
	@Resource
	private LogMapper logMapper;
	
	public int checkNewInformation(int userID){
		return this.informationMapper.checkNewInformation(userID);
	}
	
	public ArrayList<Information> queryInformationListPage(int pageNum, int pageSize, int toUserID){
		return this.informationMapper.queryInformationListPage((pageNum - 1) * pageSize, pageSize, toUserID);
	}
	
	public int queryInformationListCount(int toUserID){
		return this.informationMapper.queryInformationListCount(toUserID);
	}
	
	public boolean checkedInformation(int informationID){
		return this.informationMapper.checkedInformation(informationID) == 0?false:true;
	}
	
	public boolean shareBookMark(int fromUserID, int toUserID, int bookmarkID, String date, String content){
		
		this.logMapper.addLog("分享书签", fromUserID, bookmarkID, StaticFunc.getDate_YMD());
		return this.informationMapper.shareBookMark(fromUserID, toUserID, bookmarkID, date, content) == 0?false:true;
	}
	
	public boolean sendInformation(String content, String date){
		ArrayList<Integer> userIDArr = this.informationMapper.getUserIDArr();
		
		return this.informationMapper.sendInformation(userIDArr, content, date) == 0?false:true;
	}
}
