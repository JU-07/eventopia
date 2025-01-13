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
		
		String sql = "select * from product_test";
		
	try {
		con = DBManager.connect();
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		reviews = new ArrayList<ReviewDTO>();
		ReviewDTO review = null;
		
		while (rs.next()) { 
			review = new ReviewDTO(); 
			reviews.add(review);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		DBManager.close(con, pstmt, rs);
	}
		
	}

	public void ReviewDetail(HttpServletRequest request) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String no = request.getParameter("no");
		
		try {
			String sql = "select * from product_test where p_no=?";
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, no);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				ReviewDTO review = new ReviewDTO();
				System.out.println(review);
				request.setAttribute("reviews", review);
			}
		
		
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(con, pstmt, rs);
		}
		
	}
	
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	