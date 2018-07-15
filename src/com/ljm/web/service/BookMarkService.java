package com.ljm.web.service;

import com.ljm.web.dao.BookMarkMapper;
import com.ljm.web.dao.LogMapper;
import com.ljm.web.model.BookMark;
import com.ljm.web.model.Img;
import com.ljm.web.model.Label;
import com.ljm.web.model.User;
import com.ljm.web.staticFunc.StaticFunc;

import org.springframework.stereotype.Service;
import java.util.ArrayList;
import javax.annotation.Resource;


@Service
public class BookMarkService {
    @Resource
    private BookMarkMapper bookmarkMapper;
    @Resource
    private LogMapper logMapper;

    public ArrayList<BookMark> getBookMarkListPage(String word, int beginPos,
        int pageSize, int type) {
    	if(type == 0){
    		return this.bookmarkMapper.getBookMarkListPage_type0(word, beginPos, pageSize);
    	}else if(type == 1){
    		return this.bookmarkMapper.getBookMarkListPage_type1(word, beginPos, pageSize);
    	}else if(type == 2){
    		return this.bookmarkMapper.getBookMarkListPage_type2(word, beginPos, pageSize);
    	}else if(type == 3){
    		return this.bookmarkMapper.getBookMarkListPage_type3(word, beginPos, pageSize);
    	}else{
    		return null;
    	}
    }
    
    public ArrayList<BookMark> getBookMarkListPage_User(String word, int beginPos,
            int pageSize, int userID) {
            return this.bookmarkMapper.getBookMarkListPage_User(word, beginPos, pageSize, userID);
    }
    
    public ArrayList<BookMark> getBookMarkListPage_Manage(String word, int beginPos,
            int pageSize, int userID) {
            return this.bookmarkMapper.getBookMarkListPage_Manage(word, beginPos, pageSize, userID);
    }

    public int getBookMarkListCount(String word) {
        return this.bookmarkMapper.getBookMarkListCount(word);
    }
    
    public int getBookMarkListCount_User(String word, int userID) {
        return this.bookmarkMapper.getBookMarkListCount_User(word, userID);
    }
    
    public int getBookMarkListCount_Manage(String word, int userID) {
        return this.bookmarkMapper.getBookMarkListCount_Manage(word, userID);
    }

    public BookMark getBookMarkByID(int ID) {
    	BookMark bm = this.bookmarkMapper.getBookMarkByID(ID);
    	this.logMapper.addLog("访问书签", 0, ID, StaticFunc.getDate_YMD());
    	return bm;
    }
    
    public ArrayList<BookMark> getRecentBookMark() {
    	return this.bookmarkMapper.getRecentBookMark();
    }
    
    public ArrayList<BookMark> getPopularBookMark() {
    	return this.bookmarkMapper.getPopularBookMark();
    }

    public boolean addBookMark(String filename, String title, String link, String summary, String date, int userID, ArrayList<String> labels){
    	Img img = new Img();
    	if(filename != null && filename.length() > 0){
	    	
	    	img.setName(filename);
	    	int result = this.bookmarkMapper.saveBookMarkImg(img);
	    	if(result == 0){
	    		return false;
	    	}
    	}else{
    		img.setID(1);
    		img.setName("img-default.jpg");
    	}
    	
		BookMark bm = new BookMark();
		bm.setImg(img);
		bm.setName(title);
		bm.setLink(link);
		bm.setSummary(summary);
		bm.setDate(date);
		User u = new User();
		u.setID(userID);
		bm.setUser(u);
		int res2 = this.bookmarkMapper.addBookMark(bm);
		if(res2 != 0){
			this.logMapper.addLog("添加书签", userID, bm.getID(), StaticFunc.getDate_YMD());
			int res3 = this.bookmarkMapper.addLabels(bm.getID(), labels);
			
			if(res3 != 0) return true;
			else return false;
		}else{
			return false;
		}
    }
    
    public boolean modifyBookMark(String filename, String title, String link, String summary, int bookmarkID, ArrayList<String> labels){
    	if(filename != null && filename.length() > 0){
	    	Img img = new Img();
	    	img.setName(filename);
	    	int result = this.bookmarkMapper.saveBookMarkImg(img);
	    	if(result != 0){
	    		this.bookmarkMapper.modifyBookMarkImg(img.getID(), bookmarkID);
	    	}
    	}
    	
		int res2 = this.bookmarkMapper.modifyBookMark(title, link, summary, bookmarkID);
		if(res2 != 0){
			this.bookmarkMapper.removeLabels(bookmarkID);
			int res3 = this.bookmarkMapper.addLabels(bookmarkID, labels);
			
			if(res3 != 0) return true;
			else return false;
		}
    	return false;
    }

    public boolean removeBookMark(int bookmarkID){
    	return this.bookmarkMapper.removeBookMark(bookmarkID) == 0 ?false: true;    	
    }
    
    public ArrayList<Label> getLabelByBookMarkID(int bookmarkID){
    	return this.bookmarkMapper.getLabelByBookMarkID(bookmarkID);
    }
    
}
