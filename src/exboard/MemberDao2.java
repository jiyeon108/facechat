package exboard;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;

public class MemberDao2 {
	private static MemberDao2 instance; //= new MemberDao();
	private MemberDao2(){}
	public static MemberDao2 getInstance(){ //Singleton
		if(instance ==null) instance = new MemberDao2();
		return instance;
	}
	
	private Connection getConnection(){
		Connection conn = null;
		try{
			Context ctx = new InitialContext();
			DataSource ds =(DataSource)
					ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn=ds.getConnection();
		}catch(Exception e){System.out.println(e.getMessage());
		
		}
		return conn;
	}
	
	public int insert2(Member2 mem2) throws SQLException {
		int result = 0;
		Connection conn =null;
		PreparedStatement pstmt = null;
		String sql = "insert into member2 values(?,?,?,?,?,sysdate)";
		try{
			conn= getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem2.getId());
			pstmt.setString(2, mem2.getPassword());
			pstmt.setString(3, mem2.getName());
			pstmt.setString(4, mem2.getAddr());
			pstmt.setString(5, mem2.getEmail());
			result = pstmt.executeUpdate();
		}catch(Exception e){ System.out.println(e.getMessage());
		}finally {
			if (pstmt !=null) pstmt.close();
			if (conn != null) conn.close();
		}
		return result;
	}
	
	public int loginChk2(String id, String password) throws SQLException {
		int result = 0;
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		String sql = "select password from member2 where id =?";
		try{
			conn= getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				String dbpass = rs.getString(1); //("password")
				if(dbpass.equals(password)) result = 1; //일치
				else result = 0; // 암호가 다름
			}else result = -1; //데이터 읽기 실패
		}catch(Exception e){ System.out.println(e.getMessage());
		}finally {
			if (pstmt !=null) pstmt.close();
			if (conn != null) conn.close();
			if (rs != null) rs.close();
		}
		return result;
	}
	
	public Member2 select(String id) throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		String sql = "select * from member2 where id =?";
		Member2 mem =new Member2();
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				mem.setId(rs.getString("id"));
				mem.setPassword(rs.getString("password"));
				mem.setName(rs.getString("name"));
				mem.setAddr(rs.getString("addr"));
				mem.setEmail(rs.getString("email"));
			}
		}catch(Exception e) { System.out.println(e.getMessage()); 
		}finally{
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		}
		return mem;
	}
	
	public int update(Member2 mem2) throws SQLException{
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update member2 set password=?,name=?,addr=?,email=? where id=?";
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem2.getPassword());
			pstmt.setString(2, mem2.getName());
			pstmt.setString(3, mem2.getAddr());
			pstmt.setString(4, mem2.getEmail());
			pstmt.setString(5, mem2.getId());
			result = pstmt.executeUpdate();
		}catch(Exception e) { System.out.println(e.getMessage()); 
		}finally{
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		return result;
	}
	
	public int delete(String id) throws SQLException{
		int result =0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "delete from member2 where id =?";
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();
		}catch(Exception e) { System.out.println(e.getMessage()); 
		}finally{
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		return result;
	}
	
	public int idChk(String id) throws SQLException{
		int result =0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select id from Member2 where id = ?";
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) result =1;
			
		}catch(Exception e) { System.out.println(e.getMessage()); 
		}finally{
			if(rs != null ) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
			
		return result;
	}
	
	    
		
}
