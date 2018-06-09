<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="okBDelete" value="${requestScope.okBDelete }"></c:set>
<c:choose>
	<c:when test="${okBDelete == '1' }">
		<script type="text/javascript">
			alert("게시글 삭제가 성공적으로 완료되었습니다.");
			location.href = "board.do";
		</script>
	</c:when>
	<c:when test="${okBDelete == '0' }">
		<script type="text/javascript">
			alert("게시글 삭제에 실패했습니다. 다시 시도해주세요.");
			location.href = "bContent_view.do?bIDX=${requestScope.bIDX}";
		</script>
	</c:when>
	<c:when test="${okBDelete == '-1' }">
		<script type="text/javascript">
			alert("잘못된 접근 경로입니다.");
			location.href = "board.do";
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
</html>