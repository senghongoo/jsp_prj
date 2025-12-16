<%@page import="day1127.DataDTO"%>
<%@page import="java.util.List"%>
<%@page import="day1201.CollectionService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<title>JSP 템플릿</title>
<script src="http://192.168.10.88/jsp_prj/common/js/color-modes.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
	crossorigin="anonymous"></script>
<meta name="theme-color" content="#712cf9">
<link href="http://192.168.10.88/jsp_prj/common/css/carousel.css"
	rel="stylesheet">
<jsp:include page="../fragments/bootstrap_css.jsp"></jsp:include>
<style type="text/css">
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {

	});// ready
</script>
</head>
<body>
	<header data-bs-theme="dark">
		<jsp:include page="../fragments/header.jsp" />
	</header>
	<main>

		<!-- Marketing messaging and featurettes
  ================================================== -->
		<!-- Wrap the rest of the page in another container to center all the content. -->
		<div class="container marketing">
			<!-- START THE FEATURETTES -->
			<hr class="featurette-divider">
			<div class="row featurette">
				<div class="col-md-7">
					<c:forEach var="i" begin="1" end="10" step="1">
						<c:out value="${ i }"></c:out>
					</c:forEach>
					<select>
						<c:forEach var="i" begin="1" end="100" step="2">
							<option value="${ i }"><c:out value="${ i }"></c:out>
						</c:forEach>
					</select>
				</div>
				<%
				// 업무를 처리할 수 있는 클래스를 설정
				CollectionService cs = new CollectionService();

				// 1.값을 받아와서
				String[] arrData = cs.arr();
				List listData = cs.list();

				// 2.scope 객체 할당 => EL에서 사용하기 위해
				pageContext.setAttribute("arr", arrData);
				pageContext.setAttribute("list", listData);
				%>
				<div>
					<strong>배열</strong>
					<table class="table table-hover">
						<thead>
							<tr>
								<th>번호</th>
								<th>이름</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="arr" items="${ arr }" varStatus="i">
								<c:if test="${ i.first }">
									<tr>
										<td colspan="2">데이터를 출력하기 전에 사용자에게 제공할 내용.</td>
									</tr>
								</c:if>
								<tr>
									<td><c:out value="${ i.index }"></c:out> <c:out
											value="${ i.count }"></c:out></td>
									<td><c:out value="${ arr }"></c:out></td>
								</tr>
								<c:if test="${ i.last }">
									<tr>
										<td colspan="2">데이터가 출력된 후에 사용자에게 제공할 내용.</td>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div>
					<strong>java.util.List</strong>
					<c:forEach var="site" items="${ list }" varStatus="i">
						<c:out value="${ i.count }"></c:out>
						<input type="radio" name="site" value="${ site }">
						<c:out value="${ site }"></c:out>
					</c:forEach>
				</div>
				<%
				// 1.데이터 얻기
				List<DataDTO> dtoList = cs.searchMember();
				// 2.scope 객체에 데이터 추가 => EL은 변수에 직접 접근 X
				pageContext.setAttribute("membersData", dtoList);
				%>
				<div>
					<strong>DTO가 방의 값인 java.util.List</strong>
					<!-- 3.JSTL에서 EL을 사용하여 값을 사용자에게 제공 -->
					<table>
						<thead>
							<tr>
								<th>번호</th>
								<th>이름</th>
								<th>나이</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="member" items="${ membersData }" varStatus="i">
								<c:set var="totalAge" value="${ member.myAge + totalAge }"></c:set>
								<%-- <c:out value="${ member }"></c:out> : 주소가 출력 ( toString() 있으면 그 안의 내용 출력 ) --%>
								<tr>
									<td><c:out value="${ i.count }"></c:out></td>
									<td><input type="text" name="name"
										value="${ member.name }"></td>
									<td><input type="text" name="age"
										value="${ member.myAge }"></td>
								</tr>
								<c:if test="${ i.last }">
									<tr>
										<td colspan="2">총 나이</td>
										<td><c:out value="${ totalAge }"></c:out></td>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<hr class="featurette-divider">
			<!-- /END THE FEATURETTES -->
		</div>
		<!-- /.container -->
		<!-- FOOTER -->
		<footer class="container">
			<jsp:include page="../fragments/footer.jsp"></jsp:include>
		</footer>
	</main>
</body>
</html>