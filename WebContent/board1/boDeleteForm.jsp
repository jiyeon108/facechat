<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="exboard.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	BoardDao_1 bd1 = BoardDao_1.getInstance();
	Board_1 bo1 = bd1.select(num);
	String dbPass = bo1.getBo_password();
%>
<form action="../board1/boDelete.jsp" name = "frm" onsubmit="return chk()">
	<input type="hidden" name="pageNum" value="<%=pageNum %>">
	<input type="hidden" name = "num" value="<%=num %>">
	<input type = "hidden" name = "dbPass" value="<%=dbPass %>">
	암호 : <input type="password" name = "password" required="required">
	<input type="submit" value = "확인">
	</form>
</body>
</html>