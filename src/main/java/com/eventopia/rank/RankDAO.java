package com.eventopia.rank;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Response;

import com.eventopia.rank.RankPageDTO;
import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import com.eventopia.main.DBManager;
import com.eventopia.rank.ProductDTO;

public class RankDAO {

	public static final RankDAO RDAO = new RankDAO();
	private Connection con = null;
	ArrayList<ProductDTO> products = null;
	private RankDAO() {
		try {
			con = DBManager.connect();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	public void productAllSelect(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
				
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from product_test order by p_count desc";
		
		products = new ArrayList<ProductDTO>();
		ProductDTO product = null;
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				product = new ProductDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5),
						rs.getString(6), rs.getInt(7));
				products.add(product);
			}

			request.setAttribute("product", products);
		
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			DBManager.close(con, pstmt, rs);
		}

	}
	public void limitedAllSelect(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from product_test2 order by p_count desc";
		
		products = new ArrayList<ProductDTO>();
		ProductDTO product = null;
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				product = new ProductDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5),
						rs.getString(6), rs.getInt(7));
				products.add(product);
			}
			
			request.setAttribute("product", products);
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		
	}
	
	public void chartData(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Gson gson = new Gson();
		String jsonResponse = gson.toJson(products);
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().write(jsonResponse);
	}
	

	public void rankCount(HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");
		
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
			} finally {
				DBManager.close(con, pstmt, rs);
			}
		} else {
			System.out.println("선택된 항목이 없습니다.");
		}
	}
	
	public void rankCount2(HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String[] selectedNos = request.getParameterValues("check");
		if (selectedNos != null && selectedNos.length > 0) {
			String sql = "UPDATE product_test2 SET p_count = p_count + 1 WHERE p_no = ?";
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
			} finally {
				DBManager.close(con, pstmt, null);
			}
		} else {
			System.out.println("선택된 항목이 없습니다.");
		}
	}

	
	
	
	public void rankPageAllSelect(HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT id, title, c_sub, c_img FROM collabo_post ";
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			ArrayList<LimitedDTO> collaboPages = new ArrayList<LimitedDTO>();
			LimitedDTO collaboPage = null;
			while (rs.next()) {
				collaboPage = new LimitedDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), null, null);
				
				collaboPages.add(collaboPage);
			}
			
			request.setAttribute("collaboPages", collaboPages);
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		
	}
	public void limitAllSelect(HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT id, title, p_actor, p_img FROM limited_post ";
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			ArrayList<LimitedDTO> limitedPages = new ArrayList<LimitedDTO>();
			LimitedDTO limitedPage = null;
			while (rs.next()) {
				limitedPage = new LimitedDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), null, null);

				limitedPages.add(limitedPage);
			}

			request.setAttribute("limited", limitedPages);

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			DBManager.close(con, pstmt, rs);
		}

	}

	
	
	
	
	
	public void rankAdd(HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");
		PreparedStatement pstmt = null;
		
		String sql = "INSERT INTO collabo_post (title, c_sub, c_img, content,  created_at) VALUES (?, ?, ?, ?, sysdate)";
		try {
			Connection con = DBManager.connect();
			String title = request.getParameter("title");
			String actor = request.getParameter("actor");
			String image = request.getParameter("image");
			String content = request.getParameter("content"); // HTML 데이터 포함
			System.out.println(title);
			System.out.println(actor);
			System.out.println(image);
			System.out.println(content);
			
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, title);
			pstmt.setString(2, actor);
			pstmt.setString(3, image);
			pstmt.setString(4, content);
			
			if (pstmt.executeUpdate() == 1) {
				System.out.println("글 등록 성공");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, null);
		}
	}
	public void rankAdd2(HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");
		PreparedStatement pstmt = null;
		
		String sql = "INSERT INTO limited_post (title, p_actor, p_img, content,  created_at) VALUES (?, ?, ?, ?, sysdate)";
		try {
			Connection con = DBManager.connect();
			String title = request.getParameter("title");
			String actor = request.getParameter("actor");
			String image = request.getParameter("image");
			String content = request.getParameter("content"); // HTML 데이터 포함
			System.out.println(title);
			System.out.println(actor);
			System.out.println(image);
			System.out.println(content);
			
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, title);
			pstmt.setString(2, actor);
			pstmt.setString(3, image);
			pstmt.setString(4, content);
			
			if (pstmt.executeUpdate() == 1) {
				System.out.println("글 등록 성공");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, null);
		}
	}

	
	
	

	public void showLimited(HttpServletRequest request) throws IOException {
		request.setCharacterEncoding("utf-8");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int limitedid = Integer.parseInt(request.getParameter("id"));
		
		String sql = "SELECT title, content FROM limited_post WHERE id = ?";
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, limitedid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String title = rs.getString("title");
	            String content = rs.getString("content"); 
				request.setAttribute("title", title);
		            request.setAttribute("contentt", content);
		   
		}


		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			DBManager.close(con, pstmt, rs);
		}
	}
	

	public void showPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int post2Id = Integer.parseInt(request.getParameter("id"));
		
		String sql = "SELECT title, content FROM collabo_post WHERE id = ?";
		try (Connection con = DBManager.connect();
				PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setInt(1, post2Id);
			
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				String title = rs.getString("title");
				String content = rs.getString("content");
				
				// JSP에 데이터를 전달
				request.setAttribute("title", title);
				request.setAttribute("contentt", content);
				
				// JSP로 포워드
			} else {
				// 데이터가 없을 경우 처리
				response.getWriter().write("No post found with the provided ID.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().write("An error occurred while retrieving the post.");
		}
	}

	public void showPost2(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int postId = Integer.parseInt(request.getParameter("id"));

        String sql = "SELECT title, content FROM limited_post WHERE id = ?";
        try (Connection con = DBManager.connect();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setInt(1, postId);

            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                String title = rs.getString("title");
                String content = rs.getString("content");

                // JSP에 데이터를 전달
                request.setAttribute("title", title);
                request.setAttribute("contentt", content);

                // JSP로 포워드
            } else {
                // 데이터가 없을 경우 처리
                response.getWriter().write("No post found with the provided ID.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("An error occurred while retrieving the post.");
        }
    }
	public  void limitedDelete(HttpServletRequest request) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "delete limited_post where id=?";
		try {
			con =	DBManager.connect();
			String id = request.getParameter("id");
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);

			if (pstmt.executeUpdate() == 1) {
				System.out.println("삭제성공!");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, null);
		}

	}

}



	

	
	
	
