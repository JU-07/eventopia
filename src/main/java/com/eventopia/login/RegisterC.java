package com.eventopia.login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eventopia.main.DBManager;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/RegisterC")
public class RegisterC extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setAttribute("content", "jsp/login/register.jsp");
		
		request.getRequestDispatcher("index.jsp").forward(request, response);
	
	}

	 protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	        request.setCharacterEncoding("UTF-8");
	        
	        // 위치 설
	        String path = request.getServletContext().getRealPath("jsp/login/userImg");
			System.out.println(path);
			
			MultipartRequest rp = new MultipartRequest(request, path, 1024 * 1024 * 20, "utf-8",
					new DefaultFileRenamePolicy());
			
	        // 클라이언트로부터 데이터 받기
	        String userId = rp.getParameter("userId");
	        String userPw = rp.getParameter("userPw");
	        String userName = rp.getParameter("userName");
	        String userProfile = rp.getParameter("userProfile"); // 파일 경로 또는 URL
	        
	    	System.out.println("userId : " + userId);
	    	System.out.println("userPW : " + userPw);
	    	System.out.println("userName : " + userName);
	    	System.out.println("userProfile : " +userProfile);
	    	
	        // 회원가입 메서드 호출
	        String result = LoginDAO.register(userId, userPw, userName, userProfile);

	        // login page
	        if (result.equals("Registration Success")) {
	        	request.setAttribute("content", "jsp/login/login.jsp");
	        	request.getRequestDispatcher("index.jsp").forward(request, response);	        	
	        } else if(result.equals("Registration Failed")) {
	        	System.out.println(result);
	        }
	    }
}
