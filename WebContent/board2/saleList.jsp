<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="exboard.*"%>
<%@ page import="java.util.List,java.text.SimpleDateFormat"%>


<html>
<head>
<%
	String path = request.getContextPath();
%>
<title>세일등록상황</title>
<style type="text/css">
	body {
		text-align: center;
		
	}
	table {
	width: 100%; 
	text-align: center;
	}
</style>
</head>
<body>

	<a href="<%=path%>/main/temp.jsp?pgm=/board2/managerMain.jsp"> 관리자 메인으로</a> &nbsp;
<div align="right"> 
		<input type ="button"  value="등록" onclick="location.href='<%=path%>/main/temp.jsp?pgm=/board2/saleInsertForm.jsp'"><p>
</div>
	<table border="1" >
		<tr height="30">
			<th> </th>
			<th>브랜드명</th>
			<th>세일명</th>
			<th>매장</th>
			<th>기간</th>
			<th>이미지</th>
			<th>링크</th>
			<th>수정</th>
			<th>삭제</th>
			
		</tr>
<%
int rowPerPage = 10;
int pagePerBlock = 10; 
String pageNum = request.getParameter("pageNum");
if (pageNum == null || pageNum == "") pageNum = "1";
int nowPage = Integer.parseInt(pageNum);	
SaleDao sd = SaleDao.getInstance();
int total = sd.selectTotal();
int totalPage = (int)Math.ceil((double)total/rowPerPage);
int startRow = (nowPage - 1) * rowPerPage * 1; //시작번호
int endRow = startRow + rowPerPage -1; //끝번호
int startPage =(nowPage - 1)/10*10+1;
int endPage = startPage +pagePerBlock -1;
if(endPage > totalPage) endPage = totalPage; //페이지를 블록에 맞게
total = total - startRow +1;
List<Sale> list = sd.selectList(startRow,endRow);
if (list != null) {
	for (Sale sal : list) {%>
<tr><td><%=total-- %></td>
	<td><%=sal.getS_brand() %></td>
	<td><%=sal.getS_salename() %></td>
	<td><%=sal.getS_store()%></td>
	<td><%=sal.getS_term()%></td>
	<td><%=sal.getS_image() %></td>
	<td><%=sal.getS_link() %></td>
	<td>
       <a href="<%=path %>/main/temp.jsp?pgm=/board2/saleUpdateForm.jsp?s_num=<%=sal.getS_num() %>&s_name=<%=sal.getS_brand()%>">수정</a></td>
    <td>
      <a href="<%=path %>/main/temp.jsp?pgm=/board2/saleDeleteForm.jsp?s_num=<%=sal.getS_num() %>&s_name=<%=sal.getS_brand()%>">삭제</a></td>
</tr>
<% 		}
} else { %>
	<tr><td colspan="7">데이터가 없습니다.</td></tr>
<%  }%>	
</table>				
<div align="center">
<% if(startPage > pagePerBlock) {	%>
<a href="../main/temp.jsp?pgm=/board2/saleList.jsp?pageNum=<%=startPage - pagePerBlock %>">이전</a>
<% } %>
<% for (int i = startPage; i<=endPage; i++) { %>
<a href="../main/temp.jsp?pgm=/board2/saleList.jsp?pageNum=<%=i %>">[<%=i %>]</a>
<%} 
if(totalPage > endPage) {	%> 
<a href="../main/temp.jsp?pgm=/board2/saleList.jsp?pageNum=<%=startPage + pagePerBlock %>">다음</a>
<%} %>

</div>		
</body>
</html>
