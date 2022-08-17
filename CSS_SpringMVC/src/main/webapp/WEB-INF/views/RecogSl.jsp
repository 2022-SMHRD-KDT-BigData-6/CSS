<%@page import="kr.smhrd.model.FreqVO"%>
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
	.button1{
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
	    left: 230px;
	}
	.img2{
		height:200px;
		weight:170px;
	}
	.img3{
		height:200px;
		weight:170px;
	}
	
	
		/*div{
			height:100px;
		}
		.panel.panel-default{
			height:700px;
		}
		#image{
			width:25%;	
		}
		#image1{
			margin-left:5%;
			width:20%;
		}
		#image2{
			margin-left:5%;
			width:15%;
		}
		#image3{
			margin-left:5%;
			width:25%;
		}*/
	
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
					<div class="col-sm-4" id="image">
					<video id="myVideo" width="600" height="600" style="border: 1px solid #ddd;">
						<source src="resources/images/homescreen4.mp4">
					</video>
					<button type="button" class="button1" onclick="usesl();">결과 보기</button>
					</div>
					
					<div class="col-sm-3" id="image1">
						<br><br>
						<img class="img1" src="resources/slimg3/1.jpg">
						<br><br>
						<h3>　　　　　　아메리카노</h3>
						<br>
						<h4>　　　　　　　　1.음료</h4>
						<h4>　　　　　　　　2.차가운</h4>	
					</div>
					<div class="col-sm-2" id="image2">
						<br><br>
						<img class="img2" src="resources/slimg3/2.jpg">
						<br><br>
						<h4>　　　　냉방</h4>
						<br>
						<h5>　　　　1.차가운</h5>
						<h5>　　　　2.음료</h5>
					</div>
					<div class="col-sm-2" id="image3">
						<br><br>
						<img class="img3" src="resources/slimg3/3.jpg">
						<br><br>
						<h4>　　　　번호</h4>
						<br>
						<h5>　　　　1.숫자</h5>
						<h5>　　　　2.전화번호</h5>
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
	
		
        function usesl(){
        	insertsl();
        	selectsl();
        	selectsl1();
        	selectsl2();
        }
        
        function insertsl(){
            $.ajax({
    			// 서버 url
    			url : '${cpath}/insertslAjax.do',
    			// data : 보내줄 데이터를 객체형식으로 넘겨줬었음!{'idx':idx}
    			// 요청 방식
    			data : {'sl_index':13},
    			type : 'get',
    			datatype : 'json',
    			// 받아올 데이터 타입 지정
    			// 성공했을 때 실행할 함수
    			success: function(){
    				alert('성공!');
    			},
    			// 실패했을 때 실행할 함수
    			error: function(){
    				alert('실패!');
    			}
    		})	
            
        }

    	
    	function listView(data){
    		console.log(data);	     		
    		var blist = ""; 
    			blist += "<br><br><img class='img' src='resources/slimg3/"+data.sl_index+".jpg'>"
    			blist += "<br><br><h3>　　　　　　"+data.sl_word+"</h3>" 
    		$('#image1').html(blist);    	
    	 }
	
    function selectsl(){
	    	$.ajax({
	    		url:'${cpath}/selectslAjax.do',
	    		type : 'get',
	    		data:{'sl_index':13},
	    		dataType : 'json',
	    		success : listView,
	    		error: function(){
	    			alert("실패!");
	    		}
	    	})	
    	}
    
    
	function listView1(data){
		console.log(data);	     		
		var blist = ""; 
			blist += "<br><br><img class='img' src='resources/slimg2/"+data.sl_index+".jpg'>"
			blist += "<br><br><h4>　　　　"+data.sl_word+"</h4>" 
		$('#image2').html(blist);    	
	 }

	function selectsl1(){
    	$.ajax({
    		url:'${cpath}/selectslAjax.do',
    		type : 'get',
    		data:{'sl_index':14},
    		dataType : 'json',
    		success : listView1,
    		error: function(){
    			alert("실패!");
    		}
    	})	
	}
    	
	function listView2(data){
		console.log(data);	     		
		var blist = ""; 
			blist += "<br><br><img class='img' src='resources/slimg2/"+data.sl_index+".jpg'>"
			blist += "<br><br><h4>　　　　"+data.sl_word+"</h4>" 
		$('#image3').html(blist);    	
	 }

	function selectsl2(){
    	$.ajax({
    		url:'${cpath}/selectslAjax.do',
    		type : 'get',
    		data:{'sl_index':15},
    		dataType : 'json',
    		success : listView2,
    		error: function(){
    			alert("실패!");
    		}
    	})	
	}
	
    	
    </script>
	
	
	
	
</body>
</html>