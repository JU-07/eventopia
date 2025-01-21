package com.eventopia.community;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeletePostC")
public class DeletePostC extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// 投稿IDを取得
			int postId = Integer.parseInt(request.getParameter("p_id"));

			// 削除処理
			CommunityDAO.deletePost(postId);

			// 投稿一覧にリダイレクト
			response.sendRedirect("CommunityC");

		} catch (Exception e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "投稿の削除中にエラーが発生しました。");
		}
	}
}
