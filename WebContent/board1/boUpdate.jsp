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
<jsp:useBean id="bo1" class="exboard.Board_1"></jsp:useBean>
<jsp:setProperty property="*" name="board_1"/>
<%String pageNum = request.getParameter("pageNum");
	BoardDao_1 bd = BoardDao_1.getInstance();
	int result = bd.update(bo1);
	if(result > 0) {%>
	<script type="text/javascript">
	alert("수정이 완료되엇습니다"); 
	location.href="<%=path %>/main/temp.jsp?pgm=/board1/board1.jsp?=pageNum=<%=pageNum%>"; 
	</script>
	<%} else { %>
<script type="text/javascript">
	alert("다시 작성해주세요");  history.go(-1);
</script>
<%} %>
</body>
</html>