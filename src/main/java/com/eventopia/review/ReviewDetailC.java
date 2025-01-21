package com.eventopia.review;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eventopia.main.DBManager;

@WebServlet("/ReviewDetailC")
public class ReviewDetailC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ReviewDAO.RDAO.showPost(request, response);
		request.setAttribute("content", "jsp/review/reviewDetail.jsp");
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

}

