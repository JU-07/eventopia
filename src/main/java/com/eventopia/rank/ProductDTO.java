package com.eventopia.rank;

public class ProductDTO {
	int p_no;
	String p_name;
	String p_exp;
	int p_price;
	String p_category;
	String image_url;
	
	
	public ProductDTO() {
		// TODO Auto-generated constructor stub
	}


	public ProductDTO(int p_no, String p_name, String p_exp, int p_price, String p_category, String image_url) {
		super();
		this.p_no = p_no;
		this.p_name = p_name;
		this.p_exp = p_exp;
		this.p_price = p_price;
		this.p_category = p_category;
		this.image_url = image_url;
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


	public String getP_exp() {
		return p_exp;
	}


	public void setP_exp(String p_exp) {
		this.p_exp = p_exp;
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


	public String getImage_url() {
		return image_url;
	}


	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}
	
	
	
}
