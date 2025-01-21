package com.eventopia.community;

import java.io.IOException;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/UpdatePostC")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 15)
public class UpdatePostC extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // フォームから投稿データを取得
            int postId = Integer.parseInt(request.getParameter("p_id"));
            String name = request.getParameter("name");
            String content = request.getParameter("content");

            // 画像処理
            Part filePart = request.getPart("img");
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String imgPath = fileName.isEmpty() ? null : "/uploads/" + fileName;

            // DTOにセット
            CommunityDTO post = new CommunityDTO(postId, name, imgPath, content, null);

            // 更新処理
            CommunityDAO.updatePost(post);

            // 投稿一覧にリダイレクト
            response.sendRedirect("CommunityC");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "投稿の更新中にエラーが発生しました。");
        }
    }
}

