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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="resources/assets/css/main.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@500&display=swap" rel="stylesheet">
<noscript><link rel="stylesheet" href="resources/assets/css/noscript.css" /></noscript>
<style>
	#header{
	
	
	font-family: 'IBM Plex Sans KR', sans-serif;
	
	}
	video{
		    height: 850px;
  		 	position: absolute;
    		top: -350px;
    		left: -760px;
	}
	a.button.circled.scrolly{
		
		position: absolute;
		top: 340px;
		left: -65px;
		font-family: 'IBM Plex Sans KR', sans-serif;
	}
</style>
</head>
	<body class="homepage is-preload">
		<div id="page-wrapper">

			<!-- Header -->
				<div id="header">

					<!-- Inner -->
						<div class="inner">		
							<video src="resources/images/homescreen4.mp4" loop muted autoplay>이 브라우저는 재생할 수 없습니다.</video>
							<footer>
								<a href="RecogSl" class="button circled scrolly">시작</a>
							</footer>
						</div>

						<!-- Nav -->
						<nav id="nav">							
							<ul>
								<li><a href="Home">홈</a></li>
								<li><a href="RecogSl">수어인식 화면</a></li>
								<li><a href="FreqSl">수어통계 페이지</a></li>
							</ul>
						</nav>
				</div>
			</div>
				
				

</body>
</html>