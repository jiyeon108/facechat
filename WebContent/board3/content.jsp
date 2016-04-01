<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="exboard.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table width="650" border="3" align="center" bordercolor="gray">
<tr height="30"><td colspan="3" align="center" bgcolor="gray">
	<font color="white">Comment</font></td></tr>
	<form action="contentPro.jsp">
	<input type="hidden" name="ref" value="<%=%>"/>
	<input type="hidden" name="pagenum" value="<%= %>" />
	<tr><td align="center" width="100" bgcolor="gray">
	<font color="white">ID</font></td>
	<td colspan="2" align="center">Content</td></tr>
	<tr><td align="center" bgcolor="gray"><font color="white"><%=id %></font></td>
	<input type="hidden" name="id" value=<%=id %> />
	<td colspan="2"><textarea name ="content" cols="50" rows="3"></textarea>
	<input type="submit" name="register" value="Register">
	<input type="reset" value="Reset">
	</form> 
	<%
	for(int i =0; i<list.size(); i++) { 
	Board cmtdto = (Board)list.get(i); 
	if(dto.getNum()==cmtdto.getRef()) {
	%>
		<tr><td align="center" width="100" bgcolor="gray">
		<font color="white"><%= cmtdto.getId() %></font></td>
		<td><%= cmtdto.getContent() %></td>
		<td align="center" width="150"><%= cmtdto.getReg() %></td></tr>
	<%} 
	}	%>
</table>
</body>
</html>