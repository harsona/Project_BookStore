<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<title>페이지 오류</title>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h2 class="alert alert-danger"> 요청하신 페이지를 찾을 수 없습니다.</h2>
		</div>
	</div>
	<div class="container">
		<p><%=request.getRequestURL()%></p><br><br><br>
		<p><a href="../books.jsp" class="btn btn-dark pull-right"> 도서 목록 페이지로 돌아가기 &raquo;</a></p>
	</div>
</body>
</html>