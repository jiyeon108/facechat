<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="exboard.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../board1/check.js"></script>
</head>
<body>
<%
	int bo_num = Integer.parseInt(request.getParameter("bo_num"));
	String pageNum = request.getParameter("pageNum");
	BoardDao_1 bd1 = BoardDao_1.getInstance();
	Board_1 bo1 = bd1.select(bo_num);
	String dbPass = bo1.getBo_password();
%>
<form action="../board1/boDelete.jsp" name = "frm" onsubmit="return delcheck()">
	<input type="hidden" name="pageNum" value="<%=pageNum %>">
	<input type="hidden" name = "num" value="<%=bo_num %>">
	<input type = "hidden" name = "dbPass" value="<%=dbPass %>">
	암호 : <input type="password" name = "password" required="required">
	<input type="submit" value = "확인">
	</form>
</body>
</html>