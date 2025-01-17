package com.eventopia.review;

import java.io.UnsupportedEncodingException;
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
		
		String sql = "select * from product_test order by p_count desc";
		
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
		request.setAttribute("reviews", review);
		
		
		
		
		
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
		int no = Integer.parseInt("no");
		
		try {
			String sql = "select * from post_test where p_no=?";
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, no);
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

	public void addReview(HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		
		PreparedStatement pstmt = null;
<<<<<<< HEAD
		String sql = "insert into review_test values(review_test_seq.nextval,?,?,?,?,?,sysdate)";

		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			String title = request.getParameter("title");
			String name = request.getParameter("name");
			String img = request.getParameter("img");
			String sub = request.getParameter("sub");
			String text = request.getParameter("text");
			String date = request.getParameter("date");

			System.out.println(title);
			System.out.println(name);
			System.out.println(img);
			System.out.println(sub);
			System.out.println(text);
			
			pstmt.setString(1, title);
			pstmt.setString(2, name);
			pstmt.setString(3, img);
			pstmt.setString(4, sub);
			pstmt.setString(5, text);

			if (pstmt.executeUpdate() == 1) {
				System.out.println("등록 성공");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, null);
=======
		String sql = "insert into product_test values(product_test_seq.nextval,?,?,?,?)";
	try {
		String title = request.getParameter("name");
		String actor = request.getParameter("actor");
		String image = request.getParameter("image");
		String story = request.getParameter("story");
		
		pstmt.setString(1, title);
		pstmt.setString(2, actor);
		pstmt.setString(3, image);
		pstmt.setString(4, story);
		
		if (pstmt.executeUpdate() == 1) {
			System.out.println("등록 성공");
>>>>>>> 5a3827279526cbe657cff672aae1b7031d9a66e7
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		DBManager.close(con, pstmt, null);
	}
	
	
	}
	
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	