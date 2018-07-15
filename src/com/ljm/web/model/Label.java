package com.ljm.web.model;

public class Label {
	private int ID;
	private String name;
	private int bookmarkID;
	
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getBookmarkID() {
		return bookmarkID;
	}
	public void setBookmarkID(int bookmarkID) {
		this.bookmarkID = bookmarkID;
	}
}
