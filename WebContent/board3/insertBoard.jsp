<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="exboard.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title></head><body>
<%	BoardDao bd = BoardDao.getInstance();
	int ref = 0,re_step=0,re_level=0;
	String ip = request.getRemoteAddr();
	
	for (int i = 0; i <=50; i++) {
		Board board = new Board();
		board.setRef(ref); 
		board.setRe_level(re_level);
		board.setRe_step(re_step);
		board.setIp(ip);
		board.setSubject("대박"+i);
		board.setWriter("길동"+i);
		board.setContent("왜 안끝나지 아이 씨"+i);
		board.setPassword("1");
		board.setEmail("k@k.com");
		
		bd.insert(board);
	}
%>
성공
</body>
</html>