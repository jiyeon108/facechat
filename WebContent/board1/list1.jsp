<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="exboard.*"%>
<%@ page import="java.util.List,java.text.SimpleDateFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String path = request.getContextPath();
%> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title> <!-- 리뷰등록상황 -->
<style type="text/css">
	.m { width: 150;
		height: 180px;	
	}
</style>
</head>
<body>
<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	List<Board_1> boardList1 = null;
	int number = 0;
	String bo_image = request.getParameter("bo_image");
	
	BoardDao_1 boardProcess = BoardDao_1.getInstance();
	List<Board_1> list = boardProcess.selectList(1, 10);
	if(list != null){
		if(list.size() != 0){

%>
<table border="1">
	<%
		for(Board_1 brd1 : list){
	%>	
	<tr>
		<td>
		<%=brd1.getBo_brand()%><p>
		<img class="m" src="../images/<%=brd1.getBo_image()%>"><p>
		<%=brd1.getBo_writer()%><p>
		<%=brd1.getBo_readcount()%>
		<%=brd1.getBo_likecount()%>
		<%=brd1.getReg_date()%>
		</td>
	</tr>
	<%
		}
	%>
</table>
<%
		}
	}
%>
</body>
</html>