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

<c:choose>
	<c:when test="${sessionScope.getUser != null }">
		<script type="text/javascript">
			location.href = "index.jsp";
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
			<!-- 내비게이션 좌측 -->
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
			<!-- 내비게이션 좌측 끝 -->
			
			<!-- 내비게이션 우측 로그인or회원가입 -->
			<ul class="nav navbar-nav navbar-right">
				<li class="active"><a disable>로그인하기&nbsp;<span class="glyphicon glyphicon-hand-right"></span></a></li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
						<sapn class="glyphicon glyphicon-user active"></sapn>
					</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="uLogin.jsp">로그인</a></li>
						<li class="divider"></li>
						<li><a href="uJoin.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>
			<!-- 내비게이션 우측 로그인or회원가입 끝 -->
		</div>
		<!-- 내비게이션 메뉴 끝 -->

	</div>
	</nav>
	<!-- 상단 내비게이션 끝 -->
	
	<!-- 본문 -->
	<div>
		<!-- 로그인폼 -->
		<div class="container">
			<div class="form-signin">
				<form action="uLogin.do" method="post" name="login_frm">
					<legend class="form-signin-heading">로그인</legend>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="15" onkeypress="if(event.keyCode==13){loginConfirm(); return false;}" autofocus>
						<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="15" onkeypress="if(event.keyCode==13){loginConfirm(); return false;}">
					</div>
					<input type="button" class="btn btn-primary btn-block form-control" value="로그인" onclick="loginConfirm()">
					<input type="button" class="btn btn-primary btn-block form-control" value="회원가입" onclick="location.href='uJoin.jsp'">
				</form>
			</div>
		</div>
		<!-- 로그인폼 끝 -->
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