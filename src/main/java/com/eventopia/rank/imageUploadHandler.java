package com.eventopia.rank;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


@WebServlet("/imageUploadHandler")
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 1, // 1MB
	    maxFileSize = 1024 * 1024 * 10,      // 10MB
	    maxRequestSize = 1024 * 1024 * 50    // 50MB
	)
public class imageUploadHandler extends HttpServlet {
       


   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uploadPath = "C:/uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        for (Part part : request.getParts()) {
            String fileName = extractFileName(part);
            if (fileName != null && !fileName.isEmpty()) {
                String filePath = uploadPath + File.separator + fileName;
                part.write(filePath);

                // 이미지 URL 반환
                String imageUrl = "http://localhost:8080/uploads/" + fileName;
                response.setContentType("application/json");
                response.getWriter().write("{\"url\":\"" + imageUrl + "\"}");
            }
        }
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        for (String content : contentDisp.split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf("=") + 2, content.length() - 1);
            }
        }
        return null;
    }
	}


