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

	private EventDAO() {
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

		String sql = "select *from event_test ";

		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			events = new ArrayList<EventDTO>();
			events.add(event);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}

	}

	public void addEvent(HttpServletRequest request) {

		PreparedStatement pstmt = null;

		String path = request.getServletContext().getRealPath("");

		String title = request.getParameter("title");
		String name = request.getParameter("name");
		String img = request.getParameter("img");
		String sub = request.getParameter("sub");
		String text = request.getParameter("text");
		String date = request.getParameter("date");
		String good = request.getParameter("good");

		String sql = "insert into event_test values(event_test_seq.nextval,?,?,?,?,?,?,?) ";
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, name);
			pstmt.setString(3, img);
			pstmt.setString(4, sub);
			pstmt.setString(5, text);
			pstmt.setString(6, date);
			pstmt.setString(7, good);

			if (pstmt.executeUpdate() == 1) {
				System.out.println("Registation complete");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(con, pstmt, null);
		}

	}

}
