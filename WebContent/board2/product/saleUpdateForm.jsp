<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.sql.*"%>
<%@ page import="exboard.*"%>
<%@ include file="../managerSessionChk.jsp"%>
<%
	int s_num = Integer.parseInt(request.getParameter("s_num"));
	String s_brand = request.getParameter("s_brand");
	SaleDao sd = SaleDao.getInstance();
	Sale sale = sd.select(s_num);
%>
<!DOCTYPE html>
<html>
<head>
<title>수정</title>

<style type="text/css">
body {
	text-align: center;
}
table {
	width: 500;
}
</style>

</head>
<body>
	<div align="center">
		<h2>수정</h2>
		<form action="../product/saleUpdatePro.jsp" method="post" name="writeform"enctype="multipart/form-data">
			<input type= "hidden" name ="s_num" value = "<%=sale.getS_num() %>">
					
			<table border="1">
				<tr>
					<td align="right" colspan="2">
						<a href="../managerMain.jsp">관리자 메인으로</a> &nbsp; 
						<a href="../product/saleList.jsp?s_brand=<%=s_brand%>">목록으로</a>
					</td>
				</tr>

				<tr>
					<td>브랜드</td>
					<td><input type="text" size="50" maxlength="50" required="required"
						name="s_brand" autofocus="autofocus" value="<%=sale.getS_brand()%>" > 
						
				</tr>
				<tr>
					<td>세일명</td>
					<td><input type="text" size="50" maxlength="50" required="required"
						name="s_salename" value="<%=sale.getS_salename()%>" ></td>
				</tr>
				<tr>
					<td>매장</td>
					<td><input type="text" size="10" maxlength="5" name="s_store" required="required"></td>
					<select>
						<option>온라인</option>
						<option>오프라인</option>
						<option>온/오프라인</option>
					</select>
				</tr>

				<tr>
					<td>기간</td>
					<td><input type="date" size="50" maxlength="50" name="s_term"
						value="<%=sale.getS_term()%>" required="required"></td>
				</tr>
				<tr>
					<td>이미지</td>
					<td><input type="file" name="s_image" value="<%=sale.getS_image()%>"><%=sale.getS_image()%></td>
				</tr>

				<tr>
					<td colspan=2 align="center">
						<input type="button" value="책수정">
						<input type="reset"value="다시작성"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>