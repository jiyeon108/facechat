<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.sql.*"%>
<%@ include file="../managerSessionChk.jsp"%>

<!DOCTYPE html>
<html>
<head>

<title>상품등록</title>

</head>
<body>

	<div align="center">
		<h2>책 등록</h2>
		<form action="../product/saleInsertPro.jsp" method="post" name="writeform" enctype="multipart/form-data">
			<table width="500" border="1">
				<tr>
					<td align="right" colspan="2"><a href="../managerMain.jsp">	관리자 메인으로</a></td>
				</tr>
				<tr>
					<td>브랜드명</td>
					<td><input type="text" size="50" maxlength="50" name="s_brand" required="required"></td>
				</tr>
				<tr>
					<td>세일명</td>
					<td><input type="text" size="50" maxlength="50" name="s_salename" required="required"></td>
				</tr>
				<tr>
					<td>매장</td>
					<td>
				       <select name="s_store">
				           <option>온라인</option>
				           <option>오프라인</option>
				           <option>온/오프라인</option>
						</select>
				</tr>
				<tr>
					<td>기간</td>
					<td><input type="text" size="50" maxlength="50" name="s_term" required="required">
				</td>
				</tr>
				<tr>
					<td>이미지</td>
					<td><input type="file" name="s_image" required="required"></td>
				</tr>
				
				<tr>
					<td colspan=2 align="center">
						<input type="submit" value="등록" >
						<input type="reset" value="다시작성"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>