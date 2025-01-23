package com.eventopia.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLIntegrityConstraintViolationException;

import com.eventopia.main.DBManager;

public class LoginDAO {

    // 로그인 확인 메서드
    public static String login(String id, String pw) {
       
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM USER_INFO WHERE USER_ID=?";
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
    public static String register(String userId, String userPw, String userName, String userProfile) {
        
    	
    	System.out.println("userId : " + userId);
    	System.out.println("userPW : " + userPw);
    	System.out.println("userName : " + userName);
    	System.out.println("userProfile : " +userProfile);
    	
    	Connection con = null;
        PreparedStatement pstmt = null;
        String result = null;
 
        // userProfile이 null이거나 빈 문자열("")일 경우 "null" 넣어주기
	     if (userProfile == null || userProfile.trim().isEmpty()) {
	    	 String sql = "INSERT INTO user_info VALUES (user_info_seq.nextval, ?, ?, ?, null)";
	     }
	     
        String sql = "INSERT INTO user_info VALUES (user_info_seq.nextval, ?, ?, ?, ?)";

        try {
            con = DBManager.connect();
            pstmt = con.prepareStatement(sql);

            // 파라미터 바인딩
            pstmt.setString(1, userId);
            pstmt.setString(2, userPw);
            pstmt.setString(3, userName);
            pstmt.setString(4, userProfile);

            // SQL 실행
            int rows = pstmt.executeUpdate();	

            if (rows > 0) {
                result = "Registration Success";
            } else {
                result = "Registration Failed";
            }

        } catch (SQLIntegrityConstraintViolationException e) {
            // 중복된 user_id 에러 처리
            result = "User ID Already Exists";
        } catch (Exception e) {
            e.printStackTrace();
            result = "Database Error";
        } finally {
            DBManager.close(con, pstmt, null);
        }

        return result;
    }

    // 아이디 중복 확인 메서드
    public static boolean isUserIdExists(String userId) {
       
    	Connection con = null;
        PreparedStatement pstmt = null;
        
    	String sql = "SELECT COUNT(*) FROM user_info WHERE user_id = ?";
    	
        boolean exists = false;

        try {
            con = DBManager.connect();
            pstmt = con.prepareStatement(sql);
            
            pstmt.setString(1, userId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                exists = rs.getInt(1) > 0; // 결과가 1 이상이면 아이디 존재
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return exists;
    }
}
