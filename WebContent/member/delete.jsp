<%@page import="exboard.MemberDao2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="sessionChk.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		String password = request.getParameter("password");
		MemberDao2 mem2 = MemberDao2.getInstance();
		int del = mem2.loginChk2(id, password);
		if (del == 1) {
			int result = mem2.delete(id);
			if (result > 0) {
				session.invalidate();
	%>
	<script type="text/javascript">
		alert("탈퇴 완료");
		location.href = "../main/temp.jsp";
	</script>
	<%
		} else {
	%>
	<script type="text/javascript">
		alert("탈퇴 실패");
		history.go(-1);
	</script>
	<%
		}
		} else {
	%>
	<script type="text/javascript">
		alert("비밀번호를 확인해주세요.");
		history.go(-1);
	</script>
	<%
		}
	%>

</body>
</html>