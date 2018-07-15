package com.ljm.web.model;

public class Comment {
	private int ID;
	
	private String content;
	private String date;
	private User user;
	private BookMark bookmark;
	
	public int getID() {
		return ID;
	}
	public void setID(int ID) {
		this.ID = ID;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
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
}
