<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="true"%>
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
		$("#btnQs").click(function() {
			paramQueryString();
		});// click
		$("#btnJson").click(function() {
			paramJSON();
		});// click
	});// ready

	function paramQueryString() {
		// queryString 형식으로 web parameter 전송
		// HTML Form Control의 name 속성 이름과 상관없이 parameter명을 만들 수 있다.
		var param = "na=" + $("#name").val() + "&age=" + $("#age").val();

		$.ajax({
			url : "paramProcess.jsp",
			type : "post",
			data : param, // 여기까지 요청
			
			dataType : "JSON", // 여기부터 응답
			error : function ( xhr ) {
				$("#output").html(xhr.status + " / " + xhr.statusText);
			},
			success : function ( jsonObj ) {
				// 객체명.이름
				// alert( jsonObj.name+" / "+jsonObj.age );
				var output ="<table class='table table-hover'>";
				output +=`<tr><td>${jsonObj.name}님 안녕하세요?</td></tr>`;
				output +=`<tr><td>${jsonObj.age}살</td></tr>`;
				output +=`<tr><td>${jsonObj.birth}년대생</td></tr>`;
				output +=`</table>`;
				
				$("#output").html(output);
			}
		});// ajax
	}// paramQueryString

	function paramJSON() {
		if($("#name").val()==""){
			alert("이름은 필수 입력입니다.");
			return;
		}// end if
		
		// JSON Object 형식으로 web parameter 전송
		var param={na:$("#name").val(), age:$("#age").val()}
		
		$.ajax({
			url : "paramProcess.jsp",
			type : "get",
			data : param,
			dataType : "JSON",
			error : function ( xhr ) {
				console.log(xhr.status + " / " + xhr.statusText);
			},
			success : function ( jsonObj ) {
				// parsing
				var name=jsonObj.name;
				var age=jsonObj.age;
				var birth=jsonObj.birth;
				
				createTr=`<tr><td>${ name }</td><td>${ age }</td><td>${ birth }</td>`
				$("#tab tbody").last().append(createTr);
				$("#name").val("");
				$("#age").val("");
				$("#name").focus();
			}
		});// ajax
	}// paramJSON
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
					<strong>AJAX Parameter 요청</strong><br> <label>이름</label> <input
						type="text" name="name" id="name" autofocus="autofocus"><br>
					<label>나이</label> <input type="text" name="age" id="age"><br>
					<button id="btnQs" class="btn btn-success">Query String 방식</button>
					<button id="btnJson" class="btn btn-info">JSON Object 방식</button>
				</div>
				<div id="output"></div>
				<div id="output2">
				<table id="tab" class="table table-hover">
				<thead>
				<tr>
				<th>이름</th>
				<th>나이</th>
				<th>태어난 해</th>
				</tr>
				</thead>
				<tbody>
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