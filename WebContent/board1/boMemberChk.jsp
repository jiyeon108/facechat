<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="exboard.*"%>
    <%@ include file = "boSession.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	MemberDao2 md = MemberDao2.getInstance();
	Member2 mem2 = md.select(id);
	String bo_brand = request.getParameter("bo_brand");
	String bo_writer = (String)session.getAttribute("id");
 %>
</head>
<body>
<% 
	BoardDao_1 bd1= BoardDao_1.getInstance();
    int check= bd1.idChk(id);
	if(check == 1){
		session.setAttribute("id",id); %>

		<script type="text/javascript">
	location.href="../main/temp.jsp?pgm=/board1/boWriteForm.jsp";
	</script>

<%}else{ %>
	<script>
	  alert("로그인을 해주세요");  history.go(-1);
	</script>
<% } %>
</body>
</html>