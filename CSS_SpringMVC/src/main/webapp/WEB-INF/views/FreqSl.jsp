<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%-- jstl, el 문법 --%>      
<!-- 프로젝트의 contextpath 값을 동적으로 가져오는 방법 -->
<!--  ${pageContext.request.contextPath}  -->
<c:set var="cpath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>

<!-- bootstrap 사용하기 위해 필요한 라이브러리 3개! -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="resources/assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="resources/assets/css/noscript.css" />
</noscript>
<!--  
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
-->
<!-- 차트 링크 
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
-->

<!-- 날짜 검색 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"
	integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css"
	integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="./jquery-ui.css">
</head>

<body class="no-sidebar is-preload">
	<div id="page-wrapper">

		<!-- Header -->
		<div id="header">

			<!-- Nav -->
			<nav id="nav">
				<ul>
					<li><a href="Home">홈</a></li>
					<li><a href="RecogSl">수어인식 화면</a></li>
					<li><a href="FreqSl">수어통계 페이지</a></li>
				</ul>
			</nav>
		</div>

		<div class="row">
			<div class="col-sm-5">
				<p>
				<div class="panel panel-default">
  					<div class="panel-heading">
  						<h4> 날짜 검색 : <input class="datepicker"></h4>
					</div>
				</div>
  					<div class="panel-body">
						<div class="container">
							<h2>Condensed Table</h2>
							<table class="table table-condensed">
								<thead>
									<tr>
										<th>순위</th>
										<th>단어</th>
										<th>빈도수</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>John</td>
										<td>Doe</td>
										<td>john@example.com</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>


			<div class="col-sm-7">
				<!--  <div class="container">
					<canvas id="myChart"></canvas> 
				</div> -->

			</div>
		</div>
	</div>


	<script type="text/javascript">
	
		$(document).ready(function(){
			loadList();  
		})		

		function loadList() {
			$.ajax({
				// 서버 url
				url : '${cpath}/boardListAjax.do',
				type : 'get',
				dataType : 'json',
				success : listView,
				error : function() {
					alert('실패!');
				}
			})
		}

		// 날짜 검색
		$.datepicker.setDefaults({
			dateFormat : 'yy-mm-dd',
			prevText : '이전 달',
			nextText : '다음 달',
			monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
			monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
			dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
			dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
			dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
			showMonthAfterYear : true,
			yearSuffix : '년'
		});

		$(function() {
			$('.datepicker').datepicker();
		})		
	</script>


	<!-- Scripts -->
	<script src="resources/assets/js/jquery.min.js"></script>
	<script src="resources/assets/js/jquery.dropotron.min.js"></script>
	<script src="resources/assets/js/jquery.scrolly.min.js"></script>
	<script src="resources/assets/js/jquery.scrollex.min.js"></script>
	<script src="resources/assets/js/browser.min.js"></script>
	<script src="resources/assets/js/breakpoints.min.js"></script>
	<script src="resources/assets/js/util.js"></script>
	<script src="resources/assets/js/main.js"></script>
	<script src="resources/assets/jquery-ui/jquery-ui.min.js"></script>

	<!-- 부트스트랩 
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>   -->
	<!-- 차트 

	<script>
		var ctx = document.getElementById('myChart');
		var myChart = new Chart(ctx, {
			type : 'bar',
			data : {

				labels : [ 'Red', 'Blue', 'Yellow', 'Green', 'Purple',
						'Orange', '1', '2', '3', '4' ],
				datasets : [ {
					label : '단어별 빈도수',
					data : [ 12, 19, 3, 5, 2, 3, 7, 9, 10, 4 ],
					backgroundColor : [ 'rgba(255, 99, 132, 1)',
							'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)',
							'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)',
							'rgba(255, 159, 64, 1)', 'rgba(75, 192, 192, 1)',
							'rgba(153, 102, 255, 1)', 'rgba(75, 192, 192, 1)',
							'rgba(153, 102, 255, 1)' ],
					borderColor : [ 'rgba(255, 99, 132, 1)',
							'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)',
							'rgba(75, 192, 192, 1)', 'rgba(255, 206, 86, 1)',
							'rgba(75, 192, 192, 1)', 'rgba(255, 206, 86, 1)',
							'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)',
							'rgba(255, 159, 64, 1)' ],
					borderWidth : 0
				} ]
			},
			options : {
				scales : {
					yAxes : [ {
						ticks : {
							beginAtZero : true
						}
					} ]
				}
			}
		});
	</script>
    -->
    

    <!--      
	<script type="text/javascript">
		$(function() {
			$('#datetimepicker1').datetimepicker({
				format : 'yyyy-mm-dd'
			});
			$('#datetimepicker2').datetimepicker({
				format : 'yyyy-mm-dd',
				useCurrent : false
			});
			$("#datetimepicker1").on("change.datetimepicker", function(e) {
				$('#datetimepicker2').datetimepicker('minDate', e.date);
			});
			$("#datetimepicker2").on("change.datetimepicker", function(e) {
				$('#datetimepicker1').datetimepicker('maxDate', e.date);
			});
		});
	</script>
	-->
</body>
</html>