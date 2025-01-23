package com.eventopia.community;

import java.sql.Timestamp;

public class CommunityDTO {

	private int id;
	private String name;
	private String img;
	private String content;
	private Timestamp date;

	public CommunityDTO() {
		// TODO Auto-generated constructor stub
	}

	public CommunityDTO(int id, String name, String img, String content, Timestamp date) {
		super();
		this.id = id;
		this.name = name;
		this.img = img;
		this.content = content;
		this.date = date;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "CommunityDTO [id=" + id + ", name=" + name + ", img=" + img + ", content=" + content + ", date=" + date
				+ "]";
	}
	
	
	
	
}