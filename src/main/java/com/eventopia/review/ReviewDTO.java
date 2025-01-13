package com.eventopia.review;

import com.google.gson.Gson;

public class ReviewDTO {

	private int p_no;
	private String p_name;
	private int p_price;
	private String p_category;
	private int p_img;

	public ReviewDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public String getP_category() {
		return p_category;
	}

	public void setP_category(String p_category) {
		this.p_category = p_category;
	}

	public int getP_img() {
		return p_img;
	}

	public void setP_img(int p_img) {
		this.p_img = p_img;
	}

	public ReviewDTO(int p_no, String p_name, int p_price, String p_category, int p_img) {
		super();
		this.p_no = p_no;
		this.p_name = p_name;
		this.p_price = p_price;
		this.p_category = p_category;
		this.p_img = p_img;
	}
	

	@Override
	public String toString() {
		return "ReviewDTO [p_no=" + p_no + ", p_name=" + p_name + ", p_price=" + p_price + ", p_category=" + p_category
				+ ", p_img=" + p_img + "]";
	}

	public String toJsonByMe() {
		Gson gson = new Gson();
		return gson.toJson(this);
	}

}
