package com.eventopia.event;

import java.util.Date;

import com.google.gson.Gson;

public class EventDTO {

	private int no;
	private String title;
	private String name;
	private String img;
	private String sub;
	private String text;
	private Date date;

	public EventDTO() {
		// TODO Auto-generated constructor stub
	}

	public EventDTO(int no, String title, String name, String img, String sub, String text, Date date) {
		super();
		this.no = no;
		this.title = title;
		this.name = name;
		this.img = img;
		this.sub = sub;
		this.text = text;
		this.date = date;

	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getSub() {
		return sub;
	}

	public void setSub(String sub) {
		this.sub = sub;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "EventDTO [no=" + no + ", title=" + title + ", name=" + name + ", img=" + img + ", sub=" + sub
				+ ", text=" + text + ", date=" + date + "]";
	}

	public String toJsonByMe() {
		Gson gson = new Gson();
		return gson.toJson(this);
	}

}
