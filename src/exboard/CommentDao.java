package exboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CommentDao {
	private static CommentDao instance = new CommentDao();
	private CommentDao() { }
	public static CommentDao getInstance() {
		return instance;
	}
	public Connection getConnection() {
		Connection conn = null;
		try { Context ctx = new InitialContext();
			DataSource ds=(DataSource)
				ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		}catch(Exception e) {System.out.println(e.getMessage());}
		return conn;
	}
	public Comment select(int c_num){
		Connection conn = null;
		PreparedStatement pstmt = null; ResultSet rs = null;
		String sql = "select * from com where c_num=?"; 
		Comment comment = new Comment();
		try{conn  = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c_num);			
			rs = pstmt.executeQuery();
			if (rs.next()) {				
				comment.setC_num(rs.getInt("c_num"));			
				comment.setC_content(rs.getString("c_content"));
				comment.setC_reg_date(rs.getDate("c_reg_date"));
				comment.setC_ref(rs.getInt("c_ref"));
			}			
		}catch(Exception e) { System.out.println(e.getMessage());
		}finally {
			try{
				if (rs !=null) rs.close();
				if (pstmt !=null) pstmt.close();
				if (conn !=null) conn.close();
			}catch(Exception e){}
		}
		return comment;
	}
	public int insert(Comment comment) throws SQLException{
	      int result =0 , number = 0;
	      Connection conn=null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      String sql  = "insert into com values(?,?,sysdate,?,?,?)";
	      String sql1 = "select nvl(max(num),0)+1 from com";
	      String sql2 = "update com set c_ref_step = c_ref_step+1 where c_ref = ? and c_ref_step>?";
	      try{
	         conn  = getConnection();
	         pstmt = conn.prepareStatement(sql1);
	         rs    = pstmt.executeQuery();
	         if (rs.next()) number = rs.getInt(1);
	         pstmt.close();
	         if(comment.getC_num() !=0){ //답변글일때는 ref를 쓰고 답변글이 아니면 number를 똑같이 써라...
	            pstmt = conn.prepareStatement(sql2);
	            pstmt.setInt(1,comment.getC_ref());
	            pstmt.setInt(2,comment.getC_ref_step());
	            pstmt.executeUpdate();
	            pstmt.close();
	            comment.setC_ref_level(comment.getC_ref_level()+1);
	            comment.setC_ref_step(comment.getC_ref_step()+1);
	         }else { comment.setC_ref(number); }
	         pstmt =conn.prepareStatement(sql);
	         pstmt.setInt(1, number);
	         pstmt.setString(2, comment.getC_content());
	         pstmt.setInt(3, comment.getC_ref());
	         pstmt.setInt(4, comment.getC_ref_step());
	         pstmt.setInt(5, comment.getC_ref_level());
	         result = pstmt.executeUpdate();
	      }catch(Exception e){System.out.println(e.getMessage());
	      }finally {
	         if (rs !=null) rs.close();
	         if (pstmt !=null) pstmt.close();
	         if (conn !=null) conn.close();
	      }
	      return result;
	   }

}
