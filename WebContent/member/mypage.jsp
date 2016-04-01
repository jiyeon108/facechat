<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="exboard.*"%>
<%@ include file="sessionChk.jsp"%>
<%
	MemberDao2 md = MemberDao2.getInstance();
	Member2 mem2 = md.select(id);
%>
<!DOCTYPE html>
<html>
<head>
<%
	String path = request.getContextPath();
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인</title>
<script type="text/javascript">
function chk() {
		if (frm.password.value != frm.password2.value) {
			alert("암호를 다시 입력하세요");
			frm.password.value = "";
			frm.password2.value = "";
			frm.password.focus();
			return false;
		}
		return true;
}
</script>
<link rel="stylesheet" type="text/css" href="../temp.css">
</head>
<body>

	<h1>My Page</h1>
	<form action='../member/updatePro.jsp' name="frm" onsubmit="return chk()">
		<table border="1" width="500" align="center" cellpadding="20">
			<caption>
				<h2>정보수정</h2>
			</caption>
			<tr>
				<td>아이디</td>
				<td class="left"><%=id%><input type="hidden" name="id" value="<%=mem2.getId()%>"></td>
			</tr>
			<tr>
				<td>암호</td>
				<td class="left"><input type="password" name="password" required="required" value="<%=mem2.getPassword()%>"></td>
			</tr>
			<tr>
				<td>암호확인</td>
				<td class="left"><input type="password" name="password2" required="required"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td class="left"><input type="text" name="name" required="required" value="<%=mem2.getName()%>"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td class="left"><input type="text" size="30" name="addr" required="required" value="<%=mem2.getAddr()%>"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td class="left"><input type="text" size="30" name="email" required="required" value="<%=mem2.getEmail()%>"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<input type="submit" value="수정완료">
				<input type="button" value="회원탈퇴"
					onclick="location.href='<%=path%>/main/temp.jsp?pgm=/member/deleteForm.jsp'">
			</tr>
		</table>
	</form>
</body>
</html>