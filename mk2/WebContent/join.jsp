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
<link rel="stylesheet" href="./css/join.css">
</head>
<body>

<div class="container">
	<table>
		<form action="uJoin.do" method="post" name="reg_frm">
			<tr>
				<td>아이디</td>
				<td>
					<input type="text" name="userID" maxlength="12">
					<input type="button" value="중복확인" >
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="userPassword" maxlength="12"></td>
			</tr>
			<tr>
				<td>비밀번호재입력</td>
				<td><input type="password" name="uPW_check" maxlength="12"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="userName" maxlength="8"></td>
			</tr>
			<tr>
				<td>별명</td>
				<td><input type="text" name="userNickname" maxlength="8"></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<input type="radio" name="userGender" value="1" checked>남자 &nbsp;
					<input type="radio" name="userGender" value="0">여자
				</td>
			</tr>
			<tr>
				<td>연락처</td>
				<td>010 - 
					<input type="text" name="userPhone1" maxlength="4"> - 
					<input type="text" name="userPhone2" maxlength="4">
				</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>
					<input type="text" name="userEmail1" maxlength="20"> @ 
					<input type="text" name="userEmail2" maxlength="20">
				</td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="userAddress" maxlength="50"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" value="회원가입" onclick="joinConfirm()"></td>
			</tr>
			
		</form>
	</table>
</div>

	<script src="js/user.js" type="text/javascript" charset="utf-8"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>