<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="exboard.*" %>
<%@ page import="java.sql.*,com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="java.util.*,java.io.*"%> 

<!DOCTYPE ">
<html>
<head>
<%
	String path = request.getContextPath();
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 	request.setCharacterEncoding("utf-8"); 
%>
<%
	String realFolder = "";//웹 어플리케이션상의 절대 경로
	String filename ="";
	MultipartRequest imageUp = null;
	String saveFolder = "board2/imageFile";//파일이 업로드되는 폴더를 지정한다.
	String encType = "utf-8"; //엔코딩타입
	int maxSize = 5*1024*1024;  //최대 업로될 파일크기 5Mb
	ServletContext context = getServletContext();
	realFolder = context.getRealPath(saveFolder);  
	imageUp = new MultipartRequest(request, realFolder, maxSize,encType,new DefaultFileRenamePolicy());   
    Enumeration files = imageUp.getFileNames();   
    //파일 정보가 있다면
    while(files.hasMoreElements()){
     //input 태그의 속성이 file인 태그의 name 속성값 :파라미터이름
       String name = (String)files.nextElement();   
    //서버에 저장된 파일 이름
       filename = imageUp.getFilesystemName(name);
    }

	Sale sale = new Sale();
	String s_brand 	  = imageUp.getParameter("s_brand");
 	String s_salename = imageUp.getParameter("s_salename");
 	String s_store    = imageUp.getParameter("s_store");
 	String s_term     = imageUp.getParameter("s_term");
	
 	sale.setS_brand   (s_brand);
 	sale.setS_salename(s_salename);
 	sale.setS_store   (s_store);
 	sale.setS_term    (s_term);
 	sale.setS_image   (filename);
 	
	SaleDao saleProcess = SaleDao.getInstance();
	int result = saleProcess.insertSale(sale);
	if (result > 0) {	
		response.sendRedirect(path+"/main/temp.jsp?pgm=/board2/product/saleList.jsp");
		
		
	} else { %>

		 <script type="text/javascript">
			alert("데이터 입력중에 에러가 발생했습니다. 메세지 확인하세요");
			location.href ='<%=path%>/main/temp.jsp?pgm=/board2/product/saleInsertForm.jsp';
		</script>
<%  }  %>