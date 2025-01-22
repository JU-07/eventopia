package com.eventopia.login;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/LoginC")
public class LoginC extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setAttribute("content", "jsp/login/login.jsp");
		
		request.getRequestDispatcher("index.jsp").forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

        request.setCharacterEncoding("UTF-8");

        String id = request.getParameter("id");
        String pw = request.getParameter("pw");

        // 로그인 처리
        String result = LoginDAO.login(id, pw);
        
        if ("Login Success".equals(result)) {
            // 세션에 사용자 ID 저장
            request.getSession().setAttribute("userId", id);

            // 성공 메시지를 설정하고 index.jsp로 포워드
            request.setAttribute("message", "Login Success");
            request.setAttribute("content", "jsp/mypage/mypage.jsp");	// mypage
            request.getRequestDispatcher("index.jsp").forward(request, response);
            
        } else {
        	System.out.println("login failed!");
        	// 로그인 실패 시 다시 로그인 페이지로 리다이렉트
            request.setAttribute("loginError", "This account is not registered.");
            request.setAttribute("content", "jsp/login/login.jsp");	// login page
            request.getRequestDispatcher("index.jsp").forward(request, response);
            
        }
	}

}
