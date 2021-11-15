<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<style>	h2 {font-family: 'Do Hyeon', sans-serif;}</style>
<title>로그인</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="jumbotron bg-warning">
		<div class="container">
			<h2 class="display-3">로그인 페이지</h2>
		</div>
	</div>
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4"><br><br>
			<!-- <h3 class="form-signin-heading"><br>Please Sign in</h3><br><br> -->
			<!--  실패했을 때 요청 파라미터값(error)을 얻어와 오류 메시지 출력 -->
			<%
				String error = request.getParameter("error");
				if (error != null) {
					out.println("<div class='alert alert-danger'>");
					out.println("아이디와 비밀번호를<br>확인해 주세요");
					out.println("</div>");
				}
			%>
			<!-- 로그인을 위한 폼 태그 -->
			<form class="form-signin" action="j_security_check" method="post">
				<div class="form-group">
					<label for="inputUserName" class="sr-only">User Name</label> 
					<input	type="text" class="form-control" placeholder="ID"	name='j_username' required autofocus>
				</div>
				<div class="form-group">
					<label for="inputPassword" class="sr-only">Password</label> 
					<input 	type="password" class="form-control" placeholder="Password" name='j_password' required>
				</div><br>
				<button class="btn btn btn-warning btn-success btn-block" type="submit">Log in</button>
			</form>
		</div>
	</div>
</body> <!-- web.xml에서 login.jsp와 login_failed.jsp 설정해놈 -->
</html>