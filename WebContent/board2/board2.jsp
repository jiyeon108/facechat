<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="exboard.*"%>
    <%@ page import="java.util.List,java.text.SimpleDateFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String path = request.getContextPath();
%> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<h2> 세일정보  </h2>
<style type="text/css">
	.m { 
		width: 250px;
		height: 200px;	
	}
	.t{
		text-align: center;
		width : 250px;
		height: 200px;
		padding : 40px;
	}
	
</style>

</head>
<body>

<%

	String s_image = request.getParameter("s_image");
	String pageNum = request.getParameter("pageNum");
	if (pageNum == null || pageNum == "") pageNum = "0";
	int nowPage = Integer.parseInt(pageNum);
	SaleDao sd = SaleDao.getInstance();
	List<Sale> list = sd.selectList(1,50);
	
%>

<table align="center" border="0" class ="ta">
<tr>
<%
int i=0 ;
int j=0;
	for(Sale sal : list){	
	
		if(j<=20){
			if(i<=3){
			
%>
		<td class = "t">
			<a href="../main/temp.jsp?pgm=/board2/saleView.jsp?s_num=<%=sal.getS_num()%>&pageNum=<%=nowPage%>">
			<img class ="m" src="../board2/imageFile/<%=sal.getS_image()%>"></a><p>
			<%=sal.getS_brand() %><p>
			<%=sal.getS_term() %><p>
			<font color="gray"><%=sal.getS_salename()%></font><p>
		</td>
<%	j++;
		}
		else{
			j++;
			i=0;%>
	 	</tr>
		<tr>
			<td class = "t">
				<a href="../main/temp.jsp?pgm=/board2/saleView.jsp?s_num=<%=sal.getS_num()%>&pageNum=<%=nowPage%>">
				<img class = "m" src="../board2/imageFile/<%=sal.getS_image()%>"></a><p>
				<%=sal.getS_brand() %><p>
				<%=sal.getS_term() %><p>
				<font color="gray"><%=sal.getS_salename()%> </font><p>
			</td>
<%
		}
		i++;
	}
	
}

%>
		</tr>
</table>

</body>
</html>