<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="exboard.*"%>
    <%@ page import="java.util.List,java.text.SimpleDateFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String path = request.getContextPath();
%> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../temp.css" rel="stylesheet" type="text/css">
<h2> 세일정보  </h2>
<style type="text/css">
	.m { 
		width: 170px;
		height: 200px;	
	}
	.td{
		text-align: center;
		width : 600px;
		height: 100px;
	}
</style>
</head>
<body>

<%

	String s_image = request.getParameter("s_image");
	
	SaleDao sd = SaleDao.getInstance();
	List<Sale> list = sd.selectList(1,50);
	
%>
<pre>
<table>
<tr>
<%
int i=0 ;
int j=0;
	for(Sale sal : list){	
	
		if(j<=23){
			if(i<=4){
			
%>
		<td class = "td">
			<img class ="m" src="../board2/imageFile/<%=sal.getS_image()%>">
			<%=sal.getS_brand() %>
			<%=sal.getS_term() %>
			<font color="gray"><%=sal.getS_salename()%> </font>
		</td>
<%	j++;
		}
		else{
			j++;
			i=0;%>
	 	</tr>
			<tr>
			<td class = "td">
			<img class = "m" src="../board2/imageFile/<%=sal.getS_image()%>" >
			<%=sal.getS_brand() %>
			<%=sal.getS_term() %>
			<font color="gray"><%=sal.getS_salename()%> </font>
		</td>
<%
		}
		i++;
	}
	
}

%>
</tr>
</table>
</pre>
</body>
</html>