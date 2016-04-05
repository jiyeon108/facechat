<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="exboard.*"%>
<%@ page import="java.util.List,java.text.SimpleDateFormat"%>
<%@ include file="../managerSessionChk.jsp"%>

<html>
<head>
<title>세일등록상황</title>
<link href="style.css" rel="stylesheet" type="text/css">
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

	<a href="../managerMain.jsp"> 관리자 메인으로</a> &nbsp;
<div align="right"> 
		<input type ="button"  value="등록" onclick="location.href='../product/saleInsertForm.jsp'"><p>
</div>
	<table border="1" >
		<tr height="30">
			<th> </th>
			<th>브랜드명</th>
			<th>세일명</th>
			<th>매장</th>
			<th>기간</th>
			<th>이미지</th>
			<th>수정</th>
			<th>삭제</th>
			
		</tr>
<%
	int rowPerPage   = 10;
	int pagePerBlock = 10;
	String pageNum   =request.getParameter("pageNum");
	if(pageNum==null || pageNum.equals("null")||pageNum.equals(" ")) pageNum = "1";
	int nowPage   = Integer.parseInt(pageNum);			
	SaleDao sd    = SaleDao.getInstance();
	int total     = sd.selectTotal();
	int totalPage = (int)Math.ceil((double)total/rowPerPage);
	int startRow  = (nowPage -1) * rowPerPage +1;
	int endRow    = startRow +rowPerPage -1;
	int totalBlk  = (int)Math.ceil((double)totalPage/pagePerBlock);
	int startPage =(nowPage -1)/10*10 +1;
	int endPage   = startPage+pagePerBlock -1;
	if(endPage > totalPage) endPage = totalPage;
	total = total - startRow +1;
	List<Sale> list = sd.selectList(startRow, endRow);
	if(list !=null){
		for(Sale sal :list){ %>
			<tr><td><%=sal.getS_num() %></td>
				<td><%=sal.getS_brand()%></td>
				<td><%=sal.getS_salename()%></td>
				<td><%=sal.getS_store()%></td>
				<td><%=sal.getS_term()%></td>
				<td><%=sal.getS_image() %></td>
				<td>
         		<a href="saleUpdateForm.jsp?s_num=<%=sal.getS_num() %>&s_name=<%=sal.getS_brand()%>">수정</a></td>
      			<td>
      		  	 <a href="saleDeleteForm.jsp?s_num=<%=sal.getS_num() %>&s_name=<%=sal.getS_brand()%>">삭제</a></td>
				
			</tr>

<%		 		}}else {%>
		<tr><td colspan="7">데이터가 없습니다.</td></tr>
	<%} %>
</table>	
<div align="center"> 

<%  for(int i =startPage; i<=endPage; i++){%>	
	<a href ="../product/salelist.jsp?pageNum=<%=i%>">[<%=i %>]</a>
<% }
	if(totalPage > endPage) { %>
		<a href ="../product/salelist.jsp?pageNum=<%=startPage + pagePerBlock%>">다음</a>

<% } 

	if(startPage>pagePerBlock) { %>
		<a href ="../product/salelist.jsp?pageNum=<%=startPage - pagePerBlock%>">이전</a>
<% 		
		
} %>
<br>
</div>
<div align="right"> 
	
		

	<input type ="button"  value="수정" onclick="location.href='../sale/saleUpdateForm.jsp'">
	<input type ="button" value="삭제" onclick="location.href='../sale/saleDeleteForm.jsp'">
</div>		
</body>
</html>
