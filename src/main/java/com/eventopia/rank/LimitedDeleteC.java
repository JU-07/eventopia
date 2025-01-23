package com.eventopia.rank;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LimitedDeleteC")
public class LimitedDeleteC extends HttpServlet {
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RankDAO.RDAO.limitAllSelect(request);  	
		request.setAttribute("content", "jsp/rank/limitedDelete.jsp");
			request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RankDAO.RDAO.limitedDelete(request);
	response.sendRedirect("LimitedDeleteC");
	}

}
