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
	.m { width: 300px;
		height: 200px;	
	}
	.t {
		border: 1px solid #bcbcbc;
	}
</style>
</head>
<body>
<%
	String pageNum = request.getParameter("pageNum");
	if(pageNum ==null||pageNum=="")pageNum ="1";
	int nowPage = Integer.parseInt(pageNum);
	BoardDao_1 boardProcess = BoardDao_1.getInstance();
	List<Board_1> list = boardProcess.selectList(1, 15);
	if(list != null){
		if(list.size() != 0){

%>
<table border="0" cellspacing="40" align="center">
	<h2 align="center" style="font-family:빅; font-size :30px;"> 포 토 리 뷰  </h2>

	<%
		for(int i = 0; i < list.size();i++) {
			if( i % 3 == 0){
	%>
				<tr>
	<%
			}
	%>	
		<td class="t">
		
		
		<%=list.get(i).getBo_brand()%><p>
		<a href="../main/temp.jsp?pgm=/board1/boView.jsp?bo_num=<%=list.get(i).getBo_num()%>&pageNum=<%=nowPage%>">
			<img class="m" src="../board1/images/<%=list.get(i).getBo_image()%>"></a><p>
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