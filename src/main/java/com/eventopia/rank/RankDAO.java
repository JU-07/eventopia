package com.eventopia.rank;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.eventopia.rank.RankPageDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import com.eventopia.main.DBManager;
import com.eventopia.rank.ProductDTO;

public class RankDAO {
	public static final RankDAO RDAO = new RankDAO();
	private Connection con = null; 
private RankDAO() {
		try {
			con = DBManager.connect();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
}
	
	public void productAllSelect(HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");	
		 
			PreparedStatement pstmt = null; 
			ResultSet rs = null;
			String sql = "select * from post_test order by p_count desc";
			try {
			con	= DBManager.connect();
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				ArrayList<RankPageDTO> products = new ArrayList<RankPageDTO>();
				RankPageDTO product = null;
			while (rs.next()) {
					 product = new RankPageDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getDate(6) );
				products.add(product);
			}
			
		request.setAttribute("product", products);
		
				
				
			} catch (Exception e) {
				e.printStackTrace();
				
			}finally {
				DBManager.close(con, pstmt, rs);
			}
				
	
}

	public void rankCount(HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");	
		
		PreparedStatement pstmt = null; 
			ResultSet rs = null;
			 String[] selectedNos = request.getParameterValues("check");
			 if (selectedNos != null && selectedNos.length > 0) {
			 String sql = "UPDATE post_test SET p_count = p_count + 1 WHERE p_no = ?";
			 try {
		            con = DBManager.connect();
		            pstmt = con.prepareStatement(sql);
		         
		            for (String no : selectedNos) {
		                pstmt.setString(1, no); // p_no에 해당하는 값 바인딩
		                if (pstmt.executeUpdate() == 1) {
		                	System.out.println("수정 성공! p_no = " + no);
		                }
		            }
		              
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(con, pstmt, null);
		}
	}else {
        System.out.println("선택된 항목이 없습니다.");
    }
	}

	public void rankPageAllSelect(HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");	
		
			PreparedStatement pstmt = null; 
			ResultSet rs = null;
			String sql = "select * from post_test";
			try {
			con	= DBManager.connect();
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				ArrayList<RankPageDTO> rankPages = new ArrayList<RankPageDTO>();
				RankPageDTO rankPage = null;
			while (rs.next()) {
				rankPage = new RankPageDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getDate(6) );
				rankPages.add(rankPage);
			}
			
		request.setAttribute("rank", rankPages);
		
				
				
			} catch (Exception e) {
				e.printStackTrace();
				
			}finally {
				DBManager.close(con, pstmt, rs);
			}
				
		
	}

public void rankAdd(HttpServletRequest request) throws UnsupportedEncodingException {
		
	request.setCharacterEncoding("utf-8");
	
	PreparedStatement pstmt = null; 
	String sql = "insert into post_test values(post_test_seq.nextval, ?, ?, ?, ?, sysdate)";
	try {
		con	= DBManager.connect();
		pstmt = con.prepareStatement(sql);
		String title = request.getParameter("title");
		String actor = request.getParameter("actor");
		String image = request.getParameter("image");
		String story = request.getParameter("story");
	
 
 		
		pstmt.setString(1, title);
		pstmt.setString(2, actor);
		pstmt.setString(3, image);
		pstmt.setString(4, story );
		
		
		if (pstmt.executeUpdate() == 1) {
			System.out.println("등록성공");
		}
		
	} catch (Exception e) {
		e.printStackTrace();
		
	}finally {
		DBManager.close(con, pstmt, null);
	}
	
}

	
	
	public void rankDetail(HttpServletRequest request) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from post_test where p_no=?";
		try {
			con =	DBManager.connect();
			RankPageDTO rankDetail =  new RankPageDTO();
			int no = Integer.parseInt(request.getParameter("no"));
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			
			if (rs.next()) {
				rankDetail.setP_no(rs.getInt(1));
				rankDetail.setP_title(rs.getString(2));
				rankDetail.setP_actor(rs.getString(3));
				rankDetail.setP_img(rs.getString(4));
				rankDetail.setP_story(rs.getString(5));
				rankDetail.setP_date(rs.getDate(6));
				
				request.setAttribute("rank", rankDetail);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
	}

	
}
