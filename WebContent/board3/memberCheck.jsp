<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="exboard.*" errorPage="DBError.jsp"%>
    <%@ include file = "sessionBr.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <%
	MemberDao2 md = MemberDao2.getInstance();
	Member2 mem2 = md.select(id);
	String subject = request.getParameter("subject");
	String writer = (String)session.getAttribute("id");
 %>

</head>
<body>
<% 
	BoardDao bd = BoardDao.getInstance();
    int check= bd.idChk(id);
	if(check == 1){
		session.setAttribute("id",id); %>

		<script type="text/javascript">
	location.href="../main/temp.jsp?pgm=/board3/writeForm.jsp";
	</script>

<%}else{ %>
	<script>
	  alert("로그인해");  history.go(-1);
	</script>
<% } %>
</body>
</html>