<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="exboard.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	String path = request.getContextPath();
%>
<!-- <script type="text/javascript">
function memberCheck() {
	window.open("../board3/memberCheck.jsp?id="+frm.id.value, " ", "width='300' height='300'");
}
</script> -->
</head>
<body>
<table border = "1" align="center" width="70%"> 
	<caption>게시판</caption>
	<tr><th>번호</th><th>제목</th><th>작성자</th><th>조회수</th><th>작성일</th></tr>
<%
	int rowPerPage = 10;
	int pagePerBlock = 10; 
	String pageNum = request.getParameter("pageNum");
	if (pageNum == null || pageNum == "") pageNum = "1";
	int nowPage = Integer.parseInt(pageNum);	
	BoardDao bd = BoardDao.getInstance();
	int total = bd.selectTotal();
	int totalPage = (int)Math.ceil((double)total/rowPerPage);
	int startRow = (nowPage - 1) * rowPerPage * 1; //시작번호
	int endRow = startRow + rowPerPage -1; //끝번호
	int startPage =(nowPage - 1)/10*10+1;
	int endPage = startPage +pagePerBlock -1;
	if(endPage > totalPage) endPage = totalPage; //페이지를 블록에 맞게
	total = total - startRow +1;
	List<Board> list = bd.selectList(startRow,endRow);
	if (list != null) {
		for (Board brd : list) {%>
	<tr><td><%=total-- %></td>
		<td><a href="../main/temp.jsp?pgm=/board3/view.jsp?num=<%=brd.getNum() %>&pageNum=<%=nowPage%>">
			<%=brd.getSubject() %></a>
			<% if (brd.getReadcount()>20)
				out.println("<img src='images/hot.gif'>");%>
			</td>
		<td><%=brd.getWriter() %></td>
		
		<td><%=brd.getReadcount() %></td>
		<td><%=brd.getReg_date() %></td></tr>
<% 		}
	} else { %>
		<tr><td colspan="7">데이터가 없습니다.</td></tr>
<%  }%>	
</table>				
<div align="center">
	<% if(startPage > pagePerBlock) {	%>
	<a href="../main/temp.jsp?pgm=/board3/list.jsp?pageNum=<%=startPage - pagePerBlock %>">이전</a>
	<% } %>
<% for (int i = startPage; i<=endPage; i++) { %>
	<a href="../main/temp.jsp?pgm=/board3/list.jsp?pageNum=<%=i %>">[<%=i %>]</a>
	<%} 
	if(totalPage > endPage) {	%> 
	<a href="../main/temp.jsp?pgm=/board3/list.jsp?pageNum=<%=startPage + pagePerBlock %>">다음</a>
	<%} %>

<div align="center">
	<button onclick="location.href='<%=path%>/main/temp.jsp?pgm=/board3/memberCheck.jsp'">글쓰기</button>
	<!-- <input type="button" value="글쓰기" onclick="memberCheck()"> -->
</div>
</body>
</html>