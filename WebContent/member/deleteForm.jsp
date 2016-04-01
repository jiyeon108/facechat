<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원탈퇴</title>
<script type="text/javascript">
function del(){	
	if (frm.password.value == '') {
		alert('비밀번호를 입력해주세요.');
		frm.password.focus();
		return false;
	}
	frm.submit();
}
</script>

</head>
<body>

	<h2>탈퇴하려면 암호를 입력하세요</h2>
	<form action="../member/delete.jsp" name="frm" onsubmit="return del()">
		암호 : <input type="password" name="password">
		<p>
		<input type="submit" value="확인">
	</form>
	
</body>
</html>