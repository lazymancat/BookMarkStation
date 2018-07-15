package com.ljm.web.model;

import java.util.ArrayList;

public class BookMark
{
  private int ID;
  private String name;
  private String link;
  private String summary;
  private User user;
  private Img img;
  private int collectNumber;
  private int commentNumber;
  private int shareNumber;
 

public int getShareNumber() {
	return shareNumber;
}

public void setShareNumber(int shareNumber) {
	this.shareNumber = shareNumber;
}

private String date;
  private ArrayList<Label> labels;
  
  public int getID()
  {
    return this.ID;
  }
  
  public void setID(int iD)
  {
    this.ID = iD;
  }
  
  public String getName()
  {
    return this.name;
  }
  
  public void setName(String name)
  {
    this.name = name;
  }
  
  public String getLink()
  {
    return this.link;
  }
  
  public void setLink(String link)
  {
    this.link = link;
  }
  
  public String getSummary()
  {
    return this.summary;
  }
  
  public void setSummary(String summary)
  {
    this.summary = summary;
  }
  
  public User getUser()
  {
    return this.user;
  }
  
  public void setUser(User user)
  {
    this.user = user;
  }
  
  public Img getImg()
  {
    return this.img;
  }
  
  public void setImg(Img img)
  {
    this.img = img;
  }

	public int getCollectNumber() {
		return collectNumber;
	}
	
	public void setCollectNumber(int collectNumber) {
		this.collectNumber = collectNumber;
	}

	 public int getCommentNumber() {
		return commentNumber;
	}

	public void setCommentNumber(int commentNumber) {
		this.commentNumber = commentNumber;
	}
	
	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public ArrayList<Label> getLabels() {
		return labels;
	}

	public void setLabels(ArrayList<Label> labels) {
		this.labels = labels;
	}

}
