package com.eventopia.community;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/FreePostC2")
public class FreePostC2 extends HttpServlet {
	private CommunityDAO dao = new CommunityDAO();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 文字コード設定
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		dao.showAllPost(request);
		
		request.setAttribute("content", "jsp/community/ny_freePost2.jsp");
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 文字コード設定
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

	}
}
