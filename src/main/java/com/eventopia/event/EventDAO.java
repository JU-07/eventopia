package com.eventopia.event;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.eventopia.main.DBManager;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class EventDAO {

	public static final EventDAO EDAO = new EventDAO();

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

		String sql = "select * from event_test order by e_date";

		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			events = new ArrayList<EventDTO>();

			EventDTO event = null;

			while (rs.next()) {
				event = new EventDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getDate(6), rs.getInt(7));
				events.add(event);
			}
			request.setAttribute("events", events);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}

	}

	public void addEvent(HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");

		PreparedStatement pstmt = null;
		String sql = "insert into event_test values(event_test_seq.nextval,?,?,?,?,sysdate,0)";

		String path = request.getServletContext().getRealPath("");
		System.out.println(path);

		try {
			MultipartRequest mr = new MultipartRequest(request, path, 1024 * 1024 * 30, "UTF-8",
					new DefaultFileRenamePolicy());

			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);

			String name = request.getParameter("name");
			String title = request.getParameter("title");
			String image_url = request.getParameter("image_url");
			String story = request.getParameter("story");
			System.out.println(name);
			System.out.println(title);
			System.out.println(image_url);
			System.out.println(story);

			pstmt.setString(1, name);
			pstmt.setString(2, title);
			pstmt.setString(3, image_url);
			pstmt.setString(4, story);

			if (pstmt.executeUpdate() == 1) {
				System.out.println("Registion complete");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, null);

		}

	}
}
