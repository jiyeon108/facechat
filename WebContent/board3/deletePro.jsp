<%@page import="exboard.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	String path = request.getContextPath();
%>
</head>
<body>
<%String pageNum = request.getParameter("pageNum");
	int num = Integer.parseInt(request.getParameter("num"));
	BoardDao bd = BoardDao.getInstance();
	int result = bd.delete(num);
	if (result > 0) { %>
	<script type="text/javascript">
	alert("잘했습니다"); location.href="<%=path %>/main/temp.jsp?pgm=/board3/list.jsp?pageNum=<%=pageNum%>";
	</script>
	<% } else {%>
	<script type="text/javascript">
	alert("헐"); history.go(-1);
	</script>

	<%} %>
</body>
</html>
