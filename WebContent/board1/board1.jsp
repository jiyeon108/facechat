<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="exboard.*,java.util.*"%>
<%@ page import="java.util.List,java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<%
	String path = request.getContextPath();
%> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	<h2>★ 포 토 리 뷰 ★</h2>

	<%
		for(int i = 0; i < list.size();i++) {
			if( i % 3 == 0){
	%>
				<tr>
	<%
			}
	%>	
		<td>
		
		
		<%=list.get(i).getBo_brand()%><p>
		<a href="temp.jsp?pgm=/board1/list1.jsp">
			<img class="m" src="../images/<%=list.get(i).getBo_image()%>"></a><p>
		<%=list.get(i).getBo_writer()%><p>
		<%=list.get(i).getBo_readcount()%>
		<%=list.get(i).getBo_likecount()%>
		<%=list.get(i).getReg_date()%>
		</td>
		<%
		if( i % 3 == 2){
			%>
			</tr>
			<%
			}
		%>
	
	<%
		}
	%>
		
</table>
<%
		}
	}
%>
<p>
	<input type="button" value="글쓰기"
		onclick="location.href='<%=path%>/main/temp.jsp?pgm=/board1/boMemberChk.jsp'">
	
</body>
</html>