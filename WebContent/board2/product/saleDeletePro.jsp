<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../managerSessionChk.jsp" %>
<%@ page import = "exboard.*" %>
<%
	request.setCharacterEncoding("utf-8");
    int s_num = Integer.parseInt(request.getParameter("s_num"));
    String s_brand = request.getParameter("s_brand");
 
    SaleDao saleProcess = SaleDao.getInstance();
    int result = saleProcess.deleteSale(s_num);
    if (result > 0 ){ 
	    response.sendRedirect("saleList.jsp?s_brand="+s_brand);
    } else {
%>
	  <script type="text/javascript">
		  alert("삭제 실패!! 콘솔 메세지를 보세요");
		  location.href = 'saleDeleteForm.jsp';
	  </script>
<%  }   %>