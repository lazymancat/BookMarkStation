package com.ljm.web.model;

public class User
{
  private int ID;
  private String username;
  private String password;
  private String email;
  private Img img;
  private String birthday;
  private String sex;
  private String description;
  private String rgstDate;
  private int createNum;
  private int collectNum;
  private int commentNum;
  private int focusNum;
  private int beFocusNum;
  private int isBan;
  
  public int getIsBan() {
	return isBan;
}

public void setIsBan(int isBan) {
	this.isBan = isBan;
}

public int getID()
  {
    return this.ID;
  }
  
  public void setID(int ID)
  {
    this.ID = ID;
  }
  
  public String getUsername()
  {
    return this.username;
  }
  
  public void setUsername(String username)
  {
    this.username = username;
  }
  
  public String getPassword()
  {
    return this.password;
  }
  
  public void setPassword(String password)
  {
    this.password = password;
  }
  
  public String getEmail()
  {
    return this.email;
  }
  
  public void setEmail(String email)
  {
    this.email = email;
  }

	public Img getImg() {
		return img;
	}
	
	public void setImg(Img img) {
		this.img = img;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getRgstDate() {
		return rgstDate;
	}

	public void setRgstDate(String rgstDate) {
		this.rgstDate = rgstDate;
	}

	public int getCreateNum() {
		return createNum;
	}

	public void setCreateNum(int createNum) {
		this.createNum = createNum;
	}

	public int getCollectNum() {
		return collectNum;
	}

	public void setCollectNum(int collectNum) {
		this.collectNum = collectNum;
	}

	public int getCommentNum() {
		return commentNum;
	}

	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
	}

	public int getFocusNum() {
		return focusNum;
	}

	public void setFocusNum(int focusNum) {
		this.focusNum = focusNum;
	}

	public int getBeFocusNum() {
		return beFocusNum;
	}

	public void setBeFocusNum(int beFocusNum) {
		this.beFocusNum = beFocusNum;
	}
	
	
}
