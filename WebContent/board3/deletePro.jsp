<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="exboard.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	BoardDao bd = BoardDao.getInstance();
	int result  = bd.delete(num);
	if(result>0){ %>
	<script type="text/javascript">
	alert("잘했다아 "); location.href ="list.do?pageNum=<%=pageNum%>";
	</script>
<% }else{ %>
	<script type="text/javascript">
	alert("똑바로 하세요  "); history.go(-1);
	</script>
<% }%>
</body>
</html>