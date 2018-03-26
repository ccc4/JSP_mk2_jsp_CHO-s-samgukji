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
<link rel="stylesheet" href="">
</head>
<body>

<c:choose>
	<c:when test="${sessionScope.id != null && sessionScope.id == param.bID }">
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
					<li class="active"><a href="board.do">게시판</a></li>
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
			<!-- 게시글 수정 -->
			<div class="container">
				<table width="900" cellpadding="0" cellspacing="0" border="1">
					<form action="bModify.do" method="post" name="write_frm">
						<input type="hidden" name="bIDX" value="${bModify_view.bIDX }">
						<input type="hidden" name="bID" value="${sessionScope.id }">
						<tr>
							<td colspan="3"><input type="text" name="bTitle"
								value="${bModify_view.bTitle }" size="60" maxlength="30">
							</td>
						</tr>
						<tr>
							<td>글쓴이 : ${bModify_view.bNickname } &nbsp; 등록일 :
								${bModify_view.bDate } &nbsp; 조회수 : ${bModify_view.bHit }</td>
						</tr>
						<tr>
							<td colspan="3" height="300" valign="top"><textarea
									rows="10" cols="60" name="bContent" maxlength="1000">${bModify_view.bContent }</textarea>
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<input type="button" value="수정" onclick="modifyConfirm()"> &nbsp; 
								<input type="button" value="목록" onclick="location.href='board.do'">
							</td>
						</tr>
					</form>
				</table>
			</div>
			<!-- 게시글 수정 끝 -->
		</div>
		<!-- 본문 끝 -->


		<footer class="footer">
		<div class="container">
			<p class="text-muted">Copyright &copy; SYUMIBBOM</p>
		</div>
		</footer>
		
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			alert("잘못된 접근 경로입니다sss.");
			location.href="index.jsp";
		</script>
	</c:otherwise>
</c:choose>


<%-- <%
	String id = (String)session.getAttribute("id");
	String id_Check = (String)request.getParameter("bID");
	
	if(id != null && id.equals(id_Check)) {
%>
	<!-- 상단 내비게이션 시작 -->
	<nav class="navbar navbar-default">
	<div class="container">

		<!-- 타이틀 및 줄였을 때 목록바 -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
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
				<li class="active"><a href="board.do">게시판</a></li>
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
					<sapn class="glyphicon glyphicon-user"></sapn></a>
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
		<!-- 게시글 수정 -->
		<div class="container">
			<table width="900" cellpadding="0" cellspacing="0" border="1">
				<form action="bModify.do" method="post" name="write_frm">
					<input type="hidden" name="bIDX" value="${bModify_view.bIDX }">
					<input type="hidden" name="bID" value="<%=id %>">
					<tr>
						<td colspan="3">
							<input type="text" name="bTitle" value="${bModify_view.bTitle }" size="60" maxlength="30">
						</td>
					</tr>
					<tr>
						<td>
							글쓴이 : ${bModify_view.bNickname } &nbsp; 
							등록일 : ${bModify_view.bDate } &nbsp; 
							조회수 : ${bModify_view.bHit }
						</td>
					</tr>
					<tr>
						<td colspan="3" height="300" valign="top">
							<textarea rows="10" cols="60" name="bContent" maxlength="1000">${bModify_view.bContent }</textarea>
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<input type="button" value="수정" onclick="modifyConfirm()"> &nbsp;
							<input type="button" value="목록" onclick="location.href='board.do'">
							</td>
					</tr>
				</form>
			</table>
		</div>
		<!-- 게시글 수정 끝 -->
	</div>
	<!-- 본문 끝 -->



	<footer class="footer">
	<div class="container">
		<p class="text-muted">Copyright &copy; SYUMIBBOM</p>
	</div>
	</footer>
<%
	} else {
%>
		<script type="text/javascript">
			alert("잘못된 접근 경로입니다.");
			location.href="index.jsp";
		</script>
<%
	}

%> --%>


	<script src="js/board.js" type="text/javascript" charset="utf-8"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>