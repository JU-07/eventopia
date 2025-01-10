package com.eventopia.review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.eventopia.main.DBManager;


public class ReviewDAO {

	public static final ReviewDAO RDAO = new ReviewDAO();
	private Connection con = null;
	
	private ReviewDAO() {
		try {
			con = DBManager.connect();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
ArrayList<ReviewDTO> reviews = null;
	
	public void showAllReview(HttpServletRequest request) {
		
		PreparedStatement pstmt = null;
		ResultSet rs  = null;
		
		String sql = "select * from ";
		
	try {
		con = DBManager.connect();
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		reviews = new ArrayList<ReviewDTO>();
		ReviewDTO review = null;
		
		while (rs.next()) { 
			review = new ReviewDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4)); 
			reviews.add(review);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		DBManager.close(con, pstmt, rs);
	}
		
	}
	
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	