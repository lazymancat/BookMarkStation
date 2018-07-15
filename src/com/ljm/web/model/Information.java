package com.ljm.web.model;

public class Information {
	private int ID;
	private String content;
	private int type;
	private String date;
	private int isChecked;
	private User fromUser;
	private int toUserID;
	private BookMark bookmark;
	
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getIsChecked() {
		return isChecked;
	}
	public void setIsChecked(int isChecked) {
		this.isChecked = isChecked;
	}
	public User getFromUser() {
		return fromUser;
	}
	public void setFromUser(User fromUser) {
		this.fromUser = fromUser;
	}
	public int getToUserID() {
		return toUserID;
	}
	public void setToUserID(int toUserID) {
		this.toUserID = toUserID;
	}
	public BookMark getBookmark() {
		return bookmark;
	}
	public void setBookmark(BookMark bookmark) {
		this.bookmark = bookmark;
	}
}
