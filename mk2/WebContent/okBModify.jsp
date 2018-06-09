<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="okBModify" value="${requestScope.okBModify }"></c:set>
<c:choose>
	<c:when test="${okBModify == '1' }">
		<script type="text/javascript">
			alert("게시글 수정이 성공적으로 완료되었습니다.");
			location.href = "bContent_view.do?bIDX=${requestScope.bIDX}";
		</script>
	</c:when>
	<c:when test="${okBModify == '0' }">
		<script type="text/javascript">
			alert("게시글 수정에 실패했습니다. 다시 시도해주세요.");
			location.href = "bContent_view.do?bIDX=${requestScope.bIDX}";
		</script>
	</c:when>
</c:choose>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" charset=utf-8">
<title>CHO's SAMGUKJI</title>
<link rel="shortcut icon" href="images/titleicon.ico" type="x-icon">
</head>
<body>

</body>