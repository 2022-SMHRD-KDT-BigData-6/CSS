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
<title>CSS HOME</title>
</head>
<body>

	<div class = "container">
	<h2>jQuery+ajax+Session관리</h2>
		<div class="panel panel-default">
  			<div class="panel-heading">
  			
  			<c:if test="${empty lvo}">
				<form class="form-inline" action="${cpath}/login.do">
					<div class="form-group">
						<label for="id">아이디 :</label> 
						<input type="text" class="form-control" id="id" name="id">
					</div>
					<div class="form-group">
						<label for="pw">비밀번호 :</label> 
						<input type="password" class="form-control" id="pw" name="pw">
					</div>
					<button type="submit" class="btn btn-info btn-sm">로그인</button>
				</form>
			</c:if>
			
			<c:if test="${!empty lvo}">
				<h2>${lvo.name}님 환영합니다!</h2>
				<button type="reset" onclick='location.href="${cpath}/logout.do"' class="btn btn-warning btn-sm">로그아웃</button>
			</c:if>
						
			</div>
  			<div class="panel-body">
  				<table class = "table table-bordered table-hover">
  					<tr class="heading">
  						<td>번호</td>
  						<td>제목</td>
  						<td>작성자</td>
  						<td>작성일</td> 
  						<td>삭제</td> 					
  					</tr>
  					
  					<!-- 들어온 데이터 출력하는 부분 
  					// 3. 화면에 보여주는 함수 생성 -->
  					<c:if test="${!empty lvo}">
  					<tr>
  						<td colspan = "5">  						  						
  						 	<button onclick="goInsert()" class="btn-success btn-sm">글쓰기</button>
  						 						 
  						</td>
  					</tr>
  					</c:if>
	  			</table>
	  			
	  			<div id ="insertview" style = "display:none">
					<form id ="frm" method="post">
					<input type="hidden" name="id" value="${lvo.id}">
						<div class="form-group">
							<label for="title">제목 :</label> 
							<input type="text"	class="form-control" id="title" name ="title">
						</div>
						<div class="form-group">
							<label for="writer">작성자 :</label> 
							<input type="text" class="form-control" id="writer" name = "writer" value="${lvo.name}" readonly="readonly">
						</div>
						<div class="form-group">
							<label for="contents">내용 :</label> 
							<textarea rows ="10" class= "form-control" id="contents" name = "contents"></textarea>
						</div>
							<button type = "button" onclick="boardInsert()" class="btn btn-success btn-sm">글쓰기</button>


						<button type = "reset" class="btn btn-warning btn-sm close">닫기</button>
					</form>
				</div>
				
			</div>
		</div>	
	</div>
	
	<script type="text/javascript">
	// 1. 해당하는 페이지에 접속하자마자 서버의 데이터를 요청하는 ajax 함수를 실행 
	 
 	$(document).ready(function(){
		loadList();  // --> 호출!!!
	}) 

    // 2. 서버에 요청하는 ajax 함수를 생성
	function loadList(){
		$.ajax({
			// 서버 url
			url : '${cpath}/boardListAjax.do',
			// data : 보내줄 데이터를 객체형식으로 넘겨줬었음! {'idx':idx}
			// 요청 방식
			type : 'get',
			// 받아올 데이터 타입 지정
			dataType : 'json',
			// 성공했을 때 실행할 함수
			success : listView,
			// 실패했을 때 실행할 함수
			error : function(){
				alert('실패!');
			}
		})
	}	
	
	// 3. 화면에 보여주는 함수 생성
	function listView(data){
		
		console.log(data);
		// 내가 화면에 출력해줄 tr 태그들의 모음
		var blist = "";
		
		// for-each문을 사용하는 방법
		// 형식 : $.each(어떤 데이터를 가지고 반복, 어떤 함수로 처리해줄건지)		 
		$.each(data, function(index, board){
			// function(인덱스번호, data안에 들어있는 각각의 값들을 어떤 변수로 받아줄 건지 명시) // 순서가 중요
			blist += "<tr class ='innerContent'>"
			blist += "<td>"+board.idx+"</td>"
			blist += "<td><a href = 'javascript:viewContent("+board.idx+")'>"+board.title+"</a></td>"  // a 태그에서 javascript 코드 실행
			blist += "<td>"+board.writer+"</td>"
			blist += "<td>"+board.indate+"</td>"
			
			<!-- "${lvo.id}" : 꺼내온 아이디를 변수로 인식하지 않도록 문자열이라고 표현하는 "" 을 EL 표현식에 붙여주기 -->
			if("${lvo.id}"==board.id){   
				blist += "<td><button onclick = 'boardDelete("+board.idx+")' class='btn-sm btn-danger btn'>삭제</button></td>"
			} else {
				blist += "<td><button disabled onclick = 'boardDelete("+board.idx+")' class='btn-sm btn-danger btn'>삭제</button></td>"
			}
			
			blist += "</tr>"
			
			blist += "<tr class = 'innerContent' id ='vc"+board.idx+"' style = 'display:none'>"  // vcidx
			blist += "<td colspan = '5'>"
//			blist += "<textarea id='mfcont"+board.idx+"' rows = '5' class='form-control'>"+board.contents+"</textarea>"
			blist += "<textarea  rows = '5' class='form-control'>"+board.contents+"</textarea>"
			blist += "<br>"
			blist += "<button onclick='boardUpdate("+board.idx+")' class = 'btn-primary btn btn-sm'>수정</button>"
			blist += "&nbsp<button class = 'btn-warning btn btn-sm'>닫기</button>"
			blist += "</td>"					
			blist += "</tr>"
		})
		
		// heading이라는 class명을 가진 tr태그 다음에 blist를 추가하기
		$('.innerContent').remove();  // 한번 지우기
		$('.heading').after(blist);   // 붙이기
	}
	
	// 4. 글쓰기 버튼을 누를때 div(insertview) 영역 보이기
	function goInsert() {
		
		if($('#insertview').css('display') == 'none') {
			//$('#insertview').css('display', 'block');
			$('#insertview').slideDown();
		}else{
			//$('#insertview').css('display', 'none');
			$('#insertview').slideUp();
		}
	}
	
	// 1. 글쓰기 버튼을 클릭했을 때 작동할 함수 생성(boardInsert)
	function boardInsert() {
		// 2. form 태그 안쪽에 있는 input 2개, textarea안에 들어있는 값을 가져와서
		var formdata = $('#frm').serialize(); // 직렬화한다.
		// form 태그 안에 있는 input, textarea 등등에 name 값이 달려있는 태그들의 값을 가져와서 직렬화시키는 함수
		// 직렬화시키는 함수
		
			// 3. boardInsert.do로 해당하는 데이터를 보내주기
			$.ajax({
				// 서버 url
				url : '${cpath}/boardInsert.do',
				// data : 보내줄 데이터를 객체형식으로 넘겨줬었음! {'idx':idx}
				// 안에 있는 글자를 가져온다. ---> 태그부터 가져와서--->  $('title').val()
				//data : {'title' : $('title').val(), 'writer' : $('writer').val(), 'contents' : $('contents').val()}

				data : formdata,

				type : 'post',
				// 받아올 데이터 타입 지정
				// 성공했을 때 실행할 함수
				// 4. 받아올 데이터는 없지만, 성공했을때는 loadList 함수를 다시 한번 실행(화면에 보여지는 결과는 새로 들어간 값까지 포함하여 보여주기)
				success : loadList,
				// 실패했을 때 실행할 함수
				error : function() {
					alert('에러!');
				}
			})
			
			// 초기화 버튼을 한번 클릭!
			$('.close').trigger('click');
		
			// insertview div태그를 다시 접어주기
			$('#insertview').slideUp();			
		}
		
	    // 글 목록에서 idx 기반 삭제
		function boardDelete(idx){   // idx를 그대로 명시
			$.ajax({
				url : '${cpath}/boardDelete.do',
				data : {'idx': idx},
				type : 'get',
				success : loadList,
				error : function(){
					alert('실패!');
				}				
			})
		}
		
		// 글 제목을 눌렀을때 idx 기반 상세보기
		function viewContent(idx){
			if($('#vc'+idx).css('display') == 'none') {
				$('#vc'+idx).css('display', 'table-row');
			}else{
				$('#vc'+idx).css('display', 'none');
			}			
		}
		
		// 수정하기 버튼을 눌렀을 때 내용 수정
		function boardUpdate(idx){
			// 1. textarea안에 들어있는 데이터를 가져오기
			//var strcont = $('#mfcont'+idx).val();
			var strcont = $('#vc'+idx+' textarea').val();  // tr(vc)의 자손인 textarea
			
			// 2. ajax를 활용해서 controller에 수정을 요청
			$.ajax({
				url : '${cpath}/boardUpdateAjax.do',
				data : {'contents' : strcont, 'idx' : idx},
				type : 'get',
				success : loadList,
				error : function() {
					alert('실패!');
				}
			})
		}
		
	</script>	
</body>
</html>