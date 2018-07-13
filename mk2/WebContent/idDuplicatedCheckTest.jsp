<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="#" method="post" name="reg">
	
		<input type="text" id="userID" name="userID" onkeyup="checkOnKeyUp()">
		<input type="hidden" class="checkHidden" value="unCheck">
		<input type="button" id="checkBtn" value="�ߺ�üũ" onclick="checkID()">
		<span id="span"></span>
		<br>
		<input type="button" value="ȸ������" onclick="submitBtn()">
		
	</form>
	
	
	
	
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script type="text/javascript">
		/* $('#checkBtn').click(function(){
			var id = $('#userID').val();
			
			$.ajax({
				type: 'POST',
				url: './UserIDCheckServlet',
				data: {id: id},
				success: function(result) {
					if(result == 1) {
						$('#span').html('��밡��').css('color', 'blue');						
					} else {
						$('#span').html('���Ұ�').css('color', 'red');
					}
				}
			})
		}) */
		
		function checkID(){
			var id = $('#userID').val();
			
			$.ajax({
				type: 'POST',
				url: './UserIDCheckServlet',
				data: {id: id},
				success: function(result) {
					if(result == 0) {
						$('#span').html('��밡��').css('color', 'blue');
						$('.checkHidden').val('check');
					} else {
						$('#span').html('���Ұ�').css('color', 'red');
						$('.checkHidden').val('duplicated');
					}
				}
			})
		}
		
		function checkOnKeyUp(){
			$('this').next().val('unCheck'); // hidden �� ����
		}
		
		function submitBtn(){
			if(!$('#userID').val()) {
				alert("���̵� �Է����ּ���.");
				$('#userID').focus();
				return false;
			}
			
			if($('#userID').val().length < 4 || $('#userID').val().length > 12) {
				alert("���̵�� 4���� �̻� 12���� ���Ϸ� �Է����ּ���.");
				$('#userID').focus();
				return false;
			}
			
			for (i = 0; i < $('#userID').val().length; i++) {
		        ch = $('#userID').val().charAt(i)
		        if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z') && !(ch >= 'A' && ch <= 'Z')) {
		            alert("���̵�� ��ҹ���, ���ڸ� �Է°����մϴ�.")
		            $('#userID').focus();
		            return false;
		        }
		    }
			
			if($('.checkHidden').val() === 'unCheck') {
				alert("���̵� �ߺ�üũ�� ���ּ���.");
				$('#userID').focus();
				return false;
			} else if($('.checkHidden').val() === 'duplicated') {
				alert("�̹� ����ϰ� �ִ� ���̵��Դϴ�.");
				$('#userID').focus();
				return false;
			}
		}
		
	</script>
</body>
</html>