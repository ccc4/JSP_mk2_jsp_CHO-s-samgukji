<%@page import="java.sql.Date"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

<c:choose>
	<c:when test="${requestScope.paging == 'false' }">
		<script type="text/javascript">
			alert("존재하지 않는 페이지입니다.");
			location.href="board.do";
		</script>
	</c:when>
	<c:when test="${empty requestScope.bList }">
		<script type="text/javascript">
			alert("잘못된 접근 경로입니다.");
			location.href="index.jsp";
		</script>
	</c:when>
</c:choose>

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
			<!-- 내비게이션 좌측 끝 -->
			
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
		<!-- 게시판 -->
		<div class="container">
			<table class="table table-striped" style="table-layout:fixed; word-break:break-all;">
				<thead>
					<tr>
						<th width="35px" style="background-color: #eeeeee; text-align: center;">번호</th>
						<th width="400px" style="background-color: #eeeeee; text-align: center;">제목</th>
						<th width="100px" style="background-color: #eeeeee; text-align: center;">글쓴이</th>
						<th width="35px" style="background-color: #eeeeee; text-align: center;">날짜</th>
						<th width="35px" style="background-color: #eeeeee; text-align: center;">조회</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="toDayDate" value="<%=new java.util.Date() %>"></c:set>
					<fmt:formatDate value="${toDayDate }" pattern="MM-dd" var="toDay"/>
					<c:forEach items="${bList }" var="dto">
					<tr>
						<td>${dto.bIDX }</td>
						<td class="list"><a href="bContent_view.do?bIDX=${dto.bIDX }">${dto.bTitle }</a></td>
						<td>${dto.bNickname }</td>
						<%-- <td>${dto.bDate }</td> --%>
						
						<td>
							<fmt:formatDate value="${dto.bDate }" pattern="MM-dd" var="date"/>
							<fmt:formatDate value="${dto.bDate }" pattern="HH:mm" var="time"/>
							<c:choose>
								<c:when test="${date == toDay }">
									<c:out value="${time }"></c:out>
								</c:when>
								<c:otherwise>
									<c:out value="${date }"></c:out>
								</c:otherwise>
							</c:choose>
						</td>
						
						<td>${dto.bHit }</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="paging">${requestScope.paging }</div>
			<input type="button" class="btn btn-primary pull-right" value="글작성" onclick="location.href='bCheckWrite.jsp'">
		</div>
		<!-- 게시판 끝 -->
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