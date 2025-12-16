<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
				<!-- EL은 변수를 직접 출력할 수 없으므로 scope 객체에 값을 할당해야 출력할 수 있다. -->
				<%
				// 1.변수 선언
				String msg="점심 맛있게 드세요.";
				int day=28;
				
				// 2.scope 객체에 값 할당
				pageContext.setAttribute("todayMsg", msg);
				request.setAttribute("today", day);
				%>
				
				EL 변수 출력( EL에서는 변수에 직접 접근 불가 )<br>
				메시지 : ${ msg }<br>
				날짜 : ${ day }
				
				<div>
				<!-- 3.EL에서 scope 객체명으로 변수를 사용 -->
				메시지 : ${ pageScope.todayMsg }<br>				
				날짜 : ${ requestScope.today }<br>				
				</div>
				<div>
				<%
				// scope 객체에 값 할당
				pageContext.setAttribute("pageName", "탄지로");
				request.setAttribute("reqName", "탄지로2");
				session.setAttribute("sesName", "탄지로3");
				application.setAttribute("appName", "탄지로4");
				// 이름이 같은 경우
				pageContext.setAttribute("sName", "탄지로");
				request.setAttribute("sName", "탄지로2");
				session.setAttribute("sName", "탄지로3");
				application.setAttribute("sName", "탄지로4");
				%>
				<hr>
				EL에서 사용<br>
				pageScope : ${ pageScope.pageName }(${ pageName })<br>
				requestScope : ${ requestScope.reqName }(${ reqName })<br>
				sessionScope : ${ sessionScope.sesName }(${ sesName })<br>
				applicationScope : ${ applicationScope.appName }(${ appName })<br>
				</div>
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