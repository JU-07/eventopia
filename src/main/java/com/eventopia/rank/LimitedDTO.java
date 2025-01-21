package com.eventopia.rank;

import java.util.Date;

public class LimitedDTO {
private int id;
private String title;
private String p_actor;
private String p_img;
private String content;
private Date created_at;


public LimitedDTO() {
	// TODO Auto-generated constructor stub
}


public LimitedDTO(int id, String title, String p_actor, String p_img, String content, Date created_at) {
	super();
	this.id = id;
	this.title = title;
	this.p_actor = p_actor;
	this.p_img = p_img;
	this.content = content;
	this.created_at = created_at;
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


public String getP_actor() {
	return p_actor;
}


public void setP_actor(String p_actor) {
	this.p_actor = p_actor;
}


public String getP_img() {
	return p_img;
}


public void setP_img(String p_img) {
	this.p_img = p_img;
}


public String getContent() {
	return content;
}


public void setContent(String content) {
	this.content = content;
}


public Date getCreated_at() {
	return created_at;
}


public void setCreated_at(Date created_at) {
	this.created_at = created_at;
}





}
