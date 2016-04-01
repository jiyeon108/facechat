<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="exboard.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link rel = "stylesheet" type = "text/css" href = "comm.css">
</head>
<body>
<table border="1" width = "100%" cellspacing="0"><caption><h2>커뮤니티</h2></caption>
	<tr><th width = "10%">번호</th>
		<th width = "25%">사진</th>
		<th width = "25%">제목</th>
		<th width = "20%">작성자</th>
		<th width = "10%">조회수</th>
		<th width = "10%">작성일</th>
	</tr>
<%
	int rowPerPage   = 10;
	int pagePerBlock = 10;
	String pageNum   =request.getParameter("pageNum");
	if(pageNum==null || pageNum.equals("null")||pageNum.equals(" ")) pageNum = "1";
	int nowPage   = Integer.parseInt(pageNum);			
	BoardDao bd   = BoardDao.getInstance();
	int total     = bd.selectTotal();
	int totalPage = (int)Math.ceil((double)total/rowPerPage);
	int startRow  = (nowPage -1) * rowPerPage +1;
	int endRow    = startRow +rowPerPage -1;
	int totalBlk  = (int)Math.ceil((double)totalPage/pagePerBlock);
	int startPage =(nowPage -1)/10*10 +1;
	int endPage   = startPage+pagePerBlock -1;
	if(endPage > totalPage) endPage = totalPage;
	total = total - startRow +1;
	List<Board> list = bd.selectList(startRow, endRow);
	if(list !=null){
		for(Board brd :list){ %>
			<tr><td><%=total-- %></td>
				<% { %>
				<td>
				<td>
					<% if (brd.getRe_level()>0) {
						int w =brd.getRe_level() * 	20; %>
						<img alt ="" src ="images/level.gif" width = "<%=w%>" height = "10">
						<img alt ="" src = "images/re.gif">
					<%} %>
					<a href = "../board3/view.jsp?num=<%=brd.getNum()%>&pageNum=<%=nowPage%>">
					<%=brd.getSubject() %></a></td>
				<td><%=brd.getWriter() %></td>
				<td><%=brd.getReadcount() %></td>
				<td><%=brd.getReg_date() %></td>
			</tr>

<%		 }}
		}else {%>
		<tr><td colspan="7">데이터가 없습니다.</td></tr>
	<%} %>
</table>	
<div align="center"> 

<%  for(int i =startPage; i<=endPage; i++){%>	
	<a href ="../boar3/list.jsp?pageNum=<%=i %>">[<%=i %>]</a>
<% }
	if(totalPage > endPage) { %>
		<a href ="../board3/list.jsp?pageNum=<%=startPage + pagePerBlock%>">다음</a>

<% } 

	if(startPage>pagePerBlock) { %>
		<a href ="../board3/list.jsp?pageNum=<%=startPage - pagePerBlock%>">이전</a>
<% 		
		
} %>
<br>
	<button  onclick ="location.href ='../board3/writeForm.jsp?pageNum=<%=pageNum %>'" >글쓰기</button></div>
</body>
</html>
