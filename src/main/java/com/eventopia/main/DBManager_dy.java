package com.eventopia.main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

public class DBManager_dy {

	private static BasicDataSource dataSource;

	static {
		dataSource = new BasicDataSource();
		dataSource.setUrl(
				"jdbc:oracle:thin:@vba3a2va52ki4sdh_medium?TNS_ADMIN=C:/KDY/Wallet_VBA3A2VA52KI4SDH/Wallet_VBA3A2VA52KI4SDH");
		dataSource.setUsername("EVENTOPIA");
		dataSource.setPassword("Soldesk802!!");
		dataSource.setMinIdle(10); // 최소 유휴 커넥션
		dataSource.setMaxIdle(20); // 최대 유휴 커넥션
		dataSource.setMaxOpenPreparedStatements(100); // 풀에서 열린 최대 준비된 sql문 개수
	}

	public static Connection connect() throws SQLException {
		return dataSource.getConnection();
	}

//	public static Connection connect() throws SQLException {
//		// ����
////		String url = "jdbc:oracle:thin:@localhost:1521:xe";
//		
//		// Ŭ����
//		String url = "jdbc:oracle:thin:@wrvhg7114p7vnw5c_medium?TNS_ADMIN=C:/Users/danie/Downloads/Wallet_WRVHG7114P7VNW5C";
//		return DriverManager.getConnection(url, "DW", "Soldesk802!!");
//		
//	}

	public static void close(Connection con, PreparedStatement pstmt, ResultSet rs) {

		try {
			if (rs != null) {
				rs.close();
			}
			pstmt.close();
			if (con != null) {
				con.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
