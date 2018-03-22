<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String okUJoin = (String)request.getAttribute("okUJoin");

	if (okUJoin == "1") {
%>
<script type="text/javascript">
	alert("회원가입이 성공적으로 완료되었습니다.");
	location.href = "login.jsp";
</script>
<%
	} else if (okUJoin == "0") {
%>
<script type="text/javascript">
	alert("회원가입에 실패했습니다. 다시 시도해주세요.");
	location.href = "login.jsp";
</script>
<%
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" charset=utf-8">
<title>슈미뽐</title>
</head>
<body>

</body>
</html>