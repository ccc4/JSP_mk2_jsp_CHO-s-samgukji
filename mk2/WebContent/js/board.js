/**
 * 
 */
function writeConfirm() {
	var form = document.write_frm;
	
	if(!form.bTitle.value) {
		alert("제목을 입력해주세요.");
		form.bTitle.focus();
		return false;
	}
	
	if(!form.bContent.value) {
		alert("내용을 한글자이상 입력해주세요.");
		form.bContent.focus();
		return false;
	}
	
	form.submit();
}

function modifyConfirm() {
	var form = document.write_frm;
	
	if(!form.bTitle.value) {
		alert("제목을 입력해주세요.");
		form.bTitle.focus();
		return false;
	}
	
	if(!form.bContent.value) {
		alert("내용을 한글자이상 입력해주세요.");
		form.bContent.focus();
		return false;
	}
	
	form.submit();
}