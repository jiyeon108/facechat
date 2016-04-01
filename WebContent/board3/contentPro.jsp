<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="cmtdto" class="exboard.Board"/>
<jsp:setProperty property="*" name="cmtdto"/>
<%
	String num = request.getParameter("ref");
	String pageNum = request.getParameter("pageNum");
	BoardDao bd = BoardDao.getInstance();
	int result = bd.insertComment(cmtdto);
%>

<meta http-equiv="Refresh"
	content="0;url=content.jsp?num=<%=num %>&pageNum=<%=pageNum %>">
</body>
</html>
