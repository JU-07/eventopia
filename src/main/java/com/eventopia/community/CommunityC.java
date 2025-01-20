package com.eventopia.community;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/CommunityC")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 15)
public class CommunityC extends HttpServlet {
	
	private CommunityDAO dao = new CommunityDAO();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		dao.showAllPost(request);
		request.setAttribute("content", "jsp/community/ny_community.jsp");
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		// 文字コード設定
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		dao.addPost(request);
		dao.showAllPost(request);
		
		// jsp/community/postsTable.jsp をレスポンスとして返す
		request.getRequestDispatcher("jsp/community/postsTable.jsp").forward(request, response);


	}

}
















