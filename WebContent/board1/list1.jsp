<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="exboard.*"%>
<%@ page import="java.util.List,java.text.SimpleDateFormat" %>
<!DOCTYPE html>
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
	BoardDao_1 boardProcess = BoardDao_1.getInstance();
	List<Board_1> list = boardProcess.selectList(1, 12);
	if(list != null){
		if(list.size() != 0){

%>
<table border="1" align="center">

	<%
		for(int i = 0; i < list.size();i++) {
	%>	
		<tr>
		<%
			for(int j = 0; j < 3; j++){
		%>
		
		<td>
		<%=list.get(i).getBo_brand()%><p>
		<img class="m" src="../images/<%=list.get(i).getBo_image()%>"><p>
		<%=list.get(i).getBo_writer()%><p>
		<%=list.get(i).getBo_readcount()%>
		<%=list.get(i).getBo_likecount()%>
		<%=list.get(i).getReg_date()%>
		</td>
		<%
			}
		%>
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