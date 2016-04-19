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
	   
	   
	    public int insertSale(Sale sale) {
	        Connection conn = null;     
	        int result = 0;
	        PreparedStatement pstmt = null;      
	        try {  conn = getConnection();
	            String str ="insert into sale values (sale_seq.nextval,?,?,?,?,?,?,?)";
	            pstmt = conn.prepareStatement(str);
	           // pstmt.setInt   (1, sale.getS_num());
	            pstmt.setString(1, sale.getS_brand());
	            pstmt.setString(2, sale.getS_salename());
	            pstmt.setString(3, sale.getS_store());
	            pstmt.setString(4, sale.getS_term());
	            pstmt.setString(5, sale.getS_image());
	            pstmt.setInt   (6, sale.getCount());
	            pstmt.setString(7, sale.getS_link());
			    result = pstmt.executeUpdate();
	            
	        } catch(Exception e) { System.out.println(e.getMessage());
	           
	        } finally {
	            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	        }
	        return result;
	    }
	    

		public int getSaleCount()   {
	        Connection conn = null; 
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;    
	        int x=0;
	        try { conn = getConnection();            
	            pstmt = conn.prepareStatement("select count(*) from sale");
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
	
		
		public ArrayList<Sale> getSales(String s_brand) {
	        Connection conn = null;    
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;        
	        ArrayList<Sale> slist=null;  
	        String sql1="select * from sale";
	        String sql2 = "select * from sale where s_brand = ?";
	        try { conn = getConnection();           
	            if(s_brand.equals("all")){
	            	 pstmt = conn.prepareStatement(sql1);
	            }else{
	                pstmt = conn.prepareStatement(sql2);
	                pstmt.setString(1, s_brand);
	            }
	        	rs = pstmt.executeQuery();

	            if (rs.next()) {
	                slist = new ArrayList<Sale>();
	                do{
	                     Sale sale= new Sale();
	                     sale.setS_num(rs.getInt("s_num"));
	                     sale.setS_brand(rs.getString("s_brand"));
	                     sale.setS_salename(rs.getString("s_salename"));
	                     sale.setS_store(rs.getString("s_store"));
	                     sale.setS_term(rs.getString("s_term"));
	                     sale.setCount(rs.getInt("count"));
	                     sale.setS_link(rs.getString("s_link"));
	                     slist.add(sale);
				    }while(rs.next());
				}
	        } catch(Exception e) {System.out.println(e.getMessage());
	        } finally {
	            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	        }
			return slist;
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
		
	
		
		
		public Sale[] getSales(String s_brand, int count) {
	        Connection conn = null;  
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;
	        Sale saleList[]=null;       
	        int i = 0;        
	        try { conn = getConnection();           
	            pstmt = conn.prepareStatement(
	               "select * from (select * from sale where s_brand = ? ) where rownum <= ?");
	            pstmt.setString(1, s_brand);
	            pstmt.setInt(2, count);          
	        	rs = pstmt.executeQuery();
	            if (rs.next()) {
	                saleList = new Sale[count];
	                do{  Sale sale= new Sale();
		                sale.setS_num     (rs.getInt   ("S_num"));
	                    sale.setS_brand   (rs.getString("S_brand"));
	                    sale.setS_salename(rs.getString("S_salename"));
	                    sale.setS_store   (rs.getString("S_store"));
	                    sale.setS_term    (rs.getString("S_term"));
	                    sale.setS_image   (rs.getString("S_image"));
	                    sale.setCount	  (rs.getInt   ("Count")); 
	                    sale.setS_link	  (rs.getString("s_link"));
	                     saleList[i]=sale;
	                     i++;
				    }while(rs.next());
				}
	        } catch(Exception e) { System.out.println(e.getMessage());  } finally {
	            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	        }
			return saleList;
	    }
		
		public Sale getSale(int s_num) {
	        Connection conn = null;     
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;        
	        Sale sale=null; 
	        String sql = "select * from sale where s_num = ?";
	        try { conn = getConnection();            
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setInt(1, s_num); 
	            rs = pstmt.executeQuery();
	            if (rs.next()) {
	                sale = new Sale();                
	                sale.setS_brand   (rs.getString("S_brand"));
                    sale.setS_salename(rs.getString("S_salename"));
                    sale.setS_store   (rs.getString("S_store"));
                    sale.setS_term    (rs.getString("S_term"));
                    sale.setS_image   (rs.getString("S_image"));
                    sale.setCount	   (rs.getInt("Count"));  
                    sale.setS_link	  (rs.getString("s_link"));
				}
	        } catch(Exception e) { System.out.println(e.getMessage());
	        } finally {
	            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	        }
			return sale;
	    }
		
	   
		 public int updateSale(Sale sale, int s_num) {
		        Connection conn = null;    
		        PreparedStatement pstmt = null;
		        String sql, sql1;               
		        int result = 0;        
		        try {
		        	conn = getConnection();            
		            sql = "update sale set s_brand=?,s_salename=?,s_store=?,s_term=?,s_image=?,count=?,s_link=? where s_num=?";
		            sql1 = "update sale set s_brand=?,s_salename=?,s_store=?,s_term=?,count=?,s_link=? where s_num=?"; 
		            if (sale.getS_image()==null) {
		            	pstmt = conn.prepareStatement(sql1);
		    			pstmt.setInt(7, s_num);
		            } else {
		            	pstmt = conn.prepareStatement(sql);
		            	pstmt.setString(5, sale.getS_image());
		    			pstmt.setInt(8, s_num);
		            }            
		            pstmt.setString(1, sale.getS_brand());
		            pstmt.setString(2, sale.getS_salename());
		            pstmt.setString(3, sale.getS_store());
		            pstmt.setString(4, sale.getS_term());
		            pstmt.setInt	(5, sale.getCount());
		            pstmt.setString(6, sale.getS_link());
		            
		            result = pstmt.executeUpdate();
		            
		        } catch(Exception e) {System.out.println(e.getMessage());
		        } finally {
		            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		        }
		        return result;
		    }
	     
	   
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
	    public Sale select(int s_num){
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
					
					sale.setS_num		(rs.getInt("s_num"));
					sale.setS_brand		(rs.getString("s_brand"));				
					sale.setS_salename	(rs.getString("s_salename"));
					sale.setS_store		(rs.getString("s_store"));
					sale.setS_term		(rs.getString("s_term"));				
					sale.setS_image		(rs.getString("s_image"));
					sale.setCount 		(rs.getInt("count"));
					sale.setS_link	    (rs.getString("s_link"));
					
				}
				
			}catch(Exception e){System.out.println(e.getMessage());
			}finally {
				try{
					if (rs !=null) rs.close();
					if (pstmt !=null) pstmt.close();
					if (conn !=null) conn.close();
				}catch(Exception e){}
			}
			return sale;
		}
	    public ArrayList<Sale> selectList(int startRow, int endRow) {
	    	ArrayList<Sale> list = new ArrayList<>();  
	    	   Connection conn = null;     
	           PreparedStatement pstmt = null;
	           ResultSet rs = null;        
	           
	           String sql = "select * from (select rowNum rn, a.* from "
	               + "(select * from sale order by s_num desc )a) "
	               + "where rn between ? and ?";
	           try{
	            conn  = getConnection();
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setInt(1,startRow);
	            pstmt.setInt(2,endRow);
	            rs = pstmt.executeQuery();

	               while(rs.next()){
	                        Sale sale= new Sale();
	                        sale.setS_num     (rs.getInt   ("S_num"));
	                        sale.setS_brand   (rs.getString("S_brand"));
	                        sale.setS_salename(rs.getString("S_salename"));
	                        sale.setS_store   (rs.getString("S_store"));
	                        sale.setS_term    (rs.getString("S_term"));
	                        sale.setS_image   (rs.getString("S_image"));
	                        sale.setS_link	  (rs.getString("s_link"));              
	                        list.add(sale);
	                        
	                }
	        
	           } catch(Exception e) {System.out.println(e.getMessage());
	           } finally {
	               if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	               if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	               if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	           }
	         return list;
	    }

	    

	}