<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="exboard.*"%>
        <%@ include file="../loginCheck.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8"); 

%>
<jsp:useBean id="comment" class="exboard.Comment"></jsp:useBean>
<jsp:setProperty property="*" name="comment"/>
<%
	String pageNum = request.getParameter("pageNum");
	String ip = request.getRemoteAddr(); // 글쓴이의 주소를 요청
	CommentDao cd = CommentDao.getInstance();
	int result = cd.insert(comment);
	if(result>0) response.sendRedirect("../main/temp.jsp?pgm=/board3/view.jsp?pageNum"+pageNum);
	else { %>
<script type="text/javascript">
	alert("잘해 !");  history.go(-1);
</script>
<%} %>
</body>
</html>