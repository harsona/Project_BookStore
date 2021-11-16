<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<style> h2 { font-family: 'Do Hyeon', sans-serif; }</style>
<title>도서코드 오류</title>
</head>
<body>
	<jsp:include page="header.jsp" />	
	<div class="jumbotron">
		<div class="container">
			<h2 class="alert alert-danger"> 해당 도서가 존재하지 않습니다.</h2>
		</div>
	</div>
	<div class="container">
		<p><%=request.getRequestURL()%>?<%=request.getQueryString()%><br><br><br></p>
		<p><a href="books.jsp" class="btn btn-dark pull-right"> 도서 목록 페이지로 돌아가기 &raquo;</a></p>
	</div>
</body>
</html>