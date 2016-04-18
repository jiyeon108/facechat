<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="exboard.*"%>
<!DOCTYPE html>
<html>
<%
	String path = request.getContextPath();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.m { width: 300px;
		height: 300px;	
	}
</style>
</head>
<body>
	<%
		int bo_num = Integer.parseInt(request.getParameter("bo_num"));
		String pageNum = request.getParameter("pageNum");
		BoardDao_1 bd1 = BoardDao_1.getInstance();
		bd1.updateHit(bo_num);
		Board_1 bo1 = bd1.select(bo_num);
		if (bo1 != null) {
	%>
	<table border="1" align="center">
		<tr>
			<td><%=bo1.getId()%><br>
				작성일<br><%=bo1.getReg_date()%></td>
			<td>별점<br><%=bo1.getBo_brand()%></td>
		</tr>
		<tr>
			<td>좋아요<br><%=bo1.getBo_likecount()%></td>
			<td>조회수<br><%=bo1.getBo_readcount()%></td>
		</tr>
		<tr>
			<td colspan="2"><%=bo1.getBo_brand()%></td>
		</tr>
		<tr>
			<td colspan="2">가격<%=bo1.getBo_price()%>
				용량<%=bo1.getBo_capacity()%>
				구매장소<%=bo1.getBo_place()%></td>
		</tr>
		<tr>
			<td colspan="2">장점<br><%=bo1.getBo_pros()%></td>
		</tr>
		<tr>
			<td colspan="2">단점<br><%=bo1.getBo_cons()%></td>
		</tr>
		<tr>
			<td colspan="2">꿀팁<br><%=bo1.getBo_reco()%></td>
		</tr>
		<tr>
			<td colspan="2"><img class="m" src="../board1/images/<%=bo1.getBo_image()%>"></td>
		</tr>
	</table>
	<%
		} else {
	%>
	데이터가 없습니다
	<%
		}
	%>
	<button onclick="location.href='<%=path%>/main/temp.jsp?pgm=/board1/boUpdateForm.jsp' ">수정</button>
	<button onclick="location.href='<%=path%>/main/temp.jsp?pgm=/board1/boDeleteForm.jsp' ">삭제</button>
</body>
</html>