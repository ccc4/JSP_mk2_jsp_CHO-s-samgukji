<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>CHO's SAMGUKJI</title>
<link rel="shortcut icon" href="images/titleicon.ico" type="x-icon">

<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="./css/samgukji.css">
</head>
<body data-spy="scroll" data-target="#main-jumbotron">

	<!-- 상단 내비게이션 시작 -->
	<nav class="navbar navbar-inverse">
	<div class="container">
	
		<!-- 삼국지bgm -->
		<div style="color: black;">
			<audio style="width:220px;height:25px" src="bgm/삼국지 공명전 OST - Track 7.mp3" preload="none" controls="controls" autoplay="" loop=""> 
				Your browser does not support the audio element. Please download and listen on an external player. 
			</audio>
		</div>

		<!-- 타이틀 및 줄였을 때 목록바 -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" 
			data-target="#navbar" aria-expanded="false" aria-controls="navbar">
				<span class="sr-only"></span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.jsp">CHO's SAMGUKJI</a>
		</div>
		<!-- 타이틀 및 줄였을 때 목록바 끝 -->

		<!-- 내비게이션 메뉴 -->
		<div id="navbar" class="collapse navbar-collapse">
			<!-- 내비게이션 좌측 메뉴 -->
			<ul class="nav navbar-nav">
				<li class="active"><a href="index.jsp">메인</a></li>
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
				<li><a href="board.do">게시판</a></li>
				<li>
					<a href="https://namu.wiki/w/삼국지" style="padding-top: 9px; padding-bottom: 9px;">
						<img src="images/namuicon.ico" alt="namuwikiicon" style="width: 32px; height: 32px;">
					</a>
				</li>
			</ul>
			<!-- 내비게이션 좌측 메뉴 끝 -->
			
			<!-- 내비게이션 우측 로그인or회원가입 -->
			<ul class="nav navbar-nav navbar-right">
				<c:choose>
					<c:when test="${!empty sessionScope.sessionNickname}">
						<li><a disable>${sessionScope.sessionNickname }님 환영합니다.</a></li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
								<sapn class="glyphicon glyphicon-user"></sapn>
							</a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="uModify_view.do">회원정보수정</a></li>
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
		<!-- 내비게이션 메뉴 끝 -->

	</div>
	</nav>
	<!-- 상단 내비게이션 끝 -->

	<!-- 본문 -->
	<div>
		<!-- jumbotron -->
		<div class="container" id="main-jumbotron">
			<div class="jumbotron" style="background-image: url('images/background2.jpg');">
				<h2 class="text-center">삼국지의 세 영웅을 소개합니다.</h2>
				<p class="text-center">여기 세 인물은 고전 명작 삼국지의 영웅들이자 저작권 문제도 없습니다.</p>
				<p class="text-center">
					<a class="btn btn-primary btn-lg" href="#introduce" role="button">사진보기&raquo;</a>
				</p>
			</div>
		</div>
		<!-- jumbotron End-->

		<!-- Carousel -->
		<div class="container" id="introduce">
			<div id="mainCarousel" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#mainCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#mainCarousel" data-slide-to="1"></li>
					<li data-target="#mainCarousel" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner">
					<div class="item active">
						<img class="first-slide" src="images/유비가로.jpg" alt="첫번째 슬라이드 유비">
					</div>
					<div class="item">
						<img class="second-slide" src="images/장비가로.jpg" alt="두번째 슬라이드 장비">
					</div>
					<div class="item">
						<img class="third-slide" src="images/관우가로.jpg" alt="세번째 슬라이드 관우">
					</div>
				</div>
				<a class="left carousel-control" href="#mainCarousel" role="button" data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a> 
				<a class="right carousel-control" href="#mainCarousel" role="button" data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
		</div>
		<!-- Carousel-End -->

		<!-- Marketing -->
		<div class="container marketing">
			<div class="row">
				<div class="col-lg-4">
					<img class="img-circle" src="images/유비사진.jpg" alt="유비사진"
						width="140" height="140">
					<h2>
						유비 <!-- <span style="font-size: 13px">161년 6월 7일 ~ 223년 4월 23일</span> -->
					</h2>
					<p>
						맨주먹과 인의만으로 일어나 최고의 자리까지 오른 난세의 영웅.
					</p>
				</div>

				<div class="col-lg-4">
					<img class="img-circle" src="images/장비사진.jpg" alt="장비사진"
						width="140" height="140">
					<h2>
						장비
					</h2>
					<p>
						후한 말과 삼국시대 촉나라의 인물. 유비 휘하의 장수. 자는 익덕(益德). 탁군 사람.
					</p>
				</div>

				<div class="col-lg-4">
					<img class="img-circle" src="images/관우사진.jpg" alt="관우사진"
						width="140" height="140">
					<h2>
						관우
					</h2>
					<p>
						후한 말의 인물. 유비 휘하의 무장. 자는 운장(雲長), 본래 자는 장생(長生). 하동군 해현 사람.
					</p>
				</div>
			</div>
		</div>
		<!-- Marketing-End -->
	</div>
	<!-- 본문 끝 -->


	<footer class="footer">
		<div class="container">
			<p class="text-muted">Copyright &copy; CHO's SAMGUKJI</p>
		</div>
	</footer>


	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>