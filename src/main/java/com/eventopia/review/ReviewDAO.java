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

		String sql = "select * from review_test order by r_date";

		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			reviews = new ArrayList<ReviewDTO>();
			ReviewDTO review = null;

			while (rs.next()) {
				review = new ReviewDTO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getDate(7));
				reviews.add(review);
			}
			request.setAttribute("reviews", reviews);
			
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
			pstmt.setString(1, no);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				ReviewDTO review = new ReviewDTO();
				System.out.println(review);
				request.setAttribute("reviews", reviews);
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

		String sql = "insert into review_test values(review_test_seq.nextval,?,?,?,?,?,sysdate)";

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

	public void paging(int pageNum, HttpServletRequest request) {
		  request.setAttribute("curPageNum", pageNum);

	        int total = reviews.size();
	        int count = 3;

	        // 페이지수

	        int pageCount = (int) Math.ceil((double)total / count);
	        System.out.println(pageCount); //페이지 개수 (총페이지수)
	        request.setAttribute("pageCount", pageCount);

	        // start, end
	        int start = total - (count * (pageNum - 1));
//	        int 시작데이터번호2 = 총데이터수 - (한페이지당보여줄개수 * (페이지번호 - 1));
	        // 4 = 4 - 

	        int end = (pageNum == pageCount) ? -1 : start - (count + 1);
//	        int 끝데이터번호2 = (체이지번호 == 총페이지수) ? -1 : 시작데이터번호2 - (한페이지당보여줄개수 + 1);

	        ArrayList<ReviewDTO> items = new ArrayList<ReviewDTO>();

	        for (int i = start -1; i > end; i--) {
	            items.add(reviews.get(i));
	        }
	        request.setAttribute("reviews", items);

	    }
		
}
