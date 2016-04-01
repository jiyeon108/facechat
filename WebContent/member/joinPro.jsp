<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="exboard.*"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="mem2" class="exboard.Member2"></jsp:useBean>
	<jsp:setProperty property="*" name="mem2" />
	<%
		MemberDao2 md2 = MemberDao2.getInstance();
		int result2 = md2.insert2(mem2);
		if (result2 > 0) {
	%>
	<script type="text/javascript">
		alert("회원가입이 완료되었습니다");
		location.href = "../main/temp.jsp";
	</script>
	<%
		} else {
	%>
	<script type="text/javascript">
		alert("다시 입력해주세요");
		history.go(-1);
	</script>
	<%
		}
	%>
</body>
</html>