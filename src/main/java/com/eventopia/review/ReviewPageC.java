package com.eventopia.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ReviewPageC")
public class ReviewPageC extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//	
//		ReviewDAO.showAllReview(request);
		int p = Integer.parseInt(request.getParameter("p")); 
//		ReviewDAO.paging(p, request);
		
		ReviewDAO.RDAO.showAllReview(request);
		ReviewDAO.RDAO.paging(p, request);
		
		request.setAttribute("content", "jsp/review/review.jsp");
		request.getRequestDispatcher("index.jsp").forward(request, response);	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
