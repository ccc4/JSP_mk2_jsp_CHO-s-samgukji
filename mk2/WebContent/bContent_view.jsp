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
<link rel="stylesheet" href="./css/syumibbom.css">
</head>
<body>

	<!-- 상단 내비게이션 시작 -->
	<nav class="navbar navbar-inverse">
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
						<li><a href="#">동영상</a></li>
					</ul>
				</li>
				<li class="active"><a href="board.do">게시판</a></li>
				<li>
					<a href="https://www.instagram.com/syumibbom/" style="padding-top: 9px; padding-bottom: 9px;">
						<img src="images/instagramicon.ico" alt="인스타그램">
					</a>
				</li>
			</ul>
			<!-- 내비게이션 좌측 메뉴 끝 -->
			
			<!-- 내비게이션 우측 로그인or회원가입 -->
			<ul class="nav navbar-nav navbar-right">
				<c:choose>
					<c:when test="${!empty sessionScope.getUser}">
						<li><a disable>${getUser.userNickname }님 환영합니다.</a></li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
							<sapn class="glyphicon glyphicon-user"></sapn></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="uModify.jsp">회원정보수정</a></li>
								<li><a href="uLogout.jsp">로그아웃</a></li>
							</ul>
						</li>
					</c:when>
					<c:otherwise>
						<li><a disable>로그인하기&nbsp;<span class="glyphicon glyphicon-hand-right"></span></a></li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
								<sapn class="glyphicon glyphicon-user"></sapn>
							</a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="uLogin.jsp">로그인</a></li>
								<li><a href="uJoin.jsp">회원가입</a></li>
							</ul>
						</li>
					</c:otherwise>	
				</c:choose>
			</ul>
			<!-- 내비게이션 우측 로그인or회원가입 끝 -->
		</div>
		<!-- 내비게이션 메뉴 -->

	</div>
	</nav>
	<!-- 상단 내비게이션 끝 -->


	<!-- 본문 -->
	<div>
		<!-- 게시글 보기 -->
		<div class="container">
			<table class="table" style="table-layout:fixed; word-break:break-all;">
				<thead>
					<tr>
						<th style="background-color: #eeeeee;">${bContentView.bTitle }</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							글쓴이: ${bContentView.bNickname } &nbsp; 
							등록일: ${bContentView.bDate } &nbsp; 
							조회수: ${bContentView.bHit }
						</td>
					</tr>
					<tr>
						<td height="300">${bContentView.bContent }</td>
					</tr>
				</tbody>
			</table>
			<input type="button" class="btn btn-success pull-left"
				value="목록" onclick="location.href='board.do'">
			<input type="button" class="btn btn-primary pull-right" 
				value="삭제" onclick="location.href='bCheckDelete.jsp?bUserIDX=${bContentView.bUserIDX }&bIDX=${bContentView.bIDX }'">
			<input type="button" class="btn btn-primary pull-right"
				value="수정" onclick="location.href='bCheckModify.jsp?bUserIDX=${bContentView.bUserIDX }&bIDX=${bContentView.bIDX }'">
		</div>
		<!-- 게시글 보기 끝 -->
	</div>
	<!-- 본문 끝 -->


	<footer class="footer">
	<div class="container">
		<p class="text-muted">Copyright &copy; SYUMIBBOM</p>
	</div>
	</footer>


	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>