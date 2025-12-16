<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8"); // 한글을 parameter로 전달할 때는 encoding
// 업무 처리한 결과 > List ( web parameter로 전달될 수 없다. )
List<String> names = new ArrayList<String>();
names.add("루피");
names.add("쵸파");
names.add("상디");
names.add("조로");

//scope 객체에 데이터를 할당 > scope 객체 사용해서 값 받기
request.setAttribute("names", names);

String name = "안세홍"; // scope 객체에 넘겨도 되지만 parameter로 넘기고 싶을 때
int age = 25;
%>
<!-- parameter가 없는 경우 -->
<%-- <jsp:forward page="forward_action_b.jsp"></jsp:forward> --%>

<!-- parameter가 있는 경우 -->
<jsp:forward page="forward_action_b.jsp">
	<jsp:param value="<%=name%>" name="name" />
	<jsp:param value="<%=age%>" name="age" />
</jsp:forward>