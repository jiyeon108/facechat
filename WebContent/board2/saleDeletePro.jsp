<%@page import="exboard.SaleDao"%>
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
	<%
		String pageNum = request.getParameter("pageNum");
		int s_num = Integer.parseInt(request.getParameter("s_num"));
		SaleDao sd = SaleDao.getInstance();
		int result = sd.deleteSale(s_num);
		if (result > 0) {
	%>
	<script type="text/javascript">
	alert("삭제되었습니다.");
	location.href="<%=path%>/main/temp.jsp?pgm=/board2/saleList.jsp";
	</script>
	<%
		} else {
	%>
	<script type="text/javascript">
		alert("삭제되지 않았습니다.");
		history.go(-1);
	</script>

	<%
		}
	%>
</body>
</html>
