<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="exboard.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<%
	String path = request.getContextPath();
%> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.m { width: 250;
		height: 150px;	
	}
</style>
</head>
<body>

<table border="1">
<h2>리뷰존</h2>
	<tr>
		<td colspan="3"><img src="../images/icox_logo.gif" class="m"></td>
	</tr>
	<tr>
		<th colspan="3">bo_brand</th><tr>
	<tr>
		<th colspan="3">bo_writer</th></tr>
	<tr>
		<th>bo_readcount</th>
		<th>bo_likecount</th>
		<th>reg_date</th>
	</tr>

</table>

	<input type="button" value="글쓰기" 
		onclick="location.href='<%=path%>/main/temp.jsp?pgm=/board1/boWriteForm.jsp'">

</body>
</html>