<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%  
	int s_num=Integer.parseInt(request.getParameter("s_num"));
    String s_brand = request.getParameter("s_brand");
%>
<html>
<head>
<title>책삭제</title>
	<link href="../style.css" rel="stylesheet" type="text/css">
	<style type="text/css">
	body {
		text-align: center;
	}
	</style>
	</head>
<body>
		<h2>책삭제</h2>
		<a href="../board2/managerMain.jsp"> 관리자 메인으로</a> &nbsp;
		<a href="../board2/product/saleList.jsp?s_brand=<%=s_brand%>">목록으로</a>
		<p>
			<input type="button" value="삭제"
				onclick="location.href='../board2/product/saleDeletePro.jsp?s_num=<%=s_num%>&s_brand=<%=s_brand%>'">
</body>
</html>