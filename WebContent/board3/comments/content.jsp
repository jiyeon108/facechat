<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="exboard.*"%>
        <%@ include file = "../sessionBr.jsp" %>
    <%@ include file="../loginCheck.jsp" %>
        <%
	MemberDao2 md = MemberDao2.getInstance();
	Member2 mem2 = md.select(id);
	%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
<table width="650" border="3" align="center" >
<tr height="30"><td colspan="3" align="center">답변</td></tr>
	<form action="contentPro.jsp">
	<input type="hidden" name="ref" value="<%=%>"/>
	<input type="hidden" name="pagenum" value="<%= %>" />
	<tr><td align="center" width="100" bgcolor="gray">
	<font color="white">ID</font></td>
	<td colspan="2" align="center">Content</td></tr>
	<tr><td align="center" bgcolor="gray"><font color="white"><%=id %></font></td>
	<input type="hidden" name="id" value=<%=mem2.getId() %> />
	<td colspan="2"><textarea name ="content" cols="50" rows="3"></textarea>
	<input type="submit" name="register" value="입력">
	<input type="reset" value="취소">
	</form> 
	<%	
	for(int i =0; i<list.size(); i++) { 
	Board borad = (Board)list.get(i);
	BoardDao bd = BoardDao.getInstance();
	bd.insertComment(borad);
	Board board = bd.insertComment(dto); 
	if(borad.getNum()==borad.getRef()) {
	%>
		<tr><td align="center" width="100" bgcolor="gray">
		<font color="white"><%=mem2.getId()  %></font></td>
		<td><%= board.getComments() %></td>
		<td align="center" width="150"><%= board.getReg_date() %></td></tr>
	<%} 
	}	%>
</table>
</body>
</html>