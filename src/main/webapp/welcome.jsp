<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Gugi&display=swap" rel="stylesheet">
<title>개발문고</title>
</head>
<body>
	<%@ include file="header.jsp"%>

	<%!String greeting = "개발문고";
	String tagline = "<br>엄선한 최신 IT 서적들을 둘러보세요.<br><br><br>";%>

	<div class="jumbotron  bg-warning">
		<!-- bg-primary text-light -->
		<div class="container">
			<h1 class="display-2 text-center" name="title">
				<p><%=greeting%></p>
			</h1>
		</div>
	</div>
	<div class="container">
		<div class="text-center">
			<h3><%=tagline%></h3>
			
<!-- 메뉴 전체도서 / 자격증도서 / 수업교재 카테고리 추가 -->
	<div class="container">
		<div class="row" align="center">
			<div class="col-md-4">
				<div class="bookimage">
				<a href="./books.jsp"><img src="./resources/images/b9791196918033.png" style="width:70%"/></a><br><br><br>
				</div>
				<h4><b>전체도서보기</b></h4><br>
			</div>
			<div class="col-md-4">
				<div class="bookimage">
				<a href="./bookLicense.jsp"><img src="./resources/images/b9788988474846.png" style="width:70%"/></a><br><br><br>
				</div>
				<h4><b>자격증</b></h4><br>
			</div>
			<div class="col-md-4">
				<div class="bookimage">
				<a href="./bookClass.jsp"><img src="./resources/images/b9788970509471.png" style="width:70%"/></a><br><br><br>
				</div>
				<h4><b>수업교재</b></h4><br>
			</div>
		</div>
	</div><br><br>			
			<%
			response.setIntHeader("Refresh", 30);
			Date day = new java.util.Date();
			String am_pm;
			int hour = day.getHours();
			int min = day.getMinutes();
			int second = day.getSeconds();
			if (hour / 12 == 0) {
				am_pm = "AM";
			} else {
				am_pm = "PM";
				hour = hour - 12;
			}
			String CT = hour + ":" + min + ":" + second + " " + am_pm;
			out.println("현재 접속 시각 : " + CT);
			%>
		</div>
	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>