package com.eventopia.login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eventopia.main.DBManager;

@WebServlet("/RegisterC")
public class RegisterC extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("content", "jsp/login/register.jsp");
		
		request.getRequestDispatcher("index.jsp").forward(request, response);
	
	
	}

	 protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	        request.setCharacterEncoding("UTF-8");
	        // 클라이언트로부터 데이터 받기
	        String userId = request.getParameter("userId");
	        String userPw = request.getParameter("userPw");
	        String userName = request.getParameter("userName");
	        String userProfile = request.getParameter("userProfile"); // 파일 경로 또는 URL

	        // 회원가입 메서드 호출
	        String result = LoginDAO.register(userId, userPw, userName, userProfile);

	        // 결과에 따라 적절한 처리
	        response.setContentType("text/plain");
	        response.getWriter().write(result);
	    }
}
