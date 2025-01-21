package com.eventopia.community;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import com.eventopia.main.DBManager;

public class CommunityDAO {

	public static void showAllPost(HttpServletRequest request) {
		String sql = "SELECT p_id, p_name, p_img, p_content, p_date FROM community_post ORDER BY p_date DESC";

		try (Connection con = DBManager.connect();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()) {

			ArrayList<CommunityDTO> posts = new ArrayList<>();
			while (rs.next()) {
				CommunityDTO post = new CommunityDTO();
				post.setId(rs.getInt("p_id"));
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
		String sql = "INSERT INTO community_post (p_name, p_img, p_content, p_date) VALUES (?, ?, ?, SYSTIMESTAMP)";
		try (Connection con = DBManager.connect();
				PreparedStatement pstmt = con.prepareStatement(sql, new String[] { "p_id" })) {

			String uploadPath = request.getServletContext().getRealPath("/uploads");
			File uploadDir = new File(uploadPath);
			if (!uploadDir.exists()) {
				uploadDir.mkdir();
			}

			Part filePart = request.getPart("img");
			String fileName = filePart != null ? Paths.get(filePart.getSubmittedFileName()).getFileName().toString()
					: "";
			String imgPath = fileName.isEmpty() ? "画像なし" : "/uploads/" + fileName;

			if (!fileName.isEmpty()) {
				try {
					filePart.write(uploadPath + File.separator + fileName);
				} catch (IOException e) {
					System.out.println("画像アップロードに失敗しました: " + e.getMessage());
					imgPath = "画像なし";
				}
			}

			String name = request.getParameter("name");
			String content = request.getParameter("content");

			pstmt.setString(1, name);
			pstmt.setString(2, imgPath);
			pstmt.setString(3, content);

			int result = pstmt.executeUpdate();
			if (result > 0) {
				try (ResultSet rs = pstmt.getGeneratedKeys()) {
					if (rs.next()) {
						int generatedId = rs.getInt(1);
						System.out.println("Generated Post ID: " + generatedId);
					}
				}
			} else {
				System.out.println("投稿に失敗しました");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static CommunityDTO getPostById(int postId) {
		String sql = "SELECT * FROM community_post WHERE p_id = ?";
		try (Connection con = DBManager.connect(); PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setInt(1, postId);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					return new CommunityDTO(rs.getInt("p_id"), rs.getString("p_name"), rs.getString("p_img"),
							rs.getString("p_content"), rs.getTimestamp("p_date"));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public static void updatePost(CommunityDTO post) {
		String sql = "UPDATE community_post SET p_name = ?, p_content = ?, p_img = ? WHERE p_id = ?";
		try (Connection con = DBManager.connect(); PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setString(1, post.getName());
			pstmt.setString(2, post.getContent());
			pstmt.setString(3, post.getImg()); // 画像が変更されていない場合も上書き
			pstmt.setInt(4, post.getId());
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void deletePost(int postId) {
		String sql = "DELETE FROM community_post WHERE p_id = ?";
		try (Connection con = DBManager.connect(); PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setInt(1, postId);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
