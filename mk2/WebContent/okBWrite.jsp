<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String okBWrite = (String)request.getAttribute("okBWrite");

	if (okBWrite == "1") {
%>
		<script type="text/javascript">
			alert("게시글 작성이 성공적으로 완료되었습니다.");
			location.href = "board.do";
		</script>
<%
	} else if (okBWrite == "0") {
%>
		<script type="text/javascript">
			alert("게시글 작성에 실패했습니다. 다시 시도해주세요.");
			location.href = "board.do";
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