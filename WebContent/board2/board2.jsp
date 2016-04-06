<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import = "exboard.*" %>
<%@ page import = "java.text.NumberFormat" %>

<html><head><title>Book Shopping Mall</title>

<style type="text/css">	h3 { text-align: center; }</style></head>
<body ><h3>세일중~~ </h3>
<%
  Sale saleLists[] = null;
  int number =0;
  String s_brandName="";
  
  SaleDao sd = SaleDao.getInstance();
  for(int i = 1; i <= s_num.length; i++){
	  saleLists = sd.getSales(s_num); 
    //  if (saleLists==null) continue; */
	  if(saleLists[0].getS_brand() !=null){
	      S_brandName="세일중";
     }else if(saleLists==null){
    	 continue;
     }
%>
<%--  <br><font size="+1"><b><%=book_kindName%> 분류의 신간목록: 
   <a href="list.jsp?book_kind=<%=bookLists[0].getBook_kind()%>">더보기</a></b></font> --%>
<%             
     for(int j=0;j<saleLists.length;j++){
        if (saleLists[j] ==null) continue;%>
     <table border="0" width="600" align="center"> 
       <tr height="30">
         <td rowspan="4"  width="100" align="center" valign="middle">
             <a href="../main/temp.jsp?pgm=/board2/saleContent.jsp?s_num=<%=saleLists[j].getS_num()%>&s_brand=<%=saleLists[0].getS_brand()%>">
             <img src="board2/imageFile/<%=saleLists[j].getS_image()%>" border="0" width="60" height="90"></a></td> 
         <td width="350"><font size="+1"><b>
             <a href="../main/temp.jsp?pgm=/board2/saleContent.jsp?s_num=<%=saleLists[j].getS_num()%>&s_brand=<%=saleLists[0].getS_brand()%>">
              <%=saleLists[j].getS_salename() %></a></b></font></td> 
         
        
     
       
       
     </table>

</body></html>