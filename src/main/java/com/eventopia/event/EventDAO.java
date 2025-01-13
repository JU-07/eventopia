package com.eventopia.event;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.eventopia.main.DBManager;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class EventDAO {

	public final static EventDAO EDAO = new EventDAO();
	
	private Connection con = null;
	
	private EventDAO(){
		try {
			con = DBManager.connect();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	ArrayList<EventDTO> events = null;
	EventDTO event = null;
	
	public void showAllEvent(HttpServletRequest request) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select *from product_test ";
		
		
		
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
		
			events = new ArrayList<EventDTO>();
			events.add(event);
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(con, pstmt, rs);
		}
		
	}


	public void addEvent(HttpServletRequest request) {
		
		PreparedStatement pstmt = null;
		
		String path = request.getServletContext().getRealPath("");
		try {
			MultipartRequest mr = new MultipartRequest(request, path, 1024 * 1024 * 60,"UTF-8",new DefaultFileRenamePolicy());
			
			String title = mr.getParameter("title");
			String Date = mr.getParameter("date");
			String name = mr.getParameter("name");
			String text = mr.getParameter("text");
			String link = mr.getParameter("link");
			
			
			
			
			
			String sql = "";
			
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, Date);
			pstmt.setString(3, name);
			pstmt.setString(4, text);
			pstmt.setString(5, link);
			
			
			if (pstmt.executeUpdate() == 1 ) {
				System.out.println("update complete");
			}
		
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		
		
		
		
		
	
		
	}
	
}
