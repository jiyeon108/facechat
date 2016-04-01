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
		String path = request.getContextPath();

		MemberDao2 md = MemberDao2.getInstance();
		int result = md.loginChk2(mem2.getId(), mem2.getPassword());
		if (result > 0) {
			session.setAttribute("id", mem2.getId());
			if(mem2.getId().equals("master")) {%>
			<script type="text/javascript">
				alert("관리자 페이지로 넘어 갑니다.")
				location.href="<%=path %>manager/managerMain.jsp"
			</script>
				<%} %>		
				
		<%	response.sendRedirect("../main/temp.jsp");
		} else if (result == 0) {
	%>
	<script type="text/javascript">
			alert("암호가 틀렸습니다. ");
			history.go(-1);
		</script>
	<%
		} else {
	%>
	<script type="text/javascript">
		alert("회원가입하세요 ");
		location.href = "<%=path%>/main/temp.jsp?pgm=/member/joinForm.jsp";
	</script>
	<%
		}
	%>

</body>
</html>