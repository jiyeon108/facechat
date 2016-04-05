<%  
	String id ="";
	String path = application.getContextPath();
	// System.out.println("path = " + path);
    id = (String)session.getAttribute("id");
	if(id == null || id.equals("")){
       response.sendRedirect(path+"../writeForm.jsp");
	} 
%>