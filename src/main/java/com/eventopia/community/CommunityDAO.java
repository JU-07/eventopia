package com.eventopia.community;

import java.io.File;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import com.eventopia.main.DBManager;

public class CommunityDAO {

	// 全ての投稿を取得するメソッド
	public static void showAllPost(HttpServletRequest request) {
		String sql = "SELECT p_name, p_img, p_content, p_date FROM community_post ORDER BY p_date DESC";

		try (Connection con = DBManager.connect();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()) {

			ArrayList<CommunityDTO> posts = new ArrayList<>();

			while (rs.next()) {
				CommunityDTO post = new CommunityDTO();
				post.setName(rs.getString("p_name"));
				post.setImg(rs.getString("p_img"));
				post.setContent(rs.getString("p_content"));
				post.setDate(rs.getTimestamp("p_date"));
				posts.add(post);
			}

			request.setAttribute("posts", posts);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void addPost(HttpServletRequest request) {

		Connection con = null;
		PreparedStatement pstmt = null;

		String sql = "INSERT INTO community_post (p_name, p_img, p_content, p_date) VALUES (?, ?, ?, SYSTIMESTAMP)";

		try {
			// File upload directory setup
			String uploadPath = request.getServletContext().getRealPath("/uploads");
			File uploadDir = new File(uploadPath);
			if (!uploadDir.exists()) {
				uploadDir.mkdir();
			}

			// File upload handling
			Part filePart = request.getPart("img");
			String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
			String filePath = uploadPath + File.separator + fileName;

			// Save file
			if (!fileName.isEmpty()) {
				filePart.write(filePath);
			}

			// Get input data from the form
			String name = request.getParameter("name");
			String content = request.getParameter("content");
			String imgPath = fileName.isEmpty() ? "画像なし" : "/uploads/" + fileName;

			// Insert data into database
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, imgPath);
			pstmt.setString(3, content);

			int result = pstmt.executeUpdate();
			if (result > 0) {
				System.out.println("投稿が成功しました");
			} else {
				System.out.println("投稿に失敗しました");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// Close the resources safely
			try {
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

			try {
				if (con != null) {
					con.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
