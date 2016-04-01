<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="exboard.*"%>
    <%@ include file="sessionBr.jsp" %>
    <%
	MemberDao2 md = MemberDao2.getInstance();
	Member2 mem2 = md.select(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type = "text/css" href="comm.css">
</head>
<body>
<% 
	int num = 0, ref=0, re_step=0, re_level=0;
	String pageNum = request.getParameter("pageNum");
	if(request.getParameter("num") != null) { //답변
		num = Integer.parseInt(request.getParameter("num"));
		BoardDao bd = BoardDao.getInstance();
		Board board = bd.select(num);
		ref = board.getRef();
		re_step = board.getRe_step();
		re_level = board.getRe_level();
	}
%>
<form action="../board3/write.jsp" method="post">
<input type = "hidden" name="num" value="<%=num %>">
<input type = "hidden" name="ref" value="<%=ref %>">
<input type = "hidden" name="re_step" value="<%=re_step %>">
<input type = "hidden" name="re_level" value="<%=re_level %>">
<input type= "hidden" name = "pageNum" value ="<%=pageNum %>">
<table border="1" align="center" width="70%"><caption>게시판 작성</caption>
	<tr><th>제목</th><td><input type="text" name="subject" 
	required="required" autofocus="autofocus"></td></tr>
	<tr><th>작성자</th><td><input type="text" name="writer"  value = "<%=mem2.getId() %>" 
	readonly="readonly"></td></tr>
	<tr><th>이메일</th><td><input type="email" name="email" 
	required="required"></td></tr>
	<tr><th>암호</th><td><input type="password" name="passwd"
	required="required"	></td></tr>
	<tr><th>내용</th><td><textarea rows="5" cols="50" name="content" required="required" ></textarea></td></tr>
	
	<tr><td colspan="2" align="center"><input type="submit" value="확인"><input type="reset" value="취소"></td></tr>
	
</table>
</form>
</body>
</html>