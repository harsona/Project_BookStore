<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%-- <%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Book"%>
<%@ page import="dao.BookRepository"%> 
<jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session"/>
<%@ page errorPage="exceptionNoBookId.jsp"%>  --%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@700&family=Gowun+Dodum&display=swap" rel="stylesheet">
<title>도서 목록</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="jumbotron bg-warning">
		<div class="container">
			<h1 class="display-4">따끈따끈 신간도서를 만나보세요.</h1>
		</div>
	</div>
	
<%-- 	<%
		//ArrayList<Book> listOfBooks = bookDAO.getAllBooks(); 
		BookRepository dao = BookRepository.getInstance();
		ArrayList<Book> listOfBooks = dao.getAllBooks();
	%> --%>
	
	<div class="container">
		<div class="row" align="center">
		<%@ include file="dbconnection.jsp"%>
		<%
			String sql = "select * from bookDB";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
		%>
		
<%-- 		<% 
			for (int i = 0; i < listOfBooks.size(); i++) {
				Book book = listOfBooks.get(i);
			%> 
--%>
			<div class="col-md-4">
			
<%-- 			<img src="./resources/images/<%=book.getFilename()%>" style="width:50%"/><br><br>
				<h4><b><%=book.getbName()%></b></h4><br>
				<p><%=book.getDescription()%>
				<p><h5><%=book.getbPrice()%>원</h5><br>
				<p><a href="./book.jsp?id=<%=book.getBookId()%>" class="btn btn-warning" role="button">상세 정보 &raquo;</a> 
--%>				
				<p><br><img src="E:/Project/upload/<%=rs.getString("b_fileName")%>.png" style="width:80%"><br><br>
				<p><h5><%=rs.getString("b_bName")%></h3>
		   <%-- <p><%=rs.getString("b_description")%> --%>
				<p><%=rs.getString("b_bPrice")%>원<br>
				<p><a href="./book.jsp?id=<%=rs.getString("b_bookId")%>" class="btn btn-warning" role="button"> 상세 정보 &raquo;</a>
				<br><br><br>
			</div>
			<%
				}
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			%>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>