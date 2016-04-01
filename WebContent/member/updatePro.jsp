<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="exboard.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="mem2" class="exboard.Member2"></jsp:useBean>
	<jsp:setProperty property="*" name="mem2" />
	<%
		MemberDao2 md = MemberDao2.getInstance();
		int result = md.update(mem2);
		if (result > 0) {
	%>
	<script type="text/javascript">
		alert("수정 완료 ");
		location.href = "../main/temp.jsp?pgm=/member/mypage.jsp";
	</script>
	<%
		} else {
	%>
	<script type="text/javascript">
		alert("수정 실패");
		history.go(-1);
	</script>
	<%
		}
	%>
</body>
</html>