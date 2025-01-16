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
		ResultSet rs = null;

		String sql = "select * from review_test";

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
		} finally {
			DBManager.close(con, pstmt, rs);
		}

	}

	public void ReviewDetail(HttpServletRequest request) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String no = request.getParameter("no");

		try {
			String sql = "select * from review_test where r_no=?";
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
		} finally {
			DBManager.close(con, pstmt, rs);
		}

	}

	public void addReview(HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");

		PreparedStatement pstmt = null;
		String sql = "insert into review_test values(review_test_seq.nextval,?,?,?,?,?,sysdate);";

		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			String title = request.getParameter("title");
			String name = request.getParameter("name");
			String img = request.getParameter("img");
			String sub = request.getParameter("sub");
			String text = request.getParameter("text");

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
		}

	}

}
