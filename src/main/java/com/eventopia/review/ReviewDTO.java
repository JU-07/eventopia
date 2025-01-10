package com.eventopia.review;

import com.google.gson.Gson;

public class ReviewDTO {

private String name;
private String title;
private String img;
private String text;

public ReviewDTO() {
	// TODO Auto-generated constructor stub
}

public ReviewDTO(String name, String title, String img, String text) {
	super();
	this.name = name;
	this.title = title;
	this.img = img;
	this.text = text;
}

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}

public String getTitle() {
	return title;
}

public void setTitle(String title) {
	this.title = title;
}

public String getImg() {
	return img;
}

public void setImg(String img) {
	this.img = img;
}

public String getText() {
	return text;
}

public void setText(String text) {
	this.text = text;
}

@Override
public String toString() {
	return "ReviewDTO [name=" + name + ", title=" + title + ", img=" + img + ", text=" + text + "]";
}
public String toJsonByMe() {
	Gson gson = new Gson();
	return gson.toJson(this);
}





}
