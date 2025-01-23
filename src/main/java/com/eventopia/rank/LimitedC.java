package com.eventopia.rank;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

@WebServlet("/LimitedC")
public class LimitedC extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RankDAO.RDAO.limitedAllSelect(request, response);
		  
		request.setAttribute("content", "jsp/rank/limited.jsp");
		request.getRequestDispatcher("index.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		RankDAO.RDAO.limitedAllSelect(request, response);
		RankDAO.RDAO.rankCount2(request);
		
		request.setAttribute("content", "jsp/rank/limited.jsp");
		request.getRequestDispatcher("index.jsp").forward(request, response);
		
	}

}
