<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="exboard.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" type = "text/css" href = "comm.css">
<script type="text/javascript">
	function chk() {
		if(frm.passwd.value !==frm.dbPass.value){
			alert("암호가 다릅니다.");
			frm.passwd.focus();
			return false;
		}
		return true;
	} 
</script>
</head>
<body>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	BoardDao bd = BoardDao.getInstance();
	Board board = bd.select(num);
	String dbPass = board.getPassword();
%>
<form action = "deletePro.jsp" name ="frm" onsubmit ="return chk()">
	<input type = "hidden" name= "pageNum" value ="<%=pageNum %>">
	<input type = "hidden" name = "num" value = "<%=num %>"> 
	<input type = "hidden" name= "dbPass" value ="<%=dbPass %>">
	암호 : <input type = "password" name ="passwd" required="required">
	<input type = "submit" value = "확인">
</form>
</body>
</html>