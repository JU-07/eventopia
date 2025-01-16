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

	public void showAllEvent(HttpServletRequest request) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select *from event_test ";

		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			events = new ArrayList<EventDTO>();
			EventDTO event = null;
			while (rs.next()) {
				events = new ArrayList<EventDTO>();
				events.add(event);
			}

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

			if (pstmt.executeUpdate() == 1) {
				System.out.println("Registation complete");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, null);
		}

	}

	public void EventDetail(HttpServletRequest request) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String no = request.getParameter("no");

		try {
			String sql = "select * from event_test where e_no=?";
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, no);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				EventDTO event = new EventDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getDate(7));
				System.out.println(event);
				request.setAttribute("event", event);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}

	}

}
