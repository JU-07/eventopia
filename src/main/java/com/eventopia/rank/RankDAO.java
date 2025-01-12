package com.eventopia.rank;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

//import com.eventopia.main.DBManager;
import com.eventopia.main.DBManager_dy;
import com.eventopia.rank.ProductDTO;

public class RankDAO {

	public static void productAllSelect(HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");	
		Connection con = null;
			PreparedStatement pstmt = null; 
			ResultSet rs = null;
			String sql = "select * from product_test";
			try {
			con	= DBManager_dy.connect();
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
				DBManager_dy.close(con, pstmt, rs);
			}
				
	
}

	public static void rankCount(HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");	
		Connection con = null;
		PreparedStatement pstmt = null; 
			ResultSet rs = null;
		String check = request.getParameter("check");
		String sql = "UPDATE product_test SET p_count = p_count + 1 WHERE p_no = ?";
		try {
			con	=DBManager_dy.connect();
			pstmt.setString(1, check);
			rs = pstmt.executeQuery();
			if( pstmt.executeUpdate() == 1) {
				System.out.println("수정성공!");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager_dy.close(con, pstmt, rs);
		}
	}
}
