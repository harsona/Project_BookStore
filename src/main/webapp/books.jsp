<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Book"%>
<%@ page import="dao.BookRepository"%> 
<!-- jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session" / -->
<%@ page errorPage="exceptionNoBookId.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<style>	h1 { font-family: 'Do Hyeon', sans-serif;} </style>
<title>도서 목록</title>
</head>
<body>
	<jsp:include page="header.jsp" />

	<div class="jumbotron bg-warning">
		<div class="container">
			<h1 class="display-4">IT 자격증</h1>
		</div>
	</div>
	<%
		//ArrayList<Book> listOfBooks = bookDAO.getAllBooks(); 
		BookRepository dao = BookRepository.getInstance();
		ArrayList<Book> listOfBooks = dao.getAllBooks();
	%>
	<div class="container">
		<div class="row" align="center">
			<% 
			for (int i = 0; i < listOfBooks.size(); i++) {
				Book book = listOfBooks.get(i);
			%>
			<div class="col-md-4">
				<img src="./resources/images/<%=book.getFilename()%>" style="width:50%"/><br><br>
				<h4><b><%=book.getbName()%></b></h4>
				<br>
				<p><%=book.getDescription()%>
				<p><h5><%=book.getbPrice()%>원</h5><br>
				<p><a href="./book.jsp?id=<%=book.getBookId()%>" class="btn btn-warning" role="button">상세 정보 &raquo;</a>
			</div>
			<%
			}
			%>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>