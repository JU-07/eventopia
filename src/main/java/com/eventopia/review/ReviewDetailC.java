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

		 showPost(request, response);

	}

	public void showPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int postId = Integer.parseInt(request.getParameter("id"));

        String sql = "SELECT title, content FROM review_post WHERE id = ?";
        try (Connection con = DBManager.connect();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setInt(1, postId);

            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                String title = rs.getString("title");
                String content = rs.getString("content");
                String img = rs.getString("img");
                String sub = rs.getString("sub");
                String date = rs.getString("date");


                
response.setContentType("text/html; charset=UTF-8");
                response.getWriter().write("<html>");
                response.getWriter().write("<head>");
                response.getWriter().write("<title>" + title + "</title>");
                response.getWriter().write("<style>");
                response.getWriter().write("body { display: flex; flex-direction: column; align-items: center; justify-content: center; height: 100vh; margin: 0; }");
                response.getWriter().write("h1 { text-align: center; }");
                response.getWriter().write("div { text-align: center; max-width: 600px; }");
                response.getWriter().write("</style>");
                response.getWriter().write("</head>");
                response.getWriter().write("<body>");
                response.getWriter().write("<h1>" + title + "</h1>");
                response.getWriter().write("<div>" + content + "</div>");
                response.getWriter().write("</body>");
                response.getWriter().write("</html>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}


