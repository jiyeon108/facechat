<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="dto" class="exboard.Board"/>
<jsp:setProperty property="*" name="dto"/>
<%
	String num = request.getParameter("ref");
	String pageNum = request.getParameter("pageNum");
	BoardDao bd = BoardDao.getInstance();
	int result = bd.insertComment(dto);
%>

<meta http-equiv="Refresh"
	content="0;url=content.jsp?num=<%=num %>&pageNum=<%=pageNum %>">
</body>
</html>
