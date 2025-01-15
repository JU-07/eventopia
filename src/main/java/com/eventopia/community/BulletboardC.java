//package com.eventopia.community;
//
//import java.io.IOException;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.MultipartConfig;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//@WebServlet("/BulletboardC")
//@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 15)
//public class BulletboardC extends HttpServlet {
//    private CommunityDAO dao = new CommunityDAO();
//
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        request.setCharacterEncoding("UTF-8");
//
//        // 新しい投稿を保存
//        dao.addPost(request);
//
//        // 投稿一覧を取得し、部分的なHTMLを生成
//        dao.showAllPost(request);
//        request.getRequestDispatcher("jsp/community/postsTable.jsp").forward(request, response);
//    }
//}
