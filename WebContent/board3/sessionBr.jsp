<%
	String id = (String)session.getAttribute("id");
	if(id == ""){
		response.sendRedirect("writeForm.jsp");
	}
%>