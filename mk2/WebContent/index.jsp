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
<link rel="stylesheet" href="./css/index.css">
</head>
<body data-spy="scroll" data-target="#main-jumbotron">

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
				<li class="active"><a href="index.jsp">메인</a></li>
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
				<c:choose>
					<c:when test="${sessionScope.getUser != null}">
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
					</c:when>
					<c:otherwise>
						<li><a disable>로그인하기&nbsp;<span class="glyphicon glyphicon-hand-right"></span></a></li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
								<sapn class="glyphicon glyphicon-user"></sapn>
							</a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="uLogin.jsp">로그인</a></li>
								<li class="divider"></li>
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
			<div class="jumbotron"
				style="background-image: url('images/jumbotron-back.jpg');">
				<h1 class="text-center">슈미뽐을 소개합니다.</h1>
				<p class="text-center">여기 세 요정들은 고양이나라에서 인간들의 심장을 헤롭게 하기위해 파견되어
					왔습니다.</p>
				<p class="text-center">
					<a class="btn btn-primary btn-lg" href="#introduce" role="button">슈미뽐이란?&raquo;</a>
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
						<img class="first-slide" src="images/a.jpg" alt="첫번째 슬라이드 슈야">
					</div>
					<div class="item">
						<img class="second-slide" src="images/b.jpg" alt="두번째 슬라이드 미야">
					</div>
					<div class="item">
						<img class="third-slide" src="images/c.jpg" alt="세번째 슬라이드 봄이">
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
					<img class="img-circle" src="images/슈야얼굴.jpg" alt="슈야얼굴"
						width="140" height="140">
					<h2>
						슈야 <span style="font-size: 13px">2월1일생</span>
					</h2>
					<p>
						노랗게 잘 익은 털 색깔을 가진 스코티쉬폴드 <br>송곳니가 무척 길어서 가끔 바보같은 표정이 되기도<br>
						하지만 그게 매력. 창밖 구경을 제일 좋아한다.
					</p>
				</div>

				<div class="col-lg-4">
					<img class="img-circle" src="images/미야얼굴.jpg" alt="미야얼굴"
						width="140" height="140">
					<h2>
						미야 <span style="font-size: 13px">8월15일생</span>
					</h2>
					<p>
						귀족같은 털을 가진 페르시안이지만 다리가 통통하니 <br>짧은걸로 봐선 먼치킨의 피도 섞여있는것 같다. 집에서
						<br> 제일 이쁨을 받아 가끔 슈야 봄이가 질투를 하는게 <br>느껴진다.
					</p>
				</div>

				<div class="col-lg-4">
					<img class="img-circle" src="images/봄이얼굴.jpg" alt="봄이얼굴"
						width="140" height="140">
					<h2>
						봄이 <span style="font-size: 13px">11월1일생</span>
					</h2>
					<p>
						제일 막내 까만 브리티쉬 숏헤어... <br>이지만 커갈수록 아닌거같다. 어릴땐 눈이 되게 <br>
						앙칼졌지만 커가면서 동글동글해지며 갈수록 <br>귀여워진다. 공주님답게 옷장을 좋아한다.
					</p>
				</div>
			</div>
		</div>
		<!-- Marketing-End -->
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