package com.eventopia.rank;

import java.util.Date;

public class RankPageDTO {
	private int p_no;
	private String p_title;
	private String p_actor;
	private String p_img;
	private String p_story;
	private Date p_date;

	public RankPageDTO(int p_no, String p_title, String p_actor, String p_img, String p_story, Date p_date) {
		super();
		this.p_no = p_no;
		this.p_title = p_title;
		this.p_actor = p_actor;
		this.p_img = p_img;
		this.p_story = p_story;
		this.p_date = p_date;
	}

	public RankPageDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public String getP_title() {
		return p_title;
	}

	public void setP_title(String p_title) {
		this.p_title = p_title;
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

	public String getP_story() {
		return p_story;
	}

	public void setP_story(String p_story) {
		this.p_story = p_story;
	}

	public Date getP_date() {
		return p_date;
	}

	public void setP_date(Date p_date) {
		this.p_date = p_date;
	}

}
