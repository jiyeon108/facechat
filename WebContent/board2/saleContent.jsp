<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="exboard.*,java.text.NumberFormat"%>

<%
  	String s_brand = request.getParameter("s_brand");
    String s_num = request.getParameter("s_num");
    String id = "";
   
    if (session.getAttribute("id") == null){
       id = "not";
    } else {  id = (String)session.getAttribute("id");    }
  %>
<html>
<head>
<title>Sale ZONE</title>


</head>
<body>
	<%
	 String s_brandName="";  
     SaleDao sd = SaleDao.getInstance(); 
     Sale sale = sd.getSale(Integer.parseInt(s_num));
     
     if(s_brand.equals("all")){
	     s_brandName="전체";
    
      }
%>
	<form name="inform" method="post" action="cartInsert.jsp">
	
		<table border="0" width="650" cellpadding="5" cellspacing="5"
			align="center">
			<tr height="30">
				<td rowspan="6" width="150" align="center" valign="middle"><img
					src="..board2/imageFile/<%=sale.getS_image()%>" border="0" width="150"
					height="200"></td>
				<td width="500"><font size="+1"><b><%=sale.getS_salename() %></b></font></td>
			</tr>
			<tr>
				<td>매장 : <%=sale.getS_store()%></td>
			</tr>
			<tr>
				<td>기간 : <%=sale.getS_term()%></td>
			</tr>
			
			<tr>
				<td>
					<input type="button" value="목록으로"
					onclick="location.href='../board2/board2.jsp?s_brand=<%=s_brand%>'">
					<input type="button" value="메인으로"
					onclick="location.href='../main/temp.jsp'">
				</td>
			</tr>
			
		</table>
	</form>
</body>
</html>