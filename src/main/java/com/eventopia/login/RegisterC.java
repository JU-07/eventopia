package com.eventopia.login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegisterC")
public class RegisterC extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	
	}

	 protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	        request.setCharacterEncoding("UTF-8");

	        String userId = request.getParameter("userId");
	        String userPw = request.getParameter("userPw");
	        String userName = request.getParameter("userName");

	        boolean isRegistered = LoginDAO.register(userId, userPw, userName);

	        if (isRegistered) {
	            response.sendRedirect("login.jsp?register=success");
	        } else {
	            response.sendRedirect("register.jsp?error=Registration Failed");
	        }
	    }
}
