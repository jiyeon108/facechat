<%@page import="exboard.Board"%>
<%@page import="exboard.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%	BoardDao bd = BoardDao.getInstance();	
	int ref=0, re_step =0, re_level=0;
	for(int i = 0; i <= 20; i++) {
		Board board = new Board();
		board.setRef(ref); 
		board.setRe_level(re_level); 
		board.setRe_step(re_step);
		String ip = request.getRemoteAddr(); // 글쓴이의 주소를 요청
		board.setIp(ip);
		board.setSubject(""+i);
		board.setWriter(""+i);
		board.setContent(""+i);
		board.setPasswd(""); 
		board.setEmail("");
		bd.insert(board);
	}
	%>
</body>
</html>
