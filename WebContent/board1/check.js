function check(){
	if(isNaN(writeform.bo_price.value)){
		alert("가격은 숫자로써주세요");
		writeform.bo_price.focus();
		writeform.bo_price.value = "";
		return false;
	}
	if(isNaN(writeform.bo_capacity.value)){
		alert("용량은 숫자로써주세요");
		writeform.bo_capacity.focus();
		writeform.bo_capacity.value = "";
		return false;
	}
	return true;
 }