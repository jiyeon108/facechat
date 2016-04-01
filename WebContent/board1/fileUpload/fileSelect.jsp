<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="fileUpload.jsp" method="post" enctype="multipart/form-data">
	제목 : <input type="text" name="title" required="required"><p>
	작성자 : <input type="text" name="writer" required="required"><p>
	파일 : <input type="file" name="fileName" required="required"><p>
	<input type="submit" value="확인">
</form>
</body>
</html>