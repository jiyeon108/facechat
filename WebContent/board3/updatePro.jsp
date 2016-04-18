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
	request.setCharacterEncoding("utf-8");
	int ref=0, re_step =0, re_level=0;
%>
<jsp:useBean id="board" class="exboard.Board"></jsp:useBean>
<jsp:setProperty property="*" name="board"/>
<%String pageNum = request.getParameter("pageNum");
	BoardDao bd = BoardDao.getInstance();
	int result = bd.update(board);
	if(result > 0) {%>
	<script type="text/javascript">
	alert("수정 성공"); location.href="<%=path %>/main/temp.jsp?pgm=/board3/list.jsp?=pageNum=<%=pageNum%>"; 
	</script>
	<%} else { %>
<script type="text/javascript">
	alert("잘해 !");  history.go(-1);
</script>
<%} %>
</body>
</html>