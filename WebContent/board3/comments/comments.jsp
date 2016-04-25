<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="exboard.*"%>
    <%@ include file = "../sessionBr.jsp" %>
    <%@ include file="../loginCheck.jsp" %>
        <%
	MemberDao2 md = MemberDao2.getInstance();
	Member2 mem2 = md.select(id);
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	caption { font-size : 25px; font-family: 빅;}
</style>
</head>
<body>
<% 

	int c_num = 0, c_ref=0, c_ref_step=0, c_ref_level=0;
	String pageNum = request.getParameter("pageNum");
	if(request.getParameter("c_num") != null) { //답변
		c_num = Integer.parseInt(request.getParameter("c_num"));
		CommentDao cd = CommentDao.getInstance(); 
		Comment comment = cd.select(c_num);
		c_ref = comment.getC_ref();
		c_ref_step = comment.getC_ref_step(); 
		c_ref_level = comment.getC_ref_level();
	}
	
		%>
<form action="${pageContext.request.contextPath}/board3/comments/commentsPro.jsp" method="post">
<input type = "hidden" name="c_num" value="<%=c_num %>">
<input type = "hidden" name="c_ref" value="<%=c_ref %>">
<input type = "hidden" name="re_step" value="<%=c_ref_step %>">
<input type = "hidden" name="re_level" value="<%=c_ref_level %>">
<input type="hidden" name="pagenum" value="<%=pageNum %>" />
<table border="1" align="center" width="70%" cellspacing="0"><caption>답글</caption>
	<tr><th>작성자</th><td><input type="text" name="writer"  value = "<%=mem2.getId() %>" 
	readonly="readonly"></td></tr>
	<tr><th>내용</th><td><textarea rows="5" cols="50" name="c_content" required="required" ></textarea></td></tr>
	
	<tr><td colspan="2" align="center"><input type="submit" value="확인"><input type="reset" value="취소"></td></tr>
	</table>
</form>
</body>
</html>