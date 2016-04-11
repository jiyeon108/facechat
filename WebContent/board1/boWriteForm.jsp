<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="exboard.*"%>
<%@ include file="boSession.jsp" %>
<%@ include file="boLoginChk.jsp" %>
<%
	MemberDao2 md = MemberDao2.getInstance();
	Member2 mem2 = md.select(id);
%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../board1/check.js"></script>
</head>
<body>

	<form name="writeform" action="../board1/boWrite.jsp" onsubmit="return check()" 
		method="post" enctype="multipart/form-data">
		<table align="center">
			<caption>
				<h2>포토리뷰 작성</h2>
			</caption>
			<tr>
				<td>아이디 <input type="text" name="bo_writer" readonly="readonly" value="<%=mem2.getId() %>">
				</td>
			</tr>
			<tr>
				<td>비밀번호 <input type="password" name="bo_password" required="required">
				</td>
			</tr>
			<tr>
				<td>상품명 <input type="text" name="bo_brand" required="required">
				</td>
			</tr>
			<tr>
				<td>이미지 <input type="file" name="bo_image" required="required" multiple="multiple">
				</td>
			</tr>
			<tr>
				<td>가격 <input type="text" size="7" name="bo_price" required="required"> 
					용량 <input type="text" size="7" name="bo_capacity" required="required"> 
					구매장소 <input type="text" size="7" name="bo_place" required="required">
				</td>
			</tr>
			<tr>
				<td>장점
					<p>
						<textarea name="bo_pros" rows="7" cols="45" required="required"></textarea>
				</td>
			</tr>
			<tr>
				<td>단점
					<p>
						<textarea name="bo_cons" rows="7" cols="45" required="required"></textarea>
				</td>
			</tr>
			<tr>
				<td>꿀팁
					<p>
						<textarea name="bo_reco" rows="5" cols="45" required="required"></textarea>
				</td>
			</tr>
			<tr>
				<td>별점주기
					<p><input type="text" name="bo_grade" required="required">
					<!-- 	<div class="title"></div> 
                <div style="display: inline-block" id="rating" class="raty unpa-review-rating"></div>
                	<script>
                    	jQuery('.raty.unpa-review-rating').raty({
                        	half: true,
                            score: function() {
                            return jQuery(this).data('unpa-rating-my-rating');
                            },
                            starHalf: '/assets/raty/images/unpa-star-half.png',
                            starOff : '/assets/raty/images/unpa-star-empty.png',
                            starOn  : '/assets/raty/images/unpa-star.png'
                            });
				   </script> -->
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="확인">
					<input type="reset" value="취소">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>