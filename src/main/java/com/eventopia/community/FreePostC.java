package com.eventopia.community;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/FreePostC")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 15)
public class FreePostC extends HttpServlet {

	private CommunityDAO dao = new CommunityDAO();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 文字コード設定
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		// 検索キーワード取得
		String keyword = request.getParameter("keyword");
		List<CommunityDTO> posts;

		if (keyword != null && !keyword.trim().isEmpty()) {
			// 検索キーワードがある場合は検索結果を取得
			posts = dao.searchPostsByKeyword(keyword);
		} else {
			// 検索キーワードがない場合は全投稿を取得
			posts = dao.showAllPost(request);
		}

		// 投稿一覧をリクエストスコープに設定
		request.setAttribute("posts", posts);

		// 投稿一覧ページを表示
		request.setAttribute("content", "jsp/community/ny_freePost.jsp");
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 文字コード設定
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		// 新しい投稿を追加
		dao.addPost(request);

		// 投稿一覧を再取得して表示
		List<CommunityDTO> posts = dao.showAllPost(request);
		request.setAttribute("posts", posts);

		// 投稿一覧テーブル部分をレスポンスとして返す
		request.getRequestDispatcher("jsp/community/postsTable.jsp").forward(request, response);
	}
}
