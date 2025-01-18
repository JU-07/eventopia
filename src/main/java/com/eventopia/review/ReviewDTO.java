package com.eventopia.review;

import java.util.Date;

import com.google.gson.Gson;

public class ReviewDTO {

private	int r_no;
private	String r_name;
private	String r_title;
private	String r_img;
private	String r_sub;
private	String r_text;
private	Date r_date;

public ReviewDTO() {
	// TODO Auto-generated constructor stub
}

public int getR_no() {
	return r_no;
}

public void setR_no(int r_no) {
	this.r_no = r_no;
}

public String getR_name() {
	return r_name;
}

public void setR_name(String r_name) {
	this.r_name = r_name;
}

public String getR_title() {
	return r_title;
}

public void setR_title(String r_title) {
	this.r_title = r_title;
}

public String getR_img() {
	return r_img;
}

public void setR_img(String r_img) {
	this.r_img = r_img;
}

public String getR_sub() {
	return r_sub;
}

public void setR_sub(String r_sub) {
	this.r_sub = r_sub;
}

public String getR_text() {
	return r_text;
}

public void setR_text(String r_text) {
	this.r_text = r_text;
}

public Date getR_date() {
	return r_date;
}

public void setR_date(Date r_date) {
	this.r_date = r_date;
}

public ReviewDTO(int r_no, String r_name, String r_title, String r_img, String r_sub, String r_text, Date r_date) {
	super();
	this.r_no = r_no;
	this.r_name = r_name;
	this.r_title = r_title;
	this.r_img = r_img;
	this.r_sub = r_sub;
	this.r_text = r_text;
	this.r_date = r_date;
}

public String toJsonByMe() {
	Gson gson = new Gson();
	return gson.toJson(this);
}

}