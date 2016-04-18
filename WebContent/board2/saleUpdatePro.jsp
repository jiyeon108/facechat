<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> 
<%@ page import = "exboard.*" %>
<%@ page import = "com.oreilly.servlet.MultipartRequest"%>
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import = "java.util.*,java.io.*"%>
<!DOCTYPE HTML>
<html>
<head>
<%
	String path = request.getContextPath();
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%

   request.setCharacterEncoding("utf-8");
   String realFolder = "";
   String filename   ="";
   MultipartRequest imageUp = null;

   String saveFolder = "/board2/imageFile"; 
   String encType    = "utf-8"; 
   int maxSize = 5*1024*1024; 
   ServletContext context = getServletContext();
   realFolder = context.getRealPath(saveFolder);  
   imageUp = new MultipartRequest(request,realFolder,maxSize, encType,new DefaultFileRenamePolicy());
   //전송한 파일 정보를 가져와 출력한다
   Enumeration files = imageUp.getFileNames();   
   //파일 정보가 있다면
   while(files.hasMoreElements()){
    //input 태그의 속성이 file인 태그의 name 속성값 :파라미터이름
      String name = (String)files.nextElement();   
   //서버에 저장된 파일 이름
      filename = imageUp.getFilesystemName(name);
   }

  Sale sale = new Sale();
  int s_num= Integer.parseInt(imageUp.getParameter("s_num"));  
   String s_brand	  = imageUp.getParameter("s_brand");
  String s_salename   = imageUp.getParameter("s_salename");
  String s_store 	  = imageUp.getParameter("s_store");
  String s_term 	  = imageUp.getParameter("s_term");
  String s_link		  = imageUp.getParameter("s_link");
  
  
  sale.setS_brand(s_brand);
  sale.setS_salename(s_salename);
  sale.setS_store(s_store);
  sale.setS_term(s_term);
  sale.setS_link(s_link);
  
  SaleDao sd = SaleDao.getInstance();
  int result = sd.updateSale(sale, s_num);
  if (result > 0 ) {
  	response.sendRedirect(path+"/main/temp.jsp?pgm=/board2/saleList.jsp?s_brand="+s_brand);
  } else {
%>
	<script type="text/javascript">
		alert("수정중에 에러 발생, 콘솔 메세지를 확인하세요");
		location.href='../board2/saleUpdateForm.jsp';
	</script>
<%  }  %>