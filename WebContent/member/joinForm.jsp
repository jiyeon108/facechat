<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"  %>
<!DOCTYPE html>
<html>
<head>
<%
	String path = request.getContextPath();
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function Chk() {
		if (frm.password.value != frm.password2.value) {
			alert("암호를 다시 입력하세요");
			frm.password.value = "";
			frm.password2.value = "";
			frm.password.focus();
			return false;
		}
		return true;
	}
	function idchk() {
		window.open("<%=path%>/member/idChk.jsp?id="+frm.id.value, " ", "width='300' height='300'");
	}
</script>
</head>
<body>
	<form action="../member/joinPro.jsp" name="frm" onsubmit="return Chk()">
		<table border="1" width="500" align="center" cellpadding="20">
			<caption>
				<h2>회원가입</h2>
			</caption>
			<tr>
				<th>아이디</th>
				<td class="left"><input type="text" name="id" required="required">
				<input type="button" value="아이디 체크" onclick="idchk()"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td class="left"><input type="password" name="password" required="required"></td>
			</tr>
			<tr>
				<td>암호확인</td>
				<td class="left"><input type="password" name="password2" required="required"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td class="left"><input type="text" name="name" required="required"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td class="left"><input type="text" name="addr" required="required"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td class="left"><input type="text" name="email" required="required"></td>
			</tr>
			<tr>
				<th>피부타입</th>
				<td class="left"><select name="skin">
						<option>지성</option>
						<option>건성</option>
						<option>중성</option>
						<option>민감성</option>
				</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="확인"></td>
			</tr>
		</table>
	</form>
</body>
</html>