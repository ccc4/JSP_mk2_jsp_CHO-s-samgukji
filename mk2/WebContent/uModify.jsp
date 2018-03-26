<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>슈미뽐</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="#">
</head>
<body>

<c:choose>
	<c:when test="${empty sessionScope.getUser }">
		<script type="text/javascript">
			alert("잘못된 접근 경로입니다.");
			location.href="index.jsp";
		</script>
	</c:when>
</c:choose>

	<!-- 상단 내비게이션 시작 -->
	<nav class="navbar navbar-default">
	<div class="container">

		<!-- 타이틀 및 줄였을 때 목록바 -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" 
			data-target="#navbar" aria-expanded="false" aria-controls="navbar">
				<span class="sr-only"></span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.jsp">SYUMIBBOM</a>
		</div>
		<!-- 타이틀 및 줄였을 때 목록바 끝 -->

		<!-- 내비게이션 메뉴 -->
		<div id="navbar" class="collapse navbar-collapse">
			<!-- 내비게이션 좌측 메뉴 -->
			<ul class="nav navbar-nav">
				<li><a href="index.jsp">메인</a></li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
						앨범
						<sapn class="caret"></sapn>
					</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">사진</a></li>
						<li class="divider"></li>
						<li><a href="#">동영상</a></li>
					</ul>
				</li>
				<li><a href="board.do">게시판</a></li>
				<li>
					<a href="https://www.instagram.com/syuyamom/" style="padding-top: 9px; padding-bottom: 9px;">
						<img src="images/instagramicon.ico" alt="인스타그램">
					</a>
				</li>
			</ul>
			<!-- 내비게이션 좌측 메뉴 끝 -->
			
			<!-- 내비게이션 우측 로그인or회원가입 -->
			<ul class="nav navbar-nav navbar-right">
				<li><a disable>${getUser.userNickname }님 환영합니다.</a></li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
						<sapn class="glyphicon glyphicon-user"></sapn>
					</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="uModify.jsp">회원정보수정</a></li>
						<li class="divider"></li>
						<li><a href="uLogout.jsp">로그아웃</a></li>
					</ul>
				</li>
			</ul>
			<!-- 내비게이션 우측 로그인or회원가입 -->
		</div>
		<!-- 내비게이션 메뉴 끝 -->

	</div>
	</nav>
	<!-- 상단 내비게이션 끝 -->

	<!-- 본문 -->
	<div>
		<!-- 회원정보수정 -->
		<div class="container">
			<table>
				<form action="uModify.do" method="post" name="reg_frm">
					<tr>
						<td>아이디</td>
						<td>
							<p>${sessionScope.id }</p>
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
						<td><input type="text" name="userName" maxlength="8" value="${getUser.userName }"></td>
					</tr>
					<tr>
						<td>별명</td>
						<td><input type="text" name="userNickname" maxlength="8" value="${getUser.userNickname }"></td>
					</tr>
					<tr>
						<td>성별</td>
						<td>
							<c:choose>
								<c:when test="${getUser.userGender == 1 }">
									<input type="radio" name="userGender" value="1" checked>남자 &nbsp;
									<input type="radio" name="userGender" value="0">여자
								</c:when>
								<c:otherwise>
									<input type="radio" name="userGender" value="1">남자 &nbsp;
									<input type="radio" name="userGender" value="0" checked>여자
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<td>연락처</td>
						<td>010 - 
							<input type="text" name="userPhone1" maxlength="4" value="${getUser.userPhone1 }"> - 
							<input type="text" name="userPhone2" maxlength="4" value="${getUser.userPhone2 }">
						</td>
					</tr>
					<tr>
						<td>이메일</td>
						<td>
							<input type="text" name="userEmail1" maxlength="20" value="${getUser.userEmail1 }"> @ 
							<input type="text" name="userEmail2" maxlength="20" value="${getUser.userEmail2 }">
						</td>
					</tr>
					<tr>
						<td>주소</td>
						<td><input type="text" name="userAddress" maxlength="50" value="${getUser.userAddress }"></td>
					</tr>
					<tr>
						<td colspan="2"><input type="button" value="회원정보 수정" onclick="modifyConfirm()"></td>
					</tr>
				</form>
			</table>
		</div>
		<!-- 회원정보수정 끝 -->
	</div>
	<!-- 본문 끝 -->


	<footer class="footer">
	<div class="container">
		<p class="text-muted">Copyright &copy; SYUMIBBOM</p>
	</div>
	</footer>


	<script src="js/user.js" type="text/javascript" charset="utf-8"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>