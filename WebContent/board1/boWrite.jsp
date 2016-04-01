<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="exboard.*" %>
<%@ page import="java.sql.*,com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="java.util.*,java.io.*, java.sql.*"%> 

<% String path = request.getContextPath(); %>

<% 	request.setCharacterEncoding("utf-8"); %>
<%
	String realFolder = "";//웹 어플리케이션상의 절대 경로
	String filename ="";
	MultipartRequest imageUp = null;
	String saveFolder = "images";//파일이 업로드되는 폴더를 지정한다.
	String encType = "utf-8"; //엔코딩타입
	int maxSize = 5*1024*1024;  //최대 업로될 파일크기 5Mb
	ServletContext context = getServletContext();
	realFolder = context.getRealPath(saveFolder);  

	imageUp = new MultipartRequest(request,realFolder, maxSize,encType,new DefaultFileRenamePolicy());   
    Enumeration files = imageUp.getFileNames();   
    //파일 정보가 있다면
    while(files.hasMoreElements()){
     //input 태그의 속성이 file인 태그의 name 속성값 :파라미터이름
       String name = (String)files.nextElement();   
    //서버에 저장된 파일 이름
       filename = imageUp.getFilesystemName(name);
    }

	Board_1 bo1 = new Board_1();
	String bo_num = imageUp.getParameter("bo_num");
	String bo_writer = imageUp.getParameter("bo_writer");
	String bo_password = imageUp.getParameter("bo_password");
	String bo_brand = imageUp.getParameter("bo_brand");  
	String bo_price = imageUp.getParameter("bo_price");  
	String bo_capacity = imageUp.getParameter("bo_capacity");  
	String bo_place = imageUp.getParameter("bo_place");   
	String bo_pros = imageUp.getParameter("bo_pros");  
	String bo_cons = imageUp.getParameter("bo_cons"); 
	String bo_reco = imageUp.getParameter("bo_reco");    
	String bo_grade = imageUp.getParameter("bo_grade"); 
 	String bo_readcount = imageUp.getParameter("bo_readcount");
	String bo_likecount = imageUp.getParameter("bo_likecount"); 
	
	bo1.setBo_num(Integer.parseInt(bo_num)); 
	bo1.setBo_writer(bo_writer);
	bo1.setBo_password(bo_password);
	bo1.setBo_brand(bo_brand);
	bo1.setBo_capacity(bo_capacity);
	bo1.setBo_place(bo_place);
	bo1.setBo_pros(bo_pros);
	bo1.setBo_cons(bo_cons);
	bo1.setBo_reco(bo_reco);
	bo1.setBo_imag(filename);
	bo1.setBo_grade(bo_grade);
 	bo1.setBo_readcount(Integer.parseInt(bo_readcount));
	bo1.setBo_likecount(Integer.parseInt(bo_likecount));
	bo1.setReg_date(new Timestamp(System.currentTimeMillis()));
	
 	
	BoardDao_1 boardProcess = BoardDao_1.getInstance();
	int result = boardProcess.insert(bo1);
	if (result > 0) {	
		response.sendRedirect("../board1/board1.jsp");
		
		
	} else { %>

		 <script type="text/javascript">			
		 	alert("데이터 입력중에 에러가 발생했습니다. 메세지 확인하세요");
			location.href ='../board1/boWriteForm.jsp';
		</script>
<%  }  %>