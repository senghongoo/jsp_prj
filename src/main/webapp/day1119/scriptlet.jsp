<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function result(num, num2) {
	alert(num+" x "+num2+" = "+num*num2);
}// result
</script>
</head>
<body>
	<%
	// scriptlet => JSP가 Java로 변경될 때 _jspService() 안에 코드가 생성된다.
	String name = "안세홍"; // 지역변수가 되므로 초기화가 필수다.
	%>
	안녕하세요?
	<span><%=name%>님</span>
	<br>
	<%!int today = 19;%>
	<!-- 필드에 생성되므로 인스턴스 변수가 된다. -->
	<ul>
		<%
		for (int i = 0; i < 10; i++) {
		%>
		<li><%=i%></li>
		<%
		} // end for
		%>
	</ul>
	<table>
		<tr>
			<%
			for (int i = 1; i < 10; i++) {
			%>
			<td style="border: 1px solid #333" onclick="result(2, <%=i%>)">2x<%=i%>=<%=2 * i%></td>
			<%
			} // end for
			%>
		</tr>
	</table>
	<div>
		<%
		for (int i = 1; i < 7; i++) {
		%>
		<h<%=i%>>안녕하세요</h<%=i%>>
		<%
		} // end for
		%>
	</div>
	<div>
		<table>
			<%
			for (int j = 2; j < 10; j++) {
			%>
			<tr>
				<%
				for (int i = 1; i < 10; i++) {
					int result = i * j;
				%>
				<td style="border: 1px solid #333" onclick="result(<%=j%>, <%=i%>)"><%=j%>x<%=i%>=<%=result%></td>
				<%
				} // end for
				%>
			</tr>
			<%
			} // end for
			%>
		</table>
	</div>
</body>
</html>