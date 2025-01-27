package com.eventopia.review;

import java.io.IOException;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eventopia.main.DBManager;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import java.text.SimpleDateFormat;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.time.chrono.JapaneseChronology;
import java.time.chrono.JapaneseDate;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;

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

		String sql = "select * from review_post order by created_at";

		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			reviews = new ArrayList<ReviewDTO>();
			ReviewDTO review = null;

			while (rs.next()) {
				review = new ReviewDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getDate(6));
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
		String id = request.getParameter("id");

		try {
			String sql = "select * from review_test where id=?";
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
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

	public void reviewAdd2(HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO review_post (title, r_sub, r_img, content,  created_at) VALUES (?, ?, ?, ?, sysdate)";
		try {
			Connection con = DBManager.connect();
			String title = request.getParameter("title");
			String sub = request.getParameter("sub");
			String img = request.getParameter("img");
			String content = request.getParameter("content"); // HTML 데이터 포함

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, title);
			pstmt.setString(2, sub);
			pstmt.setString(3, img);
			pstmt.setString(4, content);

			if (pstmt.executeUpdate() == 1) {
				System.out.println("글 등록 성공");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, null);
		}
	}

	public void addReview(HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");

		PreparedStatement pstmt = null;
		String sql = "insert insert into review_test values(review_test_seq.nextval,?,?,?,?,?,sysdate)";

		// String path = request.getServletContext().getRealPath("");
		// System.out.println(path);

		try {
			// MultipartRequest mr = new MultipartRequest(request, path, 1024 * 1024 *
			// 30,"UTF-8", new DefaultFileRenamePolicy());

			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);

			String name = request.getParameter("name");
			String title = request.getParameter("title");
			String img = request.getParameter("img");
			String sub = request.getParameter("sub");
			String text = request.getParameter("text");

			System.out.println(name);
			System.out.println(title);
			System.out.println(img);
			System.out.println(sub);
			System.out.println(text);

			pstmt.setString(1, name);
			pstmt.setString(2, title);
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

	    int total = reviews.size(); // 총 데이터 수
	    int count = 3; // 한 페이지에 표시할 데이터 수

	    // 페이지 수 계산
	    int pageCount = (int) Math.ceil((double) total / count);
	    request.setAttribute("pageCount", pageCount);

	    // start, end 계산 (역순으로 데이터를 출력하도록 수정)
	    int start = total - (count * (pageNum - 1)); // 시작 인덱스
	    int end = (pageNum == pageCount) ? -1 : start - (count + 1); // 끝 인덱스 (마지막 페이지는 -1로 처리)

	    // 해당 페이지에 맞는 데이터를 추출 (역순)
	    ArrayList<ReviewDTO> items = new ArrayList<>();
	    for (int i = start - 1; i > end; i--) {
	        items.add(reviews.get(i)); // 역순으로 데이터를 추가
	    }
	    request.setAttribute("reviews", items);

	    // 페이지 네비게이션 활성화 설정
	    request.setAttribute("hasNext", pageNum < pageCount); // "다음 페이지" 버튼 활성화 여부
	    request.setAttribute("hasPrev", pageNum > 1); // "이전 페이지" 버튼 활성화 여부
	}


	public void showPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int postId = Integer.parseInt(request.getParameter("id"));

		String sql = "SELECT title, content, r_img, r_sub, created_at FROM review_post WHERE id = ?";
		try (Connection con = DBManager.connect(); PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setInt(1, postId);

			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				String title = rs.getString("title");
				String content = rs.getString("content");
				String img = rs.getString("r_img");
				String sub = rs.getString("r_sub");
				String createdAt = rs.getString("created_at"); // DB의 UTC 시간

				// 1. UTC 시간 -> 일본 도쿄 시간으로 변환
				SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				inputFormat.setTimeZone(TimeZone.getTimeZone("UTC")); // DB 시간이 UTC 기준

				Date date = inputFormat.parse(createdAt); // UTC 시간 -> Date 객체

				// Date 객체를 ZonedDateTime으로 변환
				ZonedDateTime zonedDateTime = date.toInstant().atZone(TimeZone.getTimeZone("Asia/Tokyo").toZoneId());

				// 일본 도쿄 시간의 포맷 지정 (한글로 표시)
				DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy年 M月 d日 H時 m分 s秒");

				// 변환된 시간 문자열
				String japanTime = zonedDateTime.format(formatter);
				JapaneseDate japaneseDate = JapaneseDate.from(zonedDateTime);
				DateTimeFormatter japaneseFormatter = DateTimeFormatter
						.ofPattern("GGGG y年 M月 d日", Locale.JAPAN).withChronology(JapaneseChronology.INSTANCE);
				String japaneseEraDate = japaneseFormatter.format(japaneseDate);

				// 2. JSP에 데이터를 전달
				request.setAttribute("title", title);
				request.setAttribute("contentt", content);
				request.setAttribute("img", img);
				request.setAttribute("sub", sub);
				request.setAttribute("created_at", japanTime);
				request.setAttribute("created_at_era", japaneseEraDate); // 일본 연호 날짜

			} else {
				// 데이터가 없을 경우 처리
				response.getWriter().write("No post found with the provided ID.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().write("An error occurred while retrieving the post.");
		}
	}

}
