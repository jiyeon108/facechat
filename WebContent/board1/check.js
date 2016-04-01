function check(){
	if(isNaN(writeform.price.value)){
		alert("가격은 숫자로써주세요");
		writeform.price.focus();
		writeform.price.value = "";
		return false;
	}
	if(isNaN(writeform.capacity.value)){
		alert("용량은 숫자로써주세요");
		writeform.capacity.focus();
		writeform.capacity.value = "";
		return false;
	}
	return true;
 }