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
<noscript><link rel="stylesheet" href="resources/assets/css/noscript.css" /></noscript>
<style>
	button{
		position: absolute;
	    background: #df7366;
	    color: #fff;
	    text-align: center;
	    border-radius: 0.5em;
	    text-decoration: none;
	    padding: 0.65em 3em 0.65em 3em;
	    border: 0;
	    cursor: pointer;
	    outline: 0;
	    font-weight: 300;
	    top: 600px;
	    left: 250px;
	}
</style>

</head>

<body class="left-sidebar is-preload">
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

		<div class="panel panel-default">
			<div class="panel-body">
				<div class="row">
					<div class="col-sm-4">
					<video id="myVideo" width="600" height="600" style="border: 1px solid #ddd;"></video>
					<button>수어 결과</button>
					</div>
					<div class="col-sm-3">
						<img class="img1" src="resources/slimg3/1.jpg">
						<br>
						<h3 align="center">왼쪽</h3>
						<br>
						<h4 align="center">1.오른쪽</h4>
						<h4 align="center">2.손짓</h4>	
					</div>
					<div class="col-sm-2">
						<img class="img2" src="resources/slimg2/2.jpg">
						<br>
						<h4 align="center">왼쪽</h4>
						<br>
						<h5 align="center">1.오른쪽</h5>
						<h5 align="center">2.손짓</h5>
					</div>
					<div class="col-sm-2">
						<img class="img3" src="resources/slimg2/3.jpg">
					</div>
				</div>
			</div>
			
		</div>
		
	</div>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
	<script>
        // 1. 요소들을 가져오기
        let btn = document.querySelector('button');
        let img = document.querySelector('.img1');
        // 2. 이벤트 처리하기
        btn.onclick = function(){
        	console.log(img.src);
            if(img.src == "./resources/slimg2/2.jpg"){
            	console.log(img.src);
                img.src = "./resources/slimg3/1.jpg";
            } else{
            console.log(img.src);
            img.src = './resources/slimg3/1.jpg';
            console.log(img.src);
            }
        }


    </script>
	
	
	
	
</body>
</html>