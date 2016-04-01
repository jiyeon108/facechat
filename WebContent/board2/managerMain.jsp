<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="managerSessionChk.jsp"%>

<html>
<head>
<title>세일상품 관리</title>
<style type="text/css">
table {
	padding: 5;
} 
</style>
</head>
<body>
	<b>관리작업중.. </b>
	<input type="button" value="로그아웃"
		onclick="location.href='../board2/logon/managerLogout.jsp'">
	<br>
	<table border="0" width="300">
		<tr>
			<td align="center">세일관련 작업</td>
		</tr>
		<tr>
			<td><a href='product/saleInsertForm.jsp'>상품등록</a></td>
		</tr>
		<tr>
			<td><a href='product/saleList.jsp?s-salename=all'>상품수정/삭제</a></td>
		</tr>
	</table>
	<br>
	<br>
</body>
</html>