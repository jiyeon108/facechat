<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="exboard.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int bo_num = Integer.parseInt(request.getParameter("bo_num"));
	BoardDao_1 bd1 = BoardDao_1.getInstance();
	Board_1 bo1 = bd1.select(bo_num);
%>
<form action="../board1/boUpdate.jsp" name="frm">
	<table border="1" align="center">
		<caption><h2>리뷰 수정</h2></caption>
		<tr>
			<td>아이디 <input type="text" name="bo_writer" required="required"
						 value="<%=bo1.getBo_writer()%>">
			</td>
		</tr>
		<tr>
			<td>비밀번호 <input type="password" name="bo_password" required="required">
			</td>
		</tr>
		<tr>
			<td>상품명 <input type="text" name="bo_brand" required="required"
				 value="<%=bo1.getBo_brand()%>">
			</td>
		</tr>
		<tr>
			<td>이미지 <input type="file" name="bo_image" required="required" multiple="multiple">
			</td>
		</tr>
		<tr>
			<td>가격 <input type="text" size="7" name="bo_price" required="required"
					 value="<%=bo1.getBo_price()%>"> 
				용량 <input type="text" size="7" name="bo_capacity" required="required"
					 value="<%=bo1.getBo_capacity()%>"> 
				구매장소 <input type="text" size="7" name="bo_place" required="required"
					 value="<%=bo1.getBo_place()%>">
			</td>
		</tr>
		<tr>
			<td>장점
				<p>
					<textarea name="bo_pros" rows="7" cols="45"><%=bo1.getBo_pros()%></textarea>
			</td>
		</tr>
		<tr>
			<td>단점
				<p>
					<textarea name="bo_cons" rows="7" cols="45"><%=bo1.getBo_cons()%></textarea>
			</td>
		</tr>
		<tr>
			<td>꿀팁
				<p>
				<textarea name="bo_reco" rows="5" cols="45"><%=bo1.getBo_reco()%></textarea>
			</td>
		</tr>
		<tr>
			<td>별점주기
				<p><input type="text" name="bo_grade" value="<%=bo1.getBo_grade()%>">
			</td>
		</tr>
	</table>
</form>
</body>
</html>