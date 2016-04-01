<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="exboard.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	String id = request.getParameter("id");
%>

<script type="text/javascript">
	function cl() {
		opener.frm.id.value="<%=id%>";
		window.close();
	}
</script>
</head>
<body>
	<%
		MemberDao2 md = MemberDao2.getInstance();
		int result = md.idChk(id);
		if (result == 1) {
	%>

	<%=id%>는 사용중인 아이디입니다
	<p>
	<form>
		id : <input type="text" name="id">
		<p>
			<input type="submit" value="확인">
	</form>

	<%
		} else {
	%>
	<%=id%>는 사용 가능한 아이디입니다
	<button onclick="cl()">창닫기</button>
	<%
		}
	%>
</body>
</html>