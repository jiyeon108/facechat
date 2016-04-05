package exboard;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

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
	public int delete(int bo_num) throws SQLException {
		int result = 0; Connection conn = null;
		PreparedStatement pstmt = null; 
		String sql="delete from board_1 where bo_num=?";
		try { conn = getConnection();
			pstmt  = conn.prepareStatement(sql);
			pstmt.setInt(1, bo_num);
			result = pstmt.executeUpdate();
		}catch(Exception e) {System.out.println(e.getMessage());
		}finally {			
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return result;
	}
	public Board_1 select(int bo_num) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null; 
		ResultSet rs = null;
		String sql = "select * from board_1 where bo_writer = ?";
		Board_1 bo1 = new Board_1();
		try { conn = getConnection();
			pstmt  = conn.prepareStatement(sql);
			pstmt.setInt(1, bo_num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bo1.setBo_num(rs.getInt("bo_num"));
				bo1.setBo_writer(rs.getString("bo_writer"));
				bo1.setBo_password(rs.getString("bo_password"));
				bo1.setBo_brand(rs.getString("bo_brand"));
				bo1.setBo_price(rs.getString("bo_price"));
				bo1.setBo_capacity(rs.getString("bo_capacity"));
				bo1.setBo_place(rs.getString("bo_place"));
				bo1.setBo_grade(rs.getString("bo_grade"));
				bo1.setBo_pros(rs.getString("bo_pros"));
				bo1.setBo_cons(rs.getString("bo_cons"));
				bo1.setBo_reco(rs.getString("bo_reco"));
				bo1.setBo_imag(rs.getString("bo_imag"));
				bo1.setReg_date(rs.getTimestamp("Reg_date"));

			} 
		}catch(Exception e) {System.out.println(e.getMessage());
		}finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return bo1;
	}
	public int selectTotal()  {
		Connection conn = null; 
		int total = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from board_1"; 
		try{conn  = getConnection();
			pstmt = conn.prepareStatement(sql);				
			rs = pstmt.executeQuery();
			if (rs.next()) {				
				total = rs.getInt(1);
			}			
		}catch(Exception e) { System.out.println(e.getMessage());
		}finally {
			try{
				if (rs !=null) rs.close();
				if (pstmt !=null) pstmt.close();
				if (conn !=null) conn.close();
			}catch(Exception e){}
		}
		return total;
	}
	public int update(Board_1 bo1) throws SQLException {
		int result = 0; Connection conn = null;
		PreparedStatement pstmt = null; 
		String sql="update Board_1 set bo_writer=?,bo_password=?,bo_brand=?,bo_price=?,bo_capacity=?,"
			+ "bo_place=?,bo_grade=?,bo_pros=?,bo_cons=?,bo_reco=?,bo_img=? where bo_num=?";
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
	public void updateHit(int bo_num)  {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update board_1 set bo_readcount = bo_readcount+1 "
			+ " where bo_num=?"; 
		try{conn  = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bo_num);			
			pstmt.executeUpdate();			
		}catch(Exception e) { System.out.println(e.getMessage());
		}finally {
			try{
				if (pstmt !=null) pstmt.close();
				if (conn !=null) conn.close();
			}catch(Exception e){}
		}
	}
	public List<Board_1> selectList(int startRow,int endRow) {
		List<Board_1> list  = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null; 
		ResultSet rs = null;
		String sql = "select * from (select rowNum rn, a.* from "
			+"(select * from board order by ref desc,re_step) a) "
			+" where rn between ? and ?";  
		try{conn  = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Board_1 bo1 = new Board_1();
				bo1.setBo_num(rs.getInt("bo_num"));
				bo1.setBo_writer(rs.getString("bo_writer"));
				bo1.setBo_password(rs.getString("bo_password"));				
				bo1.setBo_brand(rs.getString("bo_brand"));
				bo1.setBo_price(rs.getString("bo_price"));
				bo1.setBo_capacity(rs.getString("bo_capacity"));
				bo1.setBo_place(rs.getString("bo_place"));
				bo1.setBo_grade(rs.getString("bo_grade"));
				bo1.setBo_pros(rs.getString("bo_pros"));
				bo1.setBo_cons(rs.getString("bo_cons"));
				bo1.setBo_reco(rs.getString("bo_reco"));
				bo1.setBo_imag(rs.getString("bo_imag"));
				list.add(bo1);
			}			
		}catch(Exception e) { System.out.println(e.getMessage());
		}finally {
			try{
				if (rs !=null) rs.close();
				if (pstmt !=null) pstmt.close();
				if (conn !=null) conn.close();
			}catch(Exception e){}
		}
		return list;
	}
	public int idChk(String id) throws SQLException{
		int x=-1;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from Member2 where id = ?";
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {		
				if(id.equals(id))		x= 1; 
				else			x= 0; 
			}else				x= -1;			
	        } catch(Exception e) {System.out.println(e.getMessage());
	        } finally {
				if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	        }
			return x;
		}
}