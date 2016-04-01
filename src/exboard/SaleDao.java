package exboard;
import java.sql.*;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class SaleDao {
	 private static SaleDao instance;
	    public static SaleDao getInstance() {
	    	if (instance==null) {	instance = new SaleDao();  	}
	        return instance;
	    }    
	    private SaleDao() {}    
	    private Connection getConnection() throws Exception {
	        Connection conn=null; 	 
	      	Context init = new InitialContext();  
	     		DataSource ds = 
	     			(DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
	     		conn = ds.getConnection();
	         return conn;
	    }    
	    //  관리자 인증 메소드
	    public int managerCheck(String id, String passwd) {
			Connection conn = null;   PreparedStatement pstmt = null;
			ResultSet rs= null;       String dbpasswd="";		int x=-1;        
			try { conn = getConnection();            
	            pstmt = conn.prepareStatement(
	            	"select managerPasswd from manager where managerId=?");
	            pstmt.setString(1, id);            
	            rs= pstmt.executeQuery();
				if(rs.next()){
					dbpasswd= rs.getString("managerPasswd"); 
					if(dbpasswd.equals(passwd))		x= 1; //인증 성공
					else			x= 0; //비밀번호 틀림
				}else				x= -1;//해당 아이디 없음			
	        } catch(Exception e) {System.out.println(e.getMessage());
	        } finally {
				if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	        }
			return x;
		}
	    
	    //책 등록 메소드
	    public int insertSale(Sale sale) {
	        Connection conn = null;     
	        int result = 0;
	        PreparedStatement pstmt = null;      
	        try {  conn = getConnection();
	            String str ="insert into sale values (sale_seq.nextval,?,?,?,?,?)";
	            pstmt = conn.prepareStatement(str);
	           // pstmt.setInt   (1, sale.getS_num());
	            pstmt.setString(1, sale.getS_brand());
	            pstmt.setString(2, sale.getS_salename());
	            pstmt.setString(3, sale.getS_store());
	            pstmt.setString(4, sale.getS_term());
	            pstmt.setString(5, sale.getS_image());
	           
			    result = pstmt.executeUpdate();
	            
	        } catch(Exception e) { System.out.println(e.getMessage());
	           
	        } finally {
	            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	        }
	        return result;
	    }
	    
	/*    //이미등록된 책을 검증
		public int registedBookconfirm(String kind, String bookName, String author) 
		throws Exception {
			Connection conn = null;
	        PreparedStatement pstmt = null;
			ResultSet rs= null;
			int x=-1;
	        
			try {
	            conn = getConnection();
	            
	            pstmt = conn.prepareStatement(
	            	"select book_name from book where book_kind = ? and book_name = ? and author = ?");
	            pstmt.setString(1, kind);
	            pstmt.setString(2, bookName);
	            pstmt.setString(3, author);
	            
	            rs= pstmt.executeQuery();

				if(rs.next())
					x= 1; //해당 책이 이미 등록되어 있음
				else
					x= -1;//해당 책이 이미 등록되어 있지 않음	
				
	        } catch(Exception ex) {
	            ex.printStackTrace();
	        } finally {
				if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	        }
			return x;
		}
	    */
	/*	// 전체등록된 책의 수를 얻어내는 메소드
		public int getBookCount()   {
	        Connection conn = null; PreparedStatement pstmt = null;
	        ResultSet rs = null;    int x=0;
	        try { conn = getConnection();            
	            pstmt = conn.prepareStatement("select count(*) from book");
	            rs = pstmt.executeQuery();
	            if (rs.next()) {   x = rs.getInt(1);}
	        } catch(Exception e) { System.out.println(e.getMessage());
	        } finally {
	            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	        }
			return x;
	    }
		*/
		// 분류별또는 전체등록된 책의 정보를 얻어내는 메소드
		public ArrayList<Sale> selectList(int startRow, int endRow) {
	        Connection conn = null;     
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;        
	        ArrayList<Sale> saleList=null;  
	        String sql = "select * from (select a.* from "
					+ "(select * from sale order by s_num)a) "
					+ "where s_num between ? and ?";
	        try{
				conn  = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,startRow);
				pstmt.setInt(2,endRow);
				rs = pstmt.executeQuery();

	            if (rs.next()) {
	                saleList = new ArrayList<Sale>();
	                do{
	                     Sale sale= new Sale();
	                     sale.setS_num     (rs.getInt   ("S_num"));
	                     sale.setS_brand   (rs.getString("S_brand"));
	                     sale.setS_salename(rs.getString("S_salename"));
	                     sale.setS_store   (rs.getString("S_store"));
	                     sale.setS_term    (rs.getString("S_term"));
	                     sale.setS_image   (rs.getString("S_image"));
	                                   
	                     saleList.add(sale);
	                     
				    }while(rs.next());
				}
	        } catch(Exception e) {System.out.println(e.getMessage());
	        } finally {
	            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	        }
			return saleList;
	    }
		public int selectTotal() throws SQLException{
			Connection conn=null; 
			int total = 0;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "select count(*) from sale";
			
			try{
				conn  = getConnection();
				pstmt = conn.prepareStatement(sql);
				rs    = pstmt.executeQuery();
				if (rs.next()){
					total = rs.getInt(1);
				}
			}catch(Exception e){System.out.println(e.getMessage());
			}finally {
				if (rs !=null) rs.close();
				if (pstmt !=null) pstmt.close();
				if (conn !=null) conn.close();
			}
			return total;
		}
		
		
		// bookId에 해당하는 책의 정보를 얻어내는 메소드로 ,등록된 책을 수정하기 위해 수정폼으로 읽어들기이기 위한 메소드
		public Sale getSale(int s_num) {
	        Connection conn = null;     
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;       
	        Sale sale=null; 
	        String sql = "select * from sale where book_id = ?";
	        try { conn = getConnection();            
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setInt(1, s_num); 
	            rs = pstmt.executeQuery();
	            if (rs.next()) {
	                sale = new Sale();                
	                sale.setS_brand   (rs.getString("s_brand"));
	                sale.setS_salename(rs.getString("s_salename"));
	                sale.setS_store   (rs.getString("S_store"));
	                sale.setS_term    (rs.getString("S_term"));
	                sale.setS_image   (rs.getString("S_image"));
	                
				}
	        } catch(Exception e) { System.out.println(e.getMessage());
	        } finally {
	            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	        }
			return sale;
	    }
	    
	    // 등록된 책의 정보를 수정시 사용하는 메소드
	    public int updateSale(Sale sale, int s_num) {
	        Connection conn = null;    
	        PreparedStatement pstmt = null;
	        String sql, sql1;               
	        int result = 0;        
	        try { conn = getConnection();            
	            sql = "update sale set s_brand=?,s_salename=?,s_store=?,s_term=?,s_image=? where s_num=?";
	           	sql1 = "update sale set s_brand=?,s_salename=?,s_store=?,s_term=? where s_num=?";
	           
	            if (sale.getS_image()==null) {
	            	pstmt = conn.prepareStatement(sql1);
	    			pstmt.setInt(5, s_num);
	            } else {
	            	pstmt = conn.prepareStatement(sql);
	            	pstmt.setString(5, sale.getS_image());
	    			pstmt.setInt(6, s_num);
	            }            
	            pstmt.setString(1, sale.getS_brand());
	            pstmt.setString(2, sale.getS_salename());
	            pstmt.setString(3, sale.getS_store());
	            pstmt.setString(4, sale.getS_term());
	          	            
	            result = pstmt.executeUpdate();
	            
	        } catch(Exception e) {System.out.println(e.getMessage());
	        } finally {
	            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	        }
	        return result;
	    }
	     
	    // bookId에 해당하는 책의 정보를 삭제시 사용하는 메소드
	    public int deleteSale(int s_num)   {
	        Connection conn = null;  
	        PreparedStatement pstmt = null;
	        int result = 0;  
	        String sql = "delete from sale where s_num=?";
	        try { 
	        	conn = getConnection();
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setInt(1, s_num);            
	            result = pstmt.executeUpdate();            
	        } catch(Exception e) {System.out.println(e.getMessage()); 
	        } finally {           
	            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	            if (conn  != null) try { conn.close();  } catch(SQLException ex) {}
	        }
	        return result;
	    }
	    public Sale select(int s_num) throws SQLException{
			Connection conn=null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "select * from sale where s_num = ?";
			Sale sale = new Sale();
			try{
				conn  = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, s_num);
				rs    = pstmt.executeQuery();
				if (rs.next()){
					
					sale.setS_num(rs.getInt("s_num"));
					sale.setS_brand(rs.getString("s_brand"));				
					sale.setS_salename(rs.getString("s_salename"));
					sale.setS_store(rs.getString("s_store"));
					sale.setS_term(rs.getString("s_term"));				
					sale.setS_image(rs.getString("s_image"));
					
					
				}
				
			}catch(Exception e){System.out.println(e.getMessage());
			}finally {
				if (rs !=null) rs.close();
				if (pstmt !=null) pstmt.close();
				if (conn !=null) conn.close();
			}
			return sale;
		}
	}