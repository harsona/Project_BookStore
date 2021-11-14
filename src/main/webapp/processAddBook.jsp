<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dto.Book"%>
<%@page import="dao.BookRepository"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>processAddBook.jsp</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8"); 
		
		String bookId = request.getParameter("bookId");
		String bName = request.getParameter("bName");
		String bPrice = request.getParameter("bPrice");
		String description = request.getParameter("description");
		String author = request.getParameter("author");
		String publisher = request.getParameter("publisher");
		String category = request.getParameter("category");
		String bInStock = request.getParameter("bInStock");
		String releaseDate = request.getParameter("releaseDate");
		String bType = request.getParameter("bType");
		
		Integer price; //bPrice와 bInStock은 입력된 경우 정수형으로 변경
		if (bPrice.isEmpty()){
			price=0;			
		} else {
			price = Integer.valueOf(bPrice);
		}
		long stock;
		if (bInStock.isEmpty()){
			stock=0;			
		} else {
			stock = Long.valueOf(bInStock);
		}
//addBook.jsp 폼 페이지에서 입력된 데이터를 저장하도록 BookRepository 클래스의 addBook()메소드 호출
		BookRepository dao = BookRepository.getInstance();
		
		Book newBook = new Book();
		newBook.setBookId(bookId);
		newBook.setbName(bName);
		newBook.setbPrice(price); //Integer
		newBook.setDescription(description);
		newBook.setAuthor(author);
		newBook.setPublisher(publisher);
		newBook.setCategory(category);
		newBook.setbInStock(stock); //long 
		newBook.setReleaseDate(releaseDate);
		newBook.setbType(bType);

		dao.addBook(newBook); //여기까지
		
		response.sendRedirect("books.jsp");
	%> 
</body>
</html>