<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>슈미뽐</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="./css/login.css">
</head>
<body>

<div class="container">
	<div class="form-signin">
		<form action="uLogin.do" method="post" name="login_frm">
			<legend class="form-signin-heading">로그인</legend>
			<div class="form-group">
				<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="15" onkeypress="if(event.keyCode==13){loginConfirm(); return false;}" autofocus>
				<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="15" onkeypress="if(event.keyCode==13){loginConfirm(); return false;}">
			</div>
			<input type="button" class="btn btn-primary btn-block form-control" value="로그인" onclick="loginConfirm()">
			<input type="button" class="btn btn-primary btn-block form-control" value="회원가입" onclick="location.href='join.jsp'">
		</form>
	</div>
</div>

	<script src="js/user.js" type="text/javascript" charset="utf-8"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>