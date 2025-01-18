package com.eventopia.event;

import java.util.Date;

import com.google.gson.Gson;

public class EventDTO {

	private String title;
	private String name;
	private String text;
	private String link;
	private Date sysdate;

	public EventDTO() {
		// TODO Auto-generated constructor stub
	}

	public EventDTO(String title, Date sysdate, String name, String text, String link) {
		super();
		this.title = title;
		this.sysdate = sysdate;
		this.name = name;
		this.text = text;
		this.link = link;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getSysdate() {
		return sysdate;
	}

	public void setSysdate(Date sysdate) {
		this.sysdate = sysdate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	@Override
	public String toString() {
		return "EventDTO [title=" + title + ", sysdate=" + sysdate + ", name=" + name + ", text=" + text + ", link="
				+ link + "]";
	}
}