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
	text-align : left;
	width: 500px;
	height: 600px;
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
	<table align = "center" class="t"  >
		<caption><h2>게시판 상세내용</h2></caption>
		<tr>
			<th>브랜드명</th>
			<td><%=sale.getS_brand()%></td>
		</tr>
		<tr>
			<th>세일명</th>
			<td><%=sale.getS_salename()%></td>
		</tr>
		<tr>
			<th>세일매장</th>
			<td><%=sale.getS_store()%></td>
		</tr>
		<tr>
			<th>세일기간</th>
			<td><%=sale.getS_term()%></td>
		</tr>
		<tr>
			<th>이미지</th>
			<td><img class="m" src="../board2/imageFile/<%=sale.getS_image()%>"></td>
		</tr>
		<tr>
			<th>링크</th>
			<td><a href="<%=sale.getS_link()%>">
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
	<div align="center">
		<button onclick="location.href='<%=path%>/main/temp.jsp?pgm=/board2/board2.jsp?=pageNum=<%=pageNum%>' ">게시판
			목록</button>


	</div>

</body>
</html>