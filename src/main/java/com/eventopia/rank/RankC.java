package com.eventopia.rank;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RankC")
public class RankC extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RankDAO.productAllSelect(request);
		
		request.setAttribute("content", "rank/rank.jsp");
		request.getRequestDispatcher("index.jsp").forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RankDAO.productAllSelect(request);
		RankDAO.rankCount(request);
	request.setAttribute("content", "rank/rank.jsp");
	request.getRequestDispatcher("index.jsp").forward(request, response);
	}

}
