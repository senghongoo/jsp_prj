<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 세션의 값을 삭제 ( 세션은 살아 있음 )
session.removeAttribute("name");

// 세션을 무효화
session.invalidate();
// System.out.println(session.getAttribute("name"));

// 이 페이지에 있을 필요가 없으므로 이동
response.sendRedirect("use_session_a.jsp");
%>