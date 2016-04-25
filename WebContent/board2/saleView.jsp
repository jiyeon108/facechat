<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="exboard.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.m {
	width: 400px;
	height: 350px;
}
.t{
	border-style: groove;
	text-align : center;
	width: 600px;
	height: 700px;
	font-size: 20px;
	font-family: 빅 ; 
	

}
.con{
	font-size: 15px;
	font-family: 빅; 
	
}
</style>
<%
	String path = request.getContextPath();
%>

</head>
<body>
	<%
		int s_num = Integer.parseInt(request.getParameter("s_num"));
		String pageNum = request.getParameter("pageNum");
		SaleDao sd = SaleDao.getInstance();
		Sale sale = sd.select(s_num);
		if (sale != null) {
	%>
	<h2 align="center" style="font-size: 20px;">게시판 상세내용</h2>
	<table align = "center" class="t" >
		
		<tr>
			<th>브랜드명</th>
			<td class= "con"><%=sale.getS_brand()%></td>
		</tr>
		<tr>
			<th>세일명</th>
			<td class= "con"><%=sale.getS_salename()%></td>
		</tr>
		<tr>
			<th>세일매장</th>
			<td class= "con"><%=sale.getS_store()%></td>
		</tr>
		<tr>
			<th>세일기간</th>
			<td class= "con"><%=sale.getS_term()%></td>
		</tr>
		<tr>
			<th>이미지</th>
			<td class= "con"><img class="m" src="../board2/imageFile/<%=sale.getS_image()%>"></td>
		</tr>
		<tr>
			<th>링크</th>
			<td class= "con"><a href="<%=sale.getS_link()%>">
					<%=sale.getS_brand() %></a></td>
		</tr>
	</table>
	<%
		} else {
	%>
	데이터가 없습니다
	<%
		}
	%>
	<p>
	<div align="center">
		<button onclick="location.href='<%=path%>/main/temp.jsp?pgm=/board2/board2.jsp?=pageNum=<%=pageNum%>' " style="width: 100px; height: 30px; font-size: 15px;">게시판
			목록</button>

	</div>

</body>
</html>