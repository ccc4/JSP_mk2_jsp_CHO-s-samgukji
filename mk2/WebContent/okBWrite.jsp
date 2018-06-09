<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="okBWrite" value="${requestScope.okBWrite }"></c:set>
<c:choose>
	<c:when test="${okBWrite == '1' }">
		<script type="text/javascript">
			alert("게시글 작성이 성공적으로 완료되었습니다.");
			location.href = "board.do";
		</script>
	</c:when>
	<c:when test="${okBWrite == '0' }">
		<script type="text/javascript">
			alert("게시글 작성에 실패했습니다. 다시 시도해주세요.");
			location.href = "board.do";
		</script>
	</c:when>
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