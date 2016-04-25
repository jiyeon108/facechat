<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="exboard.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function chk() {
		frm
	}
</script>
<style type="text/css">
	th {font-size: 20px; font-family: 빅;}
	caption{font-size: 25px; font-family: 빅;}
</style>
<!-- <link rel="stylesheet" type="text/css" href="comm.css"> -->
</head>
<body>
	<%
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		BoardDao bd = BoardDao.getInstance();
		Board board = bd.select(num);
		
	%>
	<form action="../board3/updatePro.jsp" name="frm" onsubmit="return chk()">
		<input type="hidden" name="num" value="<%=board.getNum()%>">
		<input type="hidden" name="pageNum" value="<%=pageNum%>">
		<table border="1" align="center" width="70%" size= 20px; cellspacing="0">
			<caption>게시판 수정</caption>
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject" required="required"
					autofocus="autofocus" value="<%=board.getSubject()%>"></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="writer" required="required"
					value="<%=board.getWriter()%>"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="email" name="email" required="required"
					value="<%=board.getEmail()%>"></td>
			</tr>
			<tr>
				<th>암호</th>
				<td><input type="password" name="passwd" required="required" ></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="5" cols="50" name="content"
						required="required" ><%=board.getContent()%></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="확인"><input
					type="reset" value="취소"></td>
			</tr>

		</table>
	</form>
</body>
</html>
