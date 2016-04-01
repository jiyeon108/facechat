package exboard;

import java.sql.*;
import javax.sql.*;
import javax.naming.*;
import exboard.*;

public class BoardDao_1 {
	private static BoardDao_1 instance = new BoardDao_1();
	private BoardDao_1() {}
	public static BoardDao_1 getInstance() {
		return instance;
}
	public Connection getConnection(){
		Connection conn = null;
		try{	Context ctx = new InitialContext();
				DataSource ds =(DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB");
				conn=ds.getConnection();
			
		}catch(Exception e) { System.out.println(e.getMessage());}
		return conn;
	}
	public int insert(Board_1 bo1) throws SQLException{
		int result =0 , number = 0;
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "insert into board_1 values(?,?,?,?,?,?,?,?,?,?,"
				+ "?,?,0,0,?)";
		String sql1 = "select nvl(max(bo_num),0)+1 from board_1";
		try{
			conn  = getConnection();
			pstmt = conn.prepareStatement(sql1);
			rs    = pstmt.executeQuery();
			if (rs.next()) number = rs.getInt(1);
			pstmt.close();
			pstmt =conn.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setString(2, bo1.getBo_writer());
			pstmt.setString(3, bo1.getBo_password());
			pstmt.setString(4, bo1.getBo_brand());
			pstmt.setString(5, bo1.getBo_price());
			pstmt.setString(6, bo1.getBo_capacity());
			pstmt.setString(7, bo1.getBo_place());
			pstmt.setString(8, bo1.getBo_grade());
			pstmt.setString(9, bo1.getBo_pros());
			pstmt.setString(10, bo1.getBo_cons());
			pstmt.setString(11, bo1.getBo_reco());
			pstmt.setString(12, bo1.getBo_imag());
			pstmt.setTimestamp(13, bo1.getReg_date());
			result = pstmt.executeUpdate();
			
			
		}catch(Exception e){System.out.println(e.getMessage());
		}finally {
			if (rs !=null) rs.close();
			if (pstmt !=null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return result;
	}
	public int delete(String bo_writer) throws SQLException {
		int result = 0; Connection conn = null;
		PreparedStatement pstmt = null; 
		String sql="delete from board_1 where bo_writer=?";
		try { conn = getConnection();
			pstmt  = conn.prepareStatement(sql);
			pstmt.setString(1, bo_writer);
			result = pstmt.executeUpdate();
		}catch(Exception e) {System.out.println(e.getMessage());
		}finally {			
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return result;
	}
	public Board_1 select(String bo_writer) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null; ResultSet rs = null;
		String sql = "select * from board_1 where bo_writer = ?";
		Board_1 bo1 = new Board_1();
		try { conn = getConnection();
			pstmt  = conn.prepareStatement(sql);
			pstmt.setString(1, bo_writer);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bo1.setBo_writer(rs.getString("bo_writer"));
				bo1.setBo_password(rs.getString("bo_password"));

			} 
		}catch(Exception e) {System.out.println(e.getMessage());
		}finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return bo1;
	}
	public int update(Board_1 bo1) throws SQLException {
		int result = 0; Connection conn = null;
		PreparedStatement pstmt = null; 
		String sql="update Board_1 set bo_writer=?,bo_password=?,bo_brand=?,bo_price=?,bo_capacity=?,"
			+ "bo_place=?,bo_grade=?,bo_grade,bo_pros=?,bo_cons=?,bo_reco=?,bo_img=? where bo_img=?";
		try { conn = getConnection();
			pstmt  = conn.prepareStatement(sql);
			pstmt.setString(1, bo1.getBo_writer());
			pstmt.setString(2, bo1.getBo_password());
			pstmt.setString(3, bo1.getBo_brand());
			pstmt.setString(4, bo1.getBo_price());
			pstmt.setString(5, bo1.getBo_capacity());
			pstmt.setString(6, bo1.getBo_place());
			pstmt.setString(7, bo1.getBo_grade());
			pstmt.setString(8, bo1.getBo_pros());
			pstmt.setString(9, bo1.getBo_cons());
			pstmt.setString(10,bo1.getBo_reco());
			pstmt.setString(11, bo1.getBo_imag());
			pstmt.setInt(12, bo1.getBo_num());
			result = pstmt.executeUpdate();
		}catch(Exception e) {System.out.println(e.getMessage());
		}finally {			
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return result;
	}
}