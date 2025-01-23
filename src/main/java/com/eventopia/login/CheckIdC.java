package com.eventopia.login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CheckIdC")
public class CheckIdC extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String userId = request.getParameter("userId"); // 클라이언트로부터 전달받은 아이디

		// DB에서 아이디 존재 여부 확인
		boolean exists = LoginDAO.isUserIdExists(userId);
		System.out.println("check id : " + exists);
		
		// 클라이언트에 결과 전달
		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");
		if (exists) {
			response.getWriter().write("exists"); // 아이디가 존재하는 경우
		} else {
			response.getWriter().write("not_exists"); // 아이디가 없는 경우
		}
		
	}
}
