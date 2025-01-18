package com.eventopia.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.eventopia.main.DBManager;

public class LoginDAO {

    // 로그인 확인 메서드
    public static String login(String id, String pw) {
       
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM USER_INF WHERE USER_ID=?";
        String result = null;

        try {
            con = DBManager.connect();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                if (pw.equals(rs.getString("user_pw"))) {
                    result = "Login Success";
                } else {
                    result = "Incorrect Password";
                }
            } else {
                result = "User Not Found";
            }

        } catch (Exception e) {
            e.printStackTrace();
            result = "Database Error";
        } finally {
            DBManager.close(con, pstmt, rs);
        }

        return result;
    }

    // 아이디 중복 확인 메서드
    public static boolean checkDuplicateId(String userId) {
        boolean isDuplicate = false;
        String sql = "SELECT * FROM USER_INF WHERE USER_ID = ?";

        try (Connection conn = DBManager.connect();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, userId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                isDuplicate = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isDuplicate;
    }

    // 회원가입 메서드
    public static boolean register(String userId, String userPw, String userName) {
        boolean isRegistered = false;
        String sql = "INSERT INTO USER_INF (USER_ID, USER_PW, USER_NAME, USER_CREATE_AT) VALUES (?, ?, ?, SYSDATE)";

        try (Connection conn = DBManager.connect();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, userId);
            pstmt.setString(2, userPw);
            pstmt.setString(3, userName);

            int result = pstmt.executeUpdate();
            isRegistered = result > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return isRegistered;
    }
}
