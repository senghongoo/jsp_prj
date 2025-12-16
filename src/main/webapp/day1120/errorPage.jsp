<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="isErrorPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	if (new Random().nextBoolean()) {
		throw new Exception("문제 발생!!!");
	} // end if
	%>
	<div>정상 동작</div>
</body>
</html>