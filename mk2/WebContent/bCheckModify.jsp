<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="sessionIDX" value="${sessionScope.sessionIDX }"></c:set>
<c:choose>
	<c:when test="${!empty sessionIDX && sessionIDX == param.bUserIDX }">
		<script type="text/javascript">
			location.href="bModify_view.do?bUserIDX=${param.bUserIDX}&bIDX=${param.bIDX}";
		</script>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			alert("본인 외에는 수정할 수 없습니다.");
			history.back();
		</script>
	</c:otherwise>
</c:choose>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>CHO's SAMGUKJI</title>
<link rel="shortcut icon" href="images/titleicon.ico" type="x-icon">
</head>
<body>

</body>
</html>