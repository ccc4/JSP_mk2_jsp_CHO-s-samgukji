<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:remove var="id" scope="session"/>
<c:remove var="userIDX" scope="session"/>
<c:remove var="getUser" scope="session"/>
<c:redirect url="index.jsp"></c:redirect>

<%-- <%
	/* session.invalidate(); */
	session.removeAttribute("id");
	session.removeAttribute("getUser");
	response.sendRedirect("index.jsp");
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