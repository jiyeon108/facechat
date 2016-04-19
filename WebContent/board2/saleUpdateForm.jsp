<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.sql.Timestamp"%>
<%@ page import="exboard.*"%>

<%
	int s_num = Integer.parseInt(request.getParameter("s_num"));
	String s_brand = request.getParameter("s_brand");
	SaleDao sd = SaleDao.getInstance();
	Sale sale = sd.getSale(s_num);
%>
<!DOCTYPE html>
<html>
<head>
<%
	String path = request.getContextPath();
%>
<title>수정</title>

<style type="text/css">
body {
	text-align: center;
}

 .a {
	padding-left : 35px;
	float: left;
	size: 50;
}

</style>

</head>
<body>
	<div align="center">
		<h2>수정</h2>
		<form action="../board2/saleUpdatePro.jsp" method="post" name="writeform"  enctype="multipart/form-data">
			<table width="500" border="1">
				<tr>
					<td align="right" colspan="2">
					<a href="../board2/managerMain.jsp"> 관리자 메인으로</a> &nbsp; 
					<a href="<%=path%>/main/temp.jsp?pgm=/board2/saleList.jsp?s_brand=<%=s_brand%>">목록으로</a>
					</td>
				</tr>

				<tr>
					<td>브랜드</td>
					<td><input type="text" size="50" maxlength="50"
						name="s_brand" value="<%=sale.getS_brand()%>"> <input
						type="hidden" name="s_num" value="<%=s_num%>"></td>
				</tr>
				<tr>
					<td>세일명</td>
					<td><input type="text" size="50" maxlength="50"
						name="s_salename" value="<%=sale.getS_salename()%>"></td>
				</tr>
				<tr>
					<td>매장</td>
					<td>
					<select name="s_store" class="a">
						<option>온라인</option>
						<option>오프라인</option>
						<option>온/오프라인</option>
					</select></td>
				</tr>

				<tr>
					<td>기간</td>
					<td><laber><input type="date" id="start" name="s_term" required="required"></laber>
						<laber><input type="date" id="stop" name="s_term" required="required" ></laber>
						</td>
				</tr>
				<tr>
					<td>이미지</td>
					<td><input type="file" name="s_image"
						value="<%=sale.getS_image()%>"><%=sale.getS_image()%></td>
				</tr>
				<tr>
					<td>링크</td>
					<td><input type="url" size="50" maxlength="50" name="s_link"
						value="<%=sale.getS_link()%>"></td>
				</tr>

				<tr>
					<td colspan=2 align="center">
					<input type="submit" value="수정"> 
					<input type="reset" value="다시작성"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>