<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="exboard.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" type = "text/css" href = "comm.css">
</head>
<body>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	BoardDao bd = BoardDao.getInstance();
	bd.updateHit(num);
	Board board = bd.select(num);
	if(board != null){ %>
	
	<table border="1"><caption>게시판 상세내용</caption>
		<tr><th>제목</th><td><%=board.getSubject() %></td></tr>
		<tr><th>작성자</th><td><%=board.getWriter() %></td></tr>
		<tr><th>조회수</th><td><%=board.getReadcount() %></td></tr>
		<tr><th>IP</th><td><%=board.getIp() %></td></tr>
		<tr><th>작성일</th><td><%=board.getReg_date() %></td></tr>
		<tr><th>내용</th><td><pre><%=board.getContent() %></pre></td></tr>	
	</table>
<%} else { %>
	데이터가 없습니다.
<%} %>
<div align = "center">
<button onclick="location.href='list.jsp?pageNum=<%=pageNum%>'">게시판 목록</button>
<button onclick ="location.href ='updateForm.jsp?num=<%=num%>&pageNum=<%=pageNum%>'">수정</button>
<button onclick ="location.href ='deleteForm.jsp?num=<%=num%>&pageNum=<%=pageNum%>'">삭제</button>
<button onclick ="location.href ='writeForm.jsp?num=<%=num%>&pageNum=<%=pageNum%>'">답변</button>
</div>
</body>
</html>