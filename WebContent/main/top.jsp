<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	String path = request.getContextPath();
%>
<link href="comm.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function join() {
	inform.action='<%=path%>/main/temp.jsp?pgm=/member/joinForm.jsp';
	inform.submit();
}
</script>
</head>
<body>
	<form action="../member/loginPro.jsp" name="inform" method="post">
		<%
			String id = (String) session.getAttribute("id");
			if (id == null || id == "") {
		%>
		<table border="1" cellspacing="0" width="100%">
			<tr height="100">
				<td width="30%">
					<a href="temp.jsp?pgm=home.jsp"><img src="logo.jpg" width="150" height="120"></a>
				</td>
				<td width="45%">
					<input type="text" placeholder="검색" size="30">
				</td>
				<td width="25%" class="right">
					아이디: <input type="text" name="id" size="15" maxlength="12">
					<p>
					패스워드: <input type="password" name="password" size="15"	maxlength="12">
					<p>
					<input type="submit" value="로그인" name="login">
					<input type="button" value="회원가입" onclick="join()">
				</td>
			</tr>
		</table>
	<%
		} else {
	%>
	<table border="1" cellspacing="0" width="100%">
		<tr height="100">
			<td width="30%">
					<a href="temp.jsp?pgm=home.jsp"><img src="logo.jpg" width="150" height="120"></a>
			</td>
			<td width="45%">
					<input type="text" placeholder="검색" size="30">
			</td>
			<td width="25%" class="right">
				<b><%=session.getAttribute("id")%>님 환영합니다.</b>
				<p>
				<input type="button" value="마이페이지"
					onclick="location.href='<%=path%>/main/temp.jsp?pgm=/member/mypage.jsp'">
				<input type="button" value="로그아웃"
					onclick="location.href='<%=path%>/member/logout.jsp'">
			</td>
		</tr>
	</table>
	<%
		}
	%>
	</form>

</body>
</html>


