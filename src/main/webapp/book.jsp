<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dto.Book"%>
<jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<style>
	h1 {
		font-family: 'Do Hyeon', sans-serif;
	}
</style>
<title>도서 상세 정보</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="jumbotron bg-warning text-light">
		<div class="container">
			<h1 class="display-5">도서 상세 정보</h1>
		</div>
	</div>
	<% /////////////////////////////////////이 부분 왜 bookId가 아닌지 짚고 넘어갈것
	String id = request.getParameter("id");
	Book book = bookDAO.getBookById(id);
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<h3><%=book.getbName()%></h3>
				<p><%=book.getDescription()%>
				<p><b>도서코드</b> : <span class="badge badge-warning"><%=book.getBookId()%></span>
				<p><b>저자</b> :	<%=book.getAuthor()%>
				<p><b>출판사</b> : <%=book.getPublisher()%>
				<p><b>분류</b> : <%=book.getCategory()%>
				<p><b>재고수</b> : <%=book.getbInStock()%>
				<p><b>출판일</b> : <%=book.getReleaseDate()%>
				<h4><%=book.getbPrice()%>원</h4>
				<p><a href="#" class="btn btn-warning">도서 주문 &raquo;</a>
				<a href=".books.jsp" class="btn btn-dark">도서 목록 &raquo;</a>
			</div>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>