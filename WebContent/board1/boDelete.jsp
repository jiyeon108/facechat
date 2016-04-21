<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="exboard.*"%>
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
<%
	String pageNum = request.getParameter("pageNum");
	int bo_num = Integer.parseInt(request.getParameter("bo_num"));
	BoardDao_1 bd1 = BoardDao_1.getInstance();
	int result = bd1.delete(bo_num);
	if (result > 0) { %>
	<script type="text/javascript">
	alert("삭제가 완료되었습니다");
	location.href="<%=path %>/main/temp.jsp?pgm=/board1/board1.jsp?pageNum=<%=pageNum%>";
	</script>
	<% } else {%>
	<script type="text/javascript">
	alert("삭제가 취소되었습니다"); 
	history.go(-1);
	</script>

	<%} %>
</body>
</html>