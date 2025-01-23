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
        RankDAO.RDAO.showPost2(request, response);
      
        request.setAttribute("content", "jsp/rank/limitedDetail.jsp");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }}

  

