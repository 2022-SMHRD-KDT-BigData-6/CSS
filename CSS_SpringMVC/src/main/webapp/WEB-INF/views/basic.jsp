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
	
</body>
</html>