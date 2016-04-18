package exboard;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.sql.*;
import javax.naming.*;
public class BoardDao {
	private static BoardDao instance = new BoardDao();
	private BoardDao() { }
	public static BoardDao getInstance() {
		return instance;
	}
/*	public static Connection getOracle() throws Exception { 
		Class.forName("oracle.jdbc.driver.OraCleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		Connection conn = DriverManager.getConnection(url, "scott", "tiger");
				return conn;
	}*/
	public Connection getConnection() {
		Connection conn = null;
		try { Context ctx = new InitialContext();
			DataSource ds=(DataSource)
				ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		}catch(Exception e) {System.out.println(e.getMessage());}
		return conn;
	}
	public int insert(Board board) throws SQLException{
	      int result =0 , number = 0;
	      Connection conn=null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      String sql  = "insert into board values(?,?,?,?,?,0,?,?,?,?,?,sysdate,'n',?,?)";
	      String sql1 = "select nvl(max(num),0)+1 from board";
	      String sql2 = "update board set re_step = re_step+1 where ref = ? and re_step>?";
	      try{
	         conn  = getConnection();
	         pstmt = conn.prepareStatement(sql1);
	         rs    = pstmt.executeQuery();
	         if (rs.next()) number = rs.getInt(1);
	         pstmt.close();
	         if(board.getNum() !=0){ //답변글일때는 ref를 쓰고 답변글이 아니면 number를 똑같이 써라...
	            pstmt = conn.prepareStatement(sql2);
	            pstmt.setInt(1,board.getRef());
	            pstmt.setInt(2,board.getRe_step());
	            pstmt.executeUpdate();
	            pstmt.close();
	            board.setRe_level(board.getRe_level()+1);
	            board.setRe_step(board.getRe_step()+1);
	         }else { board.setRef(number); }
	         pstmt =conn.prepareStatement(sql);
	         pstmt.setInt(1, number);
	         pstmt.setString(2, board.getWriter());
	         pstmt.setString(3, board.getSubject());
	         pstmt.setString(4, board.getContent());
	         pstmt.setString(5, board.getEmail());
	         pstmt.setString(6, board.getPasswd());
	         pstmt.setInt(7, board.getRef());
	         pstmt.setInt(8, board.getRe_step());
	         pstmt.setInt(9, board.getRe_level());
	         pstmt.setString(10, board.getIp());
	         pstmt.setString(11, board.getImage());
	         pstmt.setString(12, board.getComments());
	         result = pstmt.executeUpdate();
	      }catch(Exception e){System.out.println(e.getMessage());
	      }finally {
	         if (rs !=null) rs.close();
	         if (pstmt !=null) pstmt.close();
	         if (conn !=null) conn.close();
	      }
	      return result;
	   }

	public List<Board> selectList(int startRow,int endRow) {
		List<Board> list  = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null; ResultSet rs = null;
		String sql = "select * from (select rowNum rn, a.* from "
			+"(select * from board order by ref desc,re_step) a) "
			+" where rn between ? and ?";  
		try{conn  = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Board board = new Board();
				board.setNum(rs.getInt("num"));
				board.setWriter(rs.getString("writer"));
				board.setSubject(rs.getString("subject"));				
				board.setContent(rs.getString("content"));
				board.setEmail(rs.getString("email"));
				board.setReadcount(rs.getInt("readcount"));
				board.setPasswd(rs.getString("passwd"));
				board.setRef(rs.getInt("ref"));
				board.setRe_step(rs.getInt("re_step"));
				board.setRe_level(rs.getInt("re_level"));
				board.setIp(rs.getString("ip"));
				board.setReg_date(rs.getDate("reg_date"));
				board.setDel_yn(rs.getString("del_yn"));
				board.setComments(rs.getString("comments"));
				list.add(board);
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
	public Board select(int num){
		Connection conn = null;
		PreparedStatement pstmt = null; ResultSet rs = null;
		String sql = "select * from board where num=?"; 
		Board board = new Board();
		try{conn  = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);			
			rs = pstmt.executeQuery();
			if (rs.next()) {				
				board.setNum(rs.getInt("num"));
				board.setWriter(rs.getString("writer"));
				board.setSubject(rs.getString("subject"));				
				board.setContent(rs.getString("content"));
				board.setEmail(rs.getString("email"));
				board.setReadcount(rs.getInt("readcount"));
				board.setPasswd(rs.getString("passwd"));
				board.setRef(rs.getInt("ref"));
				board.setRe_step(rs.getInt("re_step"));
				board.setRe_level(rs.getInt("re_level"));
				board.setIp(rs.getString("ip"));
				board.setReg_date(rs.getDate("reg_date"));
				board.setComments(rs.getString("comments"));
			}			
		}catch(Exception e) { System.out.println(e.getMessage());
		}finally {
			try{
				if (rs !=null) rs.close();
				if (pstmt !=null) pstmt.close();
				if (conn !=null) conn.close();
			}catch(Exception e){}
		}
		return board;
	}
	public void updateHit(int num)  {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update board set readcount = readcount+1 "
			+ " where num=?"; 
		try{conn  = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);			
			pstmt.executeUpdate();			
		}catch(Exception e) { System.out.println(e.getMessage());
		}finally {
			try{
				if (pstmt !=null) pstmt.close();
				if (conn !=null) conn.close();
			}catch(Exception e){}
		}
	}
	public int update(Board board)  {
		int result = 0;  Connection conn = null;
		PreparedStatement pstmt = null; 
		String sql = "update board set subject=?,writer=?,"
			+ "content=?,email=?,passwd=? where num=?";
		try{conn  = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getSubject());
			pstmt.setString(2, board.getWriter());
			pstmt.setString(3, board.getContent());
			pstmt.setString(4, board.getEmail());
			pstmt.setString(5, board.getPasswd());
			pstmt.setInt(6, board.getNum());
			
			result = pstmt.executeUpdate();
		}catch(Exception e) { System.out.println(e.getMessage());
		}finally {		
			try{
				if (pstmt !=null) pstmt.close();
				if (conn !=null) conn.close();
			}catch(Exception e){}
		}
		return result;
	}
	public int delete(int num)  {
		int result = 0;  Connection conn = null;
		PreparedStatement pstmt = null; 
		 String sql = "delete from board where num=?";
		//String sql = "update board set del_yn='y' where num=?";
		try{conn  = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			result = pstmt.executeUpdate();
		}catch(Exception e) { System.out.println(e.getMessage());
		}finally {		
			try{
				if (pstmt !=null) pstmt.close();
				if (conn !=null) conn.close();
			}catch(Exception e){}
		}
		return result;
	}
	public int selectTotal()  {
		Connection conn = null; int total = 0;
		PreparedStatement pstmt = null; ResultSet rs = null;
		String sql = "select count(*) from board"; 
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
	@SuppressWarnings("resource")
	public void insertComment(Board dto) {
		Connection conn = null;
		PreparedStatement pstmt = null; ResultSet rs = null;
		int num = dto.getNum();
		int number=0;
		try{
			conn=getConnection();
			pstmt = conn.prepareStatement("select max(num) from board");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				number = rs.getInt(1)+1;
			} else {
				number = 1;
			}
			String sql = "insert into board values(board_seq.nextval,?,?,sysdate,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getRef());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {rs.close(); } catch(SQLException s) {}
			try {pstmt.close(); } catch(SQLException s) {}
			try {conn.close(); } catch(SQLException s) {}
		}
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