<%
	if (session.getAttribute("id") == null){
		response.sendRedirect("temp.jsp"); 
	}
%>