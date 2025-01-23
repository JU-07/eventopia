package com.eventopia.login;

import java.io.File;
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
	    
	    // 파일 저장 경로 설정
	    String path = request.getServletContext().getRealPath("jsp/login/userImg");
	    System.out.println("File Upload Path: " + path);

	    // 디렉토리 생성
	    File uploadDir = new File(path);
	    if (!uploadDir.exists()) {
	        uploadDir.mkdirs();
	    }

	    // MultipartRequest 생성
	    MultipartRequest rp = new MultipartRequest(request, path, 1024 * 1024 * 20, "utf-8",
	            new DefaultFileRenamePolicy());

	    // 클라이언트로부터 데이터 받기
	    String userId = rp.getParameter("userId");
	    String userPw = rp.getParameter("userPw");
	    String userName = rp.getParameter("userName");
	    String userProfile = rp.getFilesystemName("userProfile"); // 업로드된 파일 이름

	    System.out.println("userId : " + userId);
	    System.out.println("userPW : " + userPw);
	    System.out.println("userName : " + userName);
	    System.out.println("userProfile : " + userProfile);

	    // 회원가입 메서드 호출
	    String result = LoginDAO.register(userId, userPw, userName, userProfile);

	    // 로그인 페이지로 이동
	    if (result.equals("Registration Success")) {
	        request.setAttribute("content", "jsp/login/login.jsp");
	        request.getRequestDispatcher("index.jsp").forward(request, response);
	    } else {
	        response.getWriter().println("Registration Failed");
	    }
	}
}
