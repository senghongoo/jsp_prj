<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String str = request.getMethod();
	String color = "";

	if (str.equals("GET")) {
		color = "red";
	} else {
		color = "blue";
	} // end else
	%>
	<strong><span style="color: <%=color%>;"><%=request.getMethod()%></span></strong>
	방식의 요청.
	<br>
	<a href="javascript:history.back();">뒤로</a>
</body>
</html>