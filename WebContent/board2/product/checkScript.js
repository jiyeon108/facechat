function checkForm(writeform){
	if(!writeform.s_brand.value){
	  alert("브랜드 명을 입력하세요");
	  writeform.s_brand.focus();
	  return false;
	}
	if(!writeform.s_salename.value){
	  alert("세일명을 입력하세요");
	  writeform.s_salename.focus();
	  return false;
	}	
	if(!writeform.s_store.value){
	  alert("매장을 입력하세요");
	  writeform.s_store.focus();
	  return false;
	}  
		
	if(!writeform.s_term.value){
	  alert("세일 기간을 입력하세요 ");
	  writeform.s_term.focus();
	  return false;
	}	
	if(!writeform.s_image.value){
	  alert("이미지를 입력하십시오");
	  writeform.s_image.focus();
	  return false;
	}	
	
	writeform.action = "saleInsertPro.jsp";
    writeform.submit();	
 } 
 
 function updateCheckForm(writeform){
		if(!writeform.s_brand.value){
			  alert("브랜드 명을 입력하세요");
			  writeform.s_brand.focus();
			  return false;
			}
			if(!writeform.s_salename.value){
			  alert("세일명을 입력하세요");
			  writeform.s_salename.focus();
			  return false;
			}	
			if(!writeform.s_store.value){
			  alert("매장을 입력하세요");
			  writeform.s_store.focus();
			  return false;
			}  
				
			if(!writeform.s_term.value){
			  alert("세일 기간을 입력하세요 ");
			  writeform.s_term.focus();
			  return false;
			}	
			if(!writeform.s_image.value){
			  alert("이미지를 입력하십시오");
			  writeform.s_image.focus();
			  return false;
			}	
			
	writeform.action = "saleUpdatePro.jsp";
    writeform.submit();	
 } 
 
 