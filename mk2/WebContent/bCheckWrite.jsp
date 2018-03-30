<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
	<c:when test="${!empty sessionScope.sessionIDX }">
		<script type="text/javascript">
			location.href = "bWrite.jsp";
		</script>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			alert("로그인 후 이용가능합니다.");
			history.back();
		</script>
	</c:otherwise>
</c:choose>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>슈미뽐</title>
</head>
<body>

</body>
</html>