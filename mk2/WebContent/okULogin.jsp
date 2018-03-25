<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String okULogin = (String) request.getAttribute("okULogin");

	if (okULogin == "1") {
%>
<script type="text/javascript">
	alert("로그인에 성공했습니다.");
	history.go(-2);
	location.reload(); 
</script>
<%
	} else if (okULogin == "0") {
%>
<script type="text/javascript">
	alert("아이디 또는 비밀번호가 다릅니다.");
	history.back();
	location.reload(); 
</script>
<%
	} else if (okULogin == "-1") {
%>
<script type="text/javascript">
	alert("아이디가 존재하지 않습니다.");
	history.back();
	location.reload(); 
</script>
<%
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>슈미뽐</title>
</head>
<body>

</body>
</html>