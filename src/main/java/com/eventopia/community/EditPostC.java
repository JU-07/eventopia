package com.eventopia.community;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/EditPostC")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 15)
public class EditPostC extends HttpServlet {

	private CommunityDAO dao = new CommunityDAO();

	// 編集画面の表示 (GETリクエスト)
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// 投稿IDを取得
			String postIdParam = request.getParameter("p_id");
			if (postIdParam == null || postIdParam.trim().isEmpty()) {
				response.sendError(HttpServletResponse.SC_BAD_REQUEST, "投稿IDが指定されていません。");
				return;
			}

			int postId = Integer.parseInt(postIdParam);
			CommunityDTO post = CommunityDAO.getPostById(postId);

			if (post == null) {
				response.sendError(HttpServletResponse.SC_NOT_FOUND, "投稿が見つかりません。");
				return;
			}

			// 投稿データをリクエストスコープに設定してJSPを表示
			request.setAttribute("post", post);
			request.getRequestDispatcher("jsp/community/ny_editPost.jsp").forward(request, response);

		} catch (NumberFormatException e) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "投稿IDの形式が正しくありません。");
		} catch (Exception e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "エラーが発生しました。");
		}
	}

	// 編集内容の保存 (POSTリクエスト)
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// エンコーディングの設定
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		try {
			// フォームデータを取得
			int postId = Integer.parseInt(request.getParameter("p_id"));
			String name = request.getParameter("name");
			String content = request.getParameter("content");
			Part filePart = request.getPart("img");

			// デフォルトで画像パスは既存のものを保持する
			String imgPath = CommunityDAO.getPostById(postId).getImg();

			// 画像がアップロードされた場合のみ新しいパスをセット
			if (filePart != null && filePart.getSubmittedFileName() != null
					&& !filePart.getSubmittedFileName().isEmpty()) {
				String uploadPath = request.getServletContext().getRealPath("/uploads");
				File uploadDir = new File(uploadPath);
				if (!uploadDir.exists()) {
					uploadDir.mkdir();
				}

				String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
				imgPath = "/uploads/" + fileName;
				filePart.write(uploadPath + File.separator + fileName);
			}

			// DTOにデータを設定
			CommunityDTO post = new CommunityDTO();
			post.setId(postId);
			post.setName(name);
			post.setContent(content);
			post.setImg(imgPath); // 画像パスを上書きまたは保持

			// DAOを使用して投稿を更新
			CommunityDAO.updatePost(post);

			// 投稿一覧ページにリダイレクト
			response.sendRedirect("FreePostC");

		} catch (Exception e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "エラーが発生しました。");
		}
	}
}