<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="exboard.SaleDao,exboard.Sale"%>
<%@ page import="java.util.List,java.text.SimpleDateFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String path = request.getContextPath();
%> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title> <!-- 리뷰등록상황 -->
<style type="text/css">
	.m { width: 150;
		height: 180px;	
	}
</style>
</head>
<body>
<%
	
/* 	List<Sale> slist = null;
	int number = 0; */
	String s_image = request.getParameter("s_image");
	
	SaleDao sd = SaleDao.getInstance();
	List<Sale> list = sd.selectList(1, 10);
	if(list != null){
		if(list.size() != 0){

%>
<table border="1">
	<%
		for(Sale sal : list){
	%>	
	<tr>
		<td>
		<%=sal.getS_brand()%><p>
		<img class="m" src="/board2/imageFile/<%=sal.getS_image()%>"><p> 
	
		<%=sal.getS_salename()%><p>
		<%=sal.getS_store()%>
		<%=sal.getS_term()%>
		
		</td>
	</tr>
	<%
		}
	%>
</table>
<%
		}
	}
%>
</body>
</html>