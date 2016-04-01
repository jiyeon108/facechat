<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.sql.Timestamp"%>
<%@ page import="exboard.*"%>
<%@ include file="../managerSessionChk.jsp"%>
<%
	int s_num = Integer.parseInt(request.getParameter("s_num"));
	String s_brand = request.getParameter("s_brand");
	SaleDao saleProcess = SaleDao.getInstance();
	Sale sale = saleProcess.getSale(s_num);
%>
<!DOCTYPE html>
<html>
<head>
<title>수정</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<style type="text/css">
body {
	text-align: center;
}
</style>
<script type="text/javascript" src="checkScript.js"></script>
</head>
<body>
	<div align="center">
		<h2>수정</h2>
		<form method="post" name="writeform" action="saleUpdatePro.jsp"
			enctype="multipart/form-data">
			<table width="500" border="1">
				<tr>
					<td align="right" colspan="2"><a href="../managerMain.jsp">
							관리자 메인으로</a> &nbsp; <a href="saleList.jsp?s_brand=<%=s_brand%>">목록으로</a>
					</td>
				</tr>

				<tr>
					<td>브랜드</td>
					<td><input type="text" size="50" maxlength="50"
						name="book_title" value="<%=sale.getS_brand()%>"> <input
						type="hidden" name="s_num" value="<%=s_num%>"></td>
				</tr>
				<tr>
					<td>세일명</td>
					<td><input type="text" size="10" maxlength="9"
						name="s_salename" value="<%=sale.getS_salename()%>"></td>
				</tr>
				<tr>
					<td>매장</td>
					<td><input type="text" size="10" maxlength="5" name="s_store"></td>
					<select>
						<option>온라인</option>
						<option>오프라인</option>
						<option>온/오프라인</option>
					</select>
				</tr>

				<tr>
					<td>기간</td>
					<td><input type="date" size="10" maxlength="9" name="s_term"
						value="<%=sale.getS_term()%>"></td>
				</tr>
				<tr>
					<td>이미지</td>
					<td><input type="file" name="s_image"
						value="<%=sale.getS_image()%>"><%=sale.getS_image()%></td>
				</tr>

				<tr>
					<td colspan=2 align="center"><input type="button" value="책수정"
						onclick="updateCheckForm(this.form)"> <input type="reset"
						value="다시작성"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>