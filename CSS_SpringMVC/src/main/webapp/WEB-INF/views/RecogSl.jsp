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


<!-- 진석 -->
<script src="https://cdn.jsdelivr.net/npm/@mediapipe/drawing_utils@0.1/drawing_utils.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@mediapipe/holistic@0.1/holistic.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@mediapipe/camera_utils/camera_utils.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@mediapipe/control_utils/control_utils.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@mediapipe/drawing_utils/drawing_utils.js" crossorigin="anonymous"></script>
<script type="application/javascript"  src="https://cdn.jsdelivr.net/npm/@mediapipe/hands/hands.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@mediapipe/hands/hands_solution_simd_wasm_bin.js" crossorigin="anonymous"></script>


<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<meta content="Display Webcam Stream" name="title">
<link rel="stylesheet" href="resources/assets/css/main.css" />
<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@500&display=swap" rel="stylesheet">
<noscript><link rel="stylesheet" href="resources/assets/css/noscript.css" /></noscript>

<style>
	
	#header{
	
	
	font-family: 'IBM Plex Sans KR', sans-serif;
	
	}
	<!--결과 보내기-->
	.button{
		position: absolute;
	    background: #df7366;
	    color: #fff;
	    text-align: center;
	    border-radius: 0.5em;
	    text-decoration: none;
	    padding: 0.65em 2.5em 0.65em 2.5em;
	    border: 0;
	    cursor: pointer;
	    outline: 0;
	    font-weight: 150;
	    font-family: 'IBM Plex Sans KR', sans-serif;
	    
	  

	    top: 900px;
	    left: 30px;
	}

	<!--결과 보기-->
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
	    font-weight: 150;
	   	font-family: 'IBM Plex Sans KR', sans-serif;
	   	
	   	

	    top: 900px;
	    left: 280px;
	}
	
	<!--초기화-->
	.button2{
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
	    font-weight: 150;
	   	font-family: 'IBM Plex Sans KR', sans-serif;
	   	
	   	

	    top: 900px;
	    left: 470px;
	}
	

	    
	  

	   
	
	
	
	
	.img2{
		height:150px;
		weight:130px;
		
	}
	.img3{
		height:150px;
		weight:130px;
	
	}

.input_video {
  display: block;
    &.selfie {
    transform: scale(-1, 1);
  }
  
}
 
 
.output_canvas {
  max-width: 100%;
  display: block;
  background-color: #666;

 
  }
  
  h3,h4,h5{
  
font-family: 'IBM Plex Sans KR', sans-serif;
  
  
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
			<div class="panel-body" style = "height:850px">
				<div class="row">

					<div class="col-lg-5" id="image"  position= "absolute">
						<br><br><br>
						<video class="input_video" width="0px" height="0px" autoplay loop muted></video>
    					<canvas class="output_canvas" width="640px" height="400px"></canvas>
    				</div>	
   		
					<div class="col-lg-2" id="image1"  position= "absolute">
						<br><br>
						<img class="img1" >
						<br><br>
						<h3></h3>
						<br>
						<h4></h4>
						<h4></h4>	
					</div>
					<div class="col-lg-2" id="image2"  position= "absolute">
						<br><br>
						<img class="img2" >
						<br><br>
						<h4></h4>
						<br>
						<h5></h5>
						<h5></h5>
					</div>
					<div class="col-lg-2" id="image3"  position= "absolute">
						<br><br>
						<img class="img3">
						<br><br>
						<h4></h4>
						<br>
						<h5></h5>
						<h5></h5>
					</div>
				</div>
				<div>
					<button type="button" class="button">결과 보내기</button>
					<button type="button" class="button1" onclick="usesl();">결과 보기</button>
					<button type="button" class="button2">초기화</button>
				</div>    
			</div>
			
		</div>

		
	</div>

	<script type="text/javascript" src = "resources/assets/js/canvas.js"></script>
	
	

	<script type="text/javascript">
	 
	
	function usesl(){
		console.log("바뀐 숫자"+max);		
    	insertsl();
    	insertsl1();
    	insertsl2();
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
			data : {'sl_index':Number(max)+51},
			type : 'get',
			datatype : 'json',
			// 받아올 데이터 타입 지정
			// 성공했을 때 실행할 함수
			success: function(){
				
			},
			// 실패했을 때 실행할 함수
			error: function(){
				alert('실패!');
			}
		})	
        
    }
    
    function insertsl1(){
        $.ajax({
			// 서버 url
			url : '${cpath}/insertslAjax.do',
			// data : 보내줄 데이터를 객체형식으로 넘겨줬었음!{'idx':idx}
			// 요청 방식
			data : {'sl_index':Number(max2)+51},
			type : 'get',
			datatype : 'json',
			// 받아올 데이터 타입 지정
			// 성공했을 때 실행할 함수
			success: function(){
				
			},
			// 실패했을 때 실행할 함수
			error: function(){
				alert('실패!');
			}
		})	
        
    }
    
    function insertsl2(){
        $.ajax({
			// 서버 url
			url : '${cpath}/insertslAjax.do',
			// data : 보내줄 데이터를 객체형식으로 넘겨줬었음!{'idx':idx}
			// 요청 방식
			data : {'sl_index':Number(max3)+51},
			type : 'get',
			datatype : 'json',
			// 받아올 데이터 타입 지정
			// 성공했을 때 실행할 함수
			success: function(){
				
			},
			// 실패했을 때 실행할 함수
			error: function(){
				alert('실패!');
			}
		})	
        
    }

    
	
	function listView(data){
		console.log(data);	     		
		var blist = "<br><br><br>"; 
			blist += "<h3 >　　　1위</h3><br><br><img class='img' src='resources/slimg2/"+data.sl_index+".jpg'>"
			blist += "<br><br><h4>　　　　"+data.sl_word+"</h4>"
			blist += "<br><h4>　　　　"+Math.round(num1*100)+"%</h4>"
			//여기다 확률 표시
		$('#image1').html(blist);    	
	 }

function selectsl(){
    	$.ajax({
    		url:'${cpath}/selectslAjax.do',
    		type : 'get',
    		data:{'sl_index':Number(max)+51},
    		dataType : 'json',
    		success : listView,
    		error: function(){
    			alert("실패!");
    		}
    	})	
	}


function listView1(data){     		
	var blist = "<br><br><br>"; 
		blist += "<h3>　　　2위</h3><br><br><img class='img' src='resources/slimg2/"+data.sl_index+".jpg'>"
		blist += "<br><br><h4>　　　　"+data.sl_word+"</h4>" 
		blist += "<br><h4>　　　　"+Math.round(num2*100)+"%</h4>"
		//여기다 확률 표시
	$('#image2').html(blist);    	
 }

function selectsl1(){
	$.ajax({
		url:'${cpath}/selectslAjax.do',
		type : 'get',
		data:{'sl_index':Number(max2)+51},
		dataType : 'json',
		success : listView1,
		error: function(){
			alert("실패!");
		}
	})	
}
	
function listView2(data){	     		
	var blist = "<br><br><br>"; 
		blist += "<h3>　　　3위</h3></div><br><br><img class='img' src='resources/slimg2/"+data.sl_index+".jpg'>"
		blist += "<br><br><h4>　　　"+data.sl_word+"</h4>" 
		blist += "<br><h4>　　　　"+Math.round(num3*100)+"%</h4>"
		//여기다 확률 표시
	$('#image3').html(blist);    	
 }

function selectsl2(){
	$.ajax({
		url:'${cpath}/selectslAjax.do',
		type : 'get',
		data:{'sl_index':Number(max3)+51},
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
 
	
 
 
	
	
