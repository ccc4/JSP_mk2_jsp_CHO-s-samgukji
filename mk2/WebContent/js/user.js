/**
 * 
 */
function loginConfirm() {
	var form = document.login_frm;

	if(!form.userID.value) {
		alert("아이디를 입력해주세요.");
		form.userID.focus();
		return false;
	}
	
	if(!form.userPassword.value) {
		alert("비밀번호를 입력해주세요.");
		form.userPassword.focus();
		return false;
	}
	
	form.submit();
}

function checkIDOnKeyUp(){
	$('#hiddenID').val('unCheck'); // hidden 값 변경
}
function checkNicknameOnKeyUp(){
	$('#hiddenNickname').val('unCheck'); // hidden 값 변경
}

function uJoinCheckID(){
	var form = document.reg_frm;
	
	if(!form.userID.value) {
		alert("아이디를 입력해주세요.");
		form.userID.focus();
		return false;
	}
	
	if(form.userID.value.length < 4 || form.userID.value.length > 12) {
		alert("아이디는 4글자 이상 12글자 이하로 입력해주세요.");
		form.userID.focus();
		return false;
	}
	
	for (i = 0; i < form.userID.value.length; i++) {
        ch = form.userID.value.charAt(i)
        if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z') && !(ch >= 'A' && ch <= 'Z')) {
            alert("아이디는 대소문자, 숫자만 입력가능합니다.")
            form.userID.focus()
            return false;
        }
    }
	
	
	//아이디 중복체크
	var id = $('#userID').val();
	
	$.ajax({
		type: 'POST',
		url: './UserIDCheckServlet',
		data: {id: id},
		success: function(result) {
			if(result == 0) {
				$('#userIDSpan').html('사용가능').css('color', 'blue');
				$('#hiddenID').val('check');
			} else {
				$('#userIDSpan').html('사용불가').css('color', 'red');
				$('#hiddenID').val('duplicated');
			}
		}
	})
}

function uJoinCheckNickname(){
	var form = document.reg_frm;
	
	if(!form.userNickname.value) {
		alert("별명을 입력해주세요.");
		form.userNickname.focus();
		return false;
	}
	
	if(form.userNickname.value.length < 2 || form.userNickname.value.length > 8) {
		alert("별명을 제대로 입력해주세요.");
		form.userNickname.focus();
		return false;
	}
	
	for (i = 0; i < form.userNickname.value.length; i++) {
        ch = form.userNickname.value.charAt(i)
        if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z') && !(ch >= 'A' && ch <= 'Z') && !(ch >= '가' && ch <= '힣')) {
            alert("별명은 대소문자, 한글, 숫자만 입력가능합니다.")
            form.userNickname.focus()
            return false;
        }
    }
	
	//별명 중복체크
	var nickname = $('#userNickname').val();
	
	$.ajax({
		type: 'POST',
		url: './UserNicknameCheckServlet',
		data: {nickname: nickname},
		success: function(result) {
			if(result == 0) {
				$('#userNicknameSpan').html('사용가능').css('color', 'blue');
				$('#hiddenNickname').val('check');
			} else {
				$('#userNicknameSpan').html('사용불가').css('color', 'red');
				$('#hiddenNickname').val('duplicated');
			}
		}
	})
}

function joinConfirm() {
	var form = document.reg_frm;
//	
//	if(!form.userID.value) {
//		alert("아이디를 입력해주세요.");
//		form.userID.focus();
//		return false;
//	}
//	
//	if(form.userID.value.length < 4 || form.userID.value.length > 12) {
//		alert("아이디는 4글자 이상 12글자 이하로 입력해주세요.");
//		form.userID.focus();
//		return false;
//	}
//	
//	for (i = 0; i < form.userID.value.length; i++) {
//        ch = form.userID.value.charAt(i)
//        if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z') && !(ch >= 'A' && ch <= 'Z')) {
//            alert("아이디는 대소문자, 숫자만 입력가능합니다.")
//            form.userID.focus()
//            return false;
//        }
//    }
	
	if($('#hiddenID').val() === 'unCheck') {
		alert("아이디 중복체크를 해주세요.");
		$('#userID').focus();
		return false;
	} else if($('#hiddenID').val() === 'duplicated') {
		alert("이미 사용하고 있는 아이디입니다.");
		$('#userID').focus();
		return false;
	}
	
	if($('#hiddenNickname').val() === 'unCheck') {
		alert("별명 중복체크를 해주세요.");
		$('#userNickname').focus();
		return false;
	} else if($('#hiddenNickname').val() === 'duplicated') {
		alert("이미 사용하고 있는 별명입니다.");
		$('#userNickname').focus();
		return false;
	}
	
	if(!form.userPassword.value) {
		alert("비밀번호를 입력해주세요.");
		form.userPassword.focus();
		return false;
	}
	
	if(form.userPassword.value.length < 4 || form.userPassword.value.length > 12) {
		alert("비밀번호는 4글자 이상 12글자 이하로 입력해주세요.");
		form.userPassword.focus();
		return false;
	}
	
	for (i = 0; i < form.userPassword.value.length; i++) {
        ch = form.userPassword.value.charAt(i)
        if (ch == ' ') {
            alert("비밀번호에 띄어쓰기는 입력 불가능합니다.")
            form.userPassword.focus()
            return false;
        }
    }
	
	if(form.userPassword.value !== form.uPW_check.value) {
		alert("비밀번호재입력을 확인해주세요.");
		form.uPW_check.focus();
		return false;
	}
	
	if(!form.userName.value) {
		alert("이름을 입력해주세요.");
		form.userName.focus();
		return false;
	}
	
	if(form.userName.value.length < 2 || form.userName.value.length > 8) {
		alert("이름을 제대로 입력해주세요.");
		form.userName.focus();
		return false;
	}
	
	if(!isNaN(form.userName.value)) {
		alert("이름은 문자만 입력 가능합니다.");
		form.userName.focus();
		return false;
	}
	
	for (i = 0; i < form.userName.value.length; i++) {
        ch = form.userName.value.charAt(i)
        if (!(ch >= '가' && ch <= '힣')) {
            alert("이름을 제대로 입력해주세요.")
            form.userName.focus()
            return false;
        }
    }
	
//	if(!form.userNickname.value) {
//		alert("별명을 입력해주세요.");
//		form.userNickname.focus();
//		return false;
//	}
//	
//	if(form.userNickname.value.length < 2 || form.userNickname.value.length > 8) {
//		alert("별명을 제대로 입력해주세요.");
//		form.userNickname.focus();
//		return false;
//	}
//	
//	for (i = 0; i < form.userNickname.value.length; i++) {
//        ch = form.userNickname.value.charAt(i)
//        if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z') && !(ch >= 'A' && ch <= 'Z') && !(ch >= '가' && ch <= '힣')) {
//            alert("별명은 대소문자, 한글, 숫자만 입력가능합니다.")
//            form.userNickname.focus()
//            return false;
//        }
//    }
	
	if(!form.userPhone1.value) {
		alert("연락처를 입력해주세요.");
		form.userPhone1.focus();
		return false;
	}
	
	if(form.userPhone1.value.length !== 4) {
		alert("연락처를 제대로 입력해주세요.");
		form.userPhone1.focus();
		return false;
	}
	
	if(isNaN(form.userPhone1.value)) {
		alert("연락처를 제대로 입력해주세요.");
		form.userPhone1.focus();
		return false;
	}
	
	if(!form.userPhone2.value) {
		alert("연락처를 입력해주세요.");
		form.userPhone2.focus();
		return false;
	}
	
	if(form.userPhone2.value.length !== 4) {
		alert("연락처를 제대로 입력해주세요.");
		form.userPhone2.focus();
		return false;
	}
	
	if(isNaN(form.userPhone2.value)) {
		alert("연락처를 제대로 입력해주세요.");
		form.userPhone2.focus();
		return false;
	}
	
	if(!form.userEmail1.value) {
		alert("이메일을 입력해주세요.");
		form.userEmail1.focus();
		return false;
	}
	
	if(!form.userEmail2.value) {
		alert("이메일을 입력해주세요.");
		form.userEmail2.focus();
		return false;
	}
	
	if(!form.userAddress.value) {
		alert("주소를 입력해주세요.");
		form.userAddress.focus();
		return false;
	}
	
	form.submit();
}

function modifyConfirm() {
	var form = document.reg_frm;
	
	if(!form.userPassword.value) {
		alert("비밀번호를 입력해주세요.");
		form.userPassword.focus();
		return false;
	}
	
	if(form.userPassword.value.length < 4 || form.userPassword.value.length > 12) {
		alert("비밀번호는 4글자 이상 12글자 이하로 입력해주세요.");
		form.userPassword.focus();
		return false;
	}
	
	for (i = 0; i < form.userPassword.value.length; i++) {
        ch = form.userPassword.value.charAt(i)
        if (ch == ' ') {
            alert("비밀번호에 띄어쓰기는 입력 불가능합니다.")
            form.userPassword.focus()
            return false;
        }
    }
	
	if(form.userPassword.value !== form.uPW_check.value) {
		alert("비밀번호재입력을 확인해주세요.");
		form.uPW_check.focus();
		return false;
	}
	
	if(!form.userName.value) {
		alert("이름을 입력해주세요.");
		form.userName.focus();
		return false;
	}
	
	if(form.userName.value.length < 2 || form.userName.value.length > 8) {
		alert("이름을 제대로 입력해주세요.");
		form.userName.focus();
		return false;
	}
	
	if(!isNaN(form.userName.value)) {
		alert("이름은 문자만 입력 가능합니다.");
		form.userName.focus();
		return false;
	}
	
	for (i = 0; i < form.userName.value.length; i++) {
        ch = form.userName.value.charAt(i)
        if (!(ch >= '가' && ch <= '힣')) {
            alert("이름을 제대로 입력해주세요.")
            form.userName.focus()
            return false;
        }
    }
	
	if(!form.userNickname.value) {
		alert("별명을 입력해주세요.");
		form.userNickname.focus();
		return false;
	}
	
	if(form.userNickname.value.length < 2 || form.userNickname.value.length > 8) {
		alert("별명을 제대로 입력해주세요.");
		form.userNickname.focus();
		return false;
	}
	
	for (i = 0; i < form.userNickname.value.length; i++) {
        ch = form.userNickname.value.charAt(i)
        if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z') && !(ch >= 'A' && ch <= 'Z') && !(ch >= '가' && ch <= '힣')) {
            alert("별명은 대소문자, 한글, 숫자만 입력가능합니다.")
            form.userNickname.focus()
            return false;
        }
    }
	
	if(!form.userPhone1.value) {
		alert("연락처를 입력해주세요.");
		form.userPhone1.focus();
		return false;
	}
	
	if(form.userPhone1.value.length !== 4) {
		alert("연락처를 제대로 입력해주세요.");
		form.userPhone1.focus();
		return false;
	}
	
	if(isNaN(form.userPhone1.value)) {
		alert("연락처를 제대로 입력해주세요.");
		form.userPhone1.focus();
		return false;
	}
	
	if(!form.userPhone2.value) {
		alert("연락처를 입력해주세요.");
		form.userPhone2.focus();
		return false;
	}
	
	if(form.userPhone2.value.length !== 4) {
		alert("연락처를 제대로 입력해주세요.");
		form.userPhone2.focus();
		return false;
	}
	
	if(isNaN(form.userPhone2.value)) {
		alert("연락처를 제대로 입력해주세요.");
		form.userPhone2.focus();
		return false;
	}
	
	if(!form.userEmail1.value) {
		alert("이메일을 입력해주세요.");
		form.userEmail1.focus();
		return false;
	}
	
	if(!form.userEmail2.value) {
		alert("이메일을 입력해주세요.");
		form.userEmail2.focus();
		return false;
	}
	
	if(!form.userAddress.value) {
		alert("주소를 입력해주세요.");
		form.userAddress.focus();
		return false;
	}
	
	form.submit();
}