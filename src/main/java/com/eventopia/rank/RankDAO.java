package com.eventopia.rank;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.eventopia.main.DBManager;
import com.eventopia.rank.ProductDTO;

public class RankDAO {

	public static void productAllSelect(HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");	
		Connection con = null;
			PreparedStatement pstmt = null; 
			ResultSet rs = null;
			String sql = "select * from product_test order by p_count desc";
			try {
			con	= DBManager.connect();
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				ArrayList<ProductDTO> products = new ArrayList<ProductDTO>();
				ProductDTO product = null;
			while (rs.next()) {
					 product = new ProductDTO(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5) );
				products.add(product);
			}
			
		request.setAttribute("product", products);
		System.out.println(products);
				
				
			} catch (Exception e) {
				e.printStackTrace();
				
			}finally {
				DBManager.close(con, pstmt, rs);
			}
				
	
}

	public static void rankCount(HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");	
		Connection con = null;
		PreparedStatement pstmt = null; 
			ResultSet rs = null;
			 String[] selectedNos = request.getParameterValues("check");
			 if (selectedNos != null && selectedNos.length > 0) {
			 String sql = "UPDATE product_test SET p_count = p_count + 1 WHERE p_no = ?";
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
}
