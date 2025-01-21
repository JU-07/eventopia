package com.eventopia.review;

import java.util.Date;

import com.google.gson.Gson;

public class ReviewDTO {

private	int id;
private	String title;
private	String r_sub;
private	String r_img;
private	String content;
private	Date r_date;

public ReviewDTO() {
	// TODO Auto-generated constructor stub
}

public ReviewDTO(int id, String title, String r_sub, String r_img, String content, Date r_date) {
	super();
	this.id = id;
	this.title = title;
	this.r_sub = r_sub;
	this.r_img = r_img;
	this.content = content;
	this.r_date = r_date;
}

public int getId() {
	return id;
}

public void setId(int id) {
	this.id = id;
}

public String getTitle() {
	return title;
}

public void setTitle(String title) {
	this.title = title;
}

public String getR_sub() {
	return r_sub;
}

public void setR_sub(String r_sub) {
	this.r_sub = r_sub;
}

public String getR_img() {
	return r_img;
}

public void setR_img(String r_img) {
	this.r_img = r_img;
}

public String getContent() {
	return content;
}

public void setContent(String content) {
	this.content = content;
}

public Date getR_date() {
	return r_date;
}

public void setR_date(Date r_date) {
	this.r_date = r_date;
}


}