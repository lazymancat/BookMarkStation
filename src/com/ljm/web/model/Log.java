package com.ljm.web.model;

public class Log {
	private int ID;
	private String type;
	private int userID;
	private int bookmarkID;
	private User user;
	private BookMark bookmark;
	private String date;
	
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public BookMark getBookmark() {
		return bookmark;
	}
	public void setBookmark(BookMark bookmark) {
		this.bookmark = bookmark;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public int getBookmarkID() {
		return bookmarkID;
	}
	public void setBookmarkID(int bookmarkID) {
		this.bookmarkID = bookmarkID;
	}	
	
}
