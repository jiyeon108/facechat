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
%>
<jsp:useBean id="board_1" class="exboard.Board_1"></jsp:useBean>
<jsp:setProperty property="*" name="board_1"/>
<%String pageNum = request.getParameter("pageNum");
	BoardDao_1 bd1 = BoardDao_1.getInstance();
	int result = bd1.update(board_1);
	if(result > 0) {%>
	<script type="text/javascript">
	alert("수정이 완료되었습니다"); 
	location.href="<%=path %>/main/temp.jsp?pgm=/board1/board1.jsp?=pageNum=<%=pageNum%>"; 
	</script>
	<%} else { %>
<script type="text/javascript">
	alert("다시 작성해주세요");  history.go(-1);
</script>
<%} %>
</body>
</html>