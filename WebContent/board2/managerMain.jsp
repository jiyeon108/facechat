<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>


<html>
<head>
<%
	String path = request.getContextPath();
%>
<title>세일상품 관리</title>
<link href="../temp.css" rel="stylesheet" type="text/css">
</head>
<body>
	
	<table border="1" cellspacing="0" width="100%">
		<tr height="100">
			<td width="30%">
					<a href="../board2/managerMain.jsp"><img src="../main/logo.jpg" width="250" height="150"></a>
			</td>
			<td width="45%">
					<input type="text" placeholder="검색" size="30">
			</td>
			<td width="25%">
				<b><%=session.getAttribute("id")%>님 환영합니다.</b>
				<p>
				<input type="button" value="마이페이지"
					onclick="location.href='<%=path%>/main/temp.jsp?pgm=/member/mypage.jsp'">
				<input type="button" value="로그아웃"
					onclick="location.href='<%=path%>/member/logout.jsp'">
			</td>
		</tr>
	</table>
	
	<table height="60" width="100%" border="1" cellspacing="0">
		<tr>
			<td width="30%"><a href="../main/temp.jsp?pgm=/board1/board1.jsp">리뷰존</a></td>
			<td width="35%"><a href="../main/temp.jsp?pgm=/board2/board2.jsp">세일존</a></td>
			<td width="35%"><a href="../main/temp.jsp?pgm=/board3/list.jsp">커뮤니티</a></td>
		</tr>
	</table>
	
	<br>
	<table align="center" border="1" width="300" cellspacing="0">
		<tr >
			<h2 align = "center">관리자 페이지 입니다.</h2>
		</tr>
		<tr>
			<td height="100">
				<a href='../main/temp.jsp?pgm=/board2/saleInsertForm.jsp'>상품등록</a>
			</td>
		</tr>
		<tr>
			<td height="100">
				<a href='../main/temp.jsp?pgm=/board2/saleList.jsp?s_salename=all'>상품수정/삭제</a>
			</td>
		</tr>
	</table>
	<br>
	<br>
	
	<hr>
>
	주소) 강남구 역삼동 테헤란로 7
	<p>
	tel) 010-111-*11132
	
</body>
</html>