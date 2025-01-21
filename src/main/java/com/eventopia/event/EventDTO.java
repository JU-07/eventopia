package com.eventopia.event;

import java.util.Date;

import com.google.gson.Gson;

public class EventDTO {

	private int e_no;
	private String e_name;
	private String e_title;
	private String e_image_url;
	private String e_story;
	private Date e_date;
	private int e_good;

	public EventDTO() {
		// TODO Auto-generated constructor stub
	}

	public EventDTO(int e_no, String e_name, String e_title, String e_image_url, String e_story, Date e_date,
			int e_good) {
		super();
		this.e_no = e_no;
		this.e_name = e_name;
		this.e_title = e_title;
		this.e_image_url = e_image_url;
		this.e_story = e_story;
		this.e_date = e_date;
		this.e_good = e_good;
	}

	public int getE_no() {
		return e_no;
	}

	public void setE_no(int e_no) {
		this.e_no = e_no;
	}

	public String getE_name() {
		return e_name;
	}

	public void setE_name(String e_name) {
		this.e_name = e_name;
	}

	public String getE_title() {
		return e_title;
	}

	public void setE_title(String e_title) {
		this.e_title = e_title;
	}

	public String getE_image_url() {
		return e_image_url;
	}

	public void setE_image_url(String e_image_url) {
		this.e_image_url = e_image_url;
	}

	public String getE_story() {
		return e_story;
	}

	public void setE_story(String e_story) {
		this.e_story = e_story;
	}

	public Date getE_date() {
		return e_date;
	}

	public void setE_date(Date e_date) {
		this.e_date = e_date;
	}

	public int getE_good() {
		return e_good;
	}

	public void setE_good(int e_good) {
		this.e_good = e_good;
	}

	@Override
	public String toString() {
		return "EventDTO [e_no=" + e_no + ", e_name=" + e_name + ", e_title=" + e_title + ", e_image_url=" + e_image_url
				+ ", e_story=" + e_story + ", e_date=" + e_date + ", e_good=" + e_good + "]";
	}

	public String toJsonByMe() {
		Gson gson = new Gson();
		return gson.toJson(this);
	}
}