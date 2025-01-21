package com.eventopia.rank;

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

@WebServlet("/LimitedDetailC2")
public class LimitedDetailC2 extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // GET 요청을 처리
        showPost(request, response);
      
    }

    public void showPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int postId = Integer.parseInt(request.getParameter("id"));

        String sql = "SELECT title, content FROM limited_post WHERE id = ?";
        try (Connection con = DBManager.connect();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setInt(1, postId);

            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                String title = rs.getString("title");
                String content = rs.getString("content");

                response.setContentType("text/html; charset=UTF-8");
                response.getWriter().write("<html><head><title>" + title + "</title></head>");
                response.getWriter().write("<body>");
                response.getWriter().write("<h1>" + title + "</h1>");
                response.getWriter().write("<div>" + content + "</div>");
                response.getWriter().write("</body></html>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
