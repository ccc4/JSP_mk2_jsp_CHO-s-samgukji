<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="id" value="${sessionScope.id }"></c:set>
<c:choose>
	<c:when test="${!empty id && id == param.bID }">
		<script type="text/javascript">
			if(confirm("정말 삭제하시겠습니까?")) {
				location.href="bDelete.do?bID=${id}&bIDX=${param.bIDX}";
			} else {
				history.back();
			}
		</script>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			alert("본인 외에는 수정할 수 없습니다.");
			history.back();
		</script>
	</c:otherwise>
</c:choose>

<%-- <%
	String id = (String)session.getAttribute("id");
	String id_Check = (String)request.getParameter("bID");
	String idx = request.getParameter("bIDX");
	
	if(id != null && id.equals(id_Check)) {
%>
		<script type="text/javascript">
		if(confirm("정말 삭제하시겠습니까?")) {
			location.href="bDelete.do?bID=<%=id %>&bIDX=<%=idx %>";
		} else {
			history.back();
		}
		</script>
<%
	} else {
%>
		<script type="text/javascript">
			alert("본인 외에는 수정할 수 없습니다.");
			history.back();
		</script>
<%
	}

%> --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>슈미뽐</title>
</head>
<body>

</body>
</html>