<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String fileSave = "images";
	String realPath = application.getRealPath(fileSave);
	int maxSize = 5 * 1024 * 1024;	//5M
	MultipartRequest mr = new MultipartRequest(request,realPath,
			maxSize,"utf-8",new DefaultFileRenamePolicy());
	String bo_writer = mr.getParameter("bo_writer");
	String bo_imag = mr.getFilesystemName("bo_imag");
	String oriName = mr.getOriginalFileName("bo_imag");
	File file= new File(realPath+"/"+bo_imag);
	int fileSize = (int)file.length();
%>
<h2>파일 업로드 결과</h2>
작성자 : <%=bo_writer %><p>
파일명 : <%=bo_imag %><p>
원래명 : <%=oriName %><p>
크기 : <%=fileSize %><p>
그림 : <br>
<img alt="" src="../images/<%=bo_imag %>">
</body>
</html>