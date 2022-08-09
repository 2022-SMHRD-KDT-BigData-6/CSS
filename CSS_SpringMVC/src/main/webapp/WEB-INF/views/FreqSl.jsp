<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%-- jstl, el 문법 --%>
<!-- 프로젝트의 contextpath 값을 동적으로 가져오는 방법 -->
<!--  ${pageContext.request.contextPath}  -->
<c:set var="cpath" value="${pageContext.request.contextPath}" />

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
	
<!-- 차트 링크 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.8.0/dist/chart.min.js"></script>
	
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
						<h4>
							날짜 : <input class="datepicker">
						</h4>
					</div>
				</div>
				<div class="panel-body">
					<table class="table table-condensed">
						<tr class="heading" align="center">
							<th align="center">순위</th>
							<th align="center">단어</th>
							<th align="center">빈도수</th>
						</tr>
					</table>
				</div>
			</div>

			<div class="col-sm-7">
				<div class="container" id="myChart"></div>
			</div>
		</div>
	</div>


	<script type="text/javascript">
		$(document).ready(function() {
			loadList();
		})

		function loadList() {
			$.ajax({
				// 서버 url
				url : '${cpath}/freqListAjax.do',
				type : 'get',
				dataType : 'json',
				success : listView,
				error : function() {
					alert('실패!');
				}
			})
		}

		function listView(data) {

			var blist = "";
			var blist2 = "";
			var wordList = [];
			var freqList = [];			

			console.log(data);
			for(let i = 0 ; i < data.length ; i++) {
				wordList.push(data[i].sl_word);
				freqList.push(data[i].freqidx);
			}			
			
			console.log(wordList);
			console.log(freqList);
 			const seldate = data[0].sdate;
			const displaydate = seldate.split(" ");
			
			blist2 = "<div class='searchhead'><h3>" + displaydate[0] + "일 인식 단어 리스트</h3></div>";				
			
			$.each(data, function(index, flist) {
				blist += "<tr class ='innerContent'>"
				blist += "<td align='center'>" + flist.frank + "</td>"
				blist += "<td align='center'>" + flist.sl_word + "</td>"
				blist += "<td align='center'>" + flist.freqidx + "</td>"
				blist += "</tr>"
			})

			blist += '</table></div>';

			$('.searchhead').remove();
			$('.table-condensed').before(blist2);
			$('.innerContent').remove();
			$('.heading').after(blist);	
			$('#myChart').html("<canvas id='chartCtx'></canvas>")
			
			var ctx = $('#myChart > canvas')
			var myChart = new Chart(ctx, {
				type : 'bar',
				data : {
					labels : wordList,
					datasets : [{
						label : '인식 단어 빈도수',
						data : freqList,
						backgroundColor : 'rgba(255, 99, 132, 1)',
						borderColor : 'rgba(255, 99, 132, 1)',
						borderWidth : 0
					}]
				},
		    	options: {
		        	scales: {			       
			            x : {
			            	grid:{
			                	drawOnChartArea:false
			                }
		    	        }
		        	}
	        	}
			});
		}
		

		// 날짜 검색
		$.datepicker.setDefaults({
			dateFormat : 'yy-mm-dd',
			prevText : '이전 달',
			nextText : '다음 달',
			monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
					'9월', '10월', '11월', '12월' ],
			monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
					'9월', '10월', '11월', '12월' ],
			dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
			dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
			dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
			showMonthAfterYear : true,
			yearSuffix : '년'
		});

		$('.datepicker').datepicker({
			dateFormat : 'yy-mm-dd',
			onSelect : function(sdate) {
				searchList(sdate);				
			}
		});
		
		function searchList(sdate){
			$.ajax({
				url : '${cpath}/seldateFreqAjax.do',
				data : {'sdate' : sdate},
				type : 'get',
				success : listView,
				error : function(){
					alert('실패!');
				}
			});
		}

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

</body>
</html>