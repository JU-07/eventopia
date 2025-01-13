package com.eventopia.review;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ReviewDetailC")
public class ReviewDetailC extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 ReviewDAO.RDAO.ReviewDetail(request);	
	
	 request.setAttribute("content", "jsp/review/review.jsp");
	 request.getRequestDispatcher("index.jsp").forward(request, response);
	 
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}