<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@	page import="dto.Book"%>
<%@ page import="dao.BookRepository"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>processAddBook.jsp</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8"); 
//3. 업로드 받을 파일의 경로, 용량, 인코딩 유형
		String filename = "";
		String realFolder = "E:\\Project\\upload";
		int maxSize = 5 * 1024 * 1024; //최대 업로드 가능 파일 5MB
		String encType = "UTF-8";
		
//4. MultipartRequest 객체를 생성하도록 생성자 작성 (위의 설정된 값을 매개변수로, DefaultFileRenamePolicy() 메소드)
		MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());		

//1. 요청 파라미터 값을 얻어오도록 MultipartRequest 객체 타입의 getParameter() 메소드 작성 		
		String bookId = multi.getParameter("bookId");
		String bName = multi.getParameter("bName");
		String bPrice = multi.getParameter("bPrice");
		String description = multi.getParameter("description");
		String author = multi.getParameter("author");
		String publisher = multi.getParameter("publisher");
		String category = multi.getParameter("category");
		String bInStock = multi.getParameter("bInStock");
		String releaseDate = multi.getParameter("releaseDate");
		String bType = multi.getParameter("bType");
		
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

//5. MultipartRequest 객체 타입의 getFileName() / getFiledsystemName() 메소드 작성
		Enumeration files = multi.getFileNames();
		String fname = (String) files.nextElement();
		String fileName = multi.getFilesystemName(fname);

//2. addBook.jsp 폼 페이지에서 입력된 데이터를 저장하도록 BookRepository 클래스의 addBook()메소드 호출
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
		newBook.setFilename(filename);

		dao.addBook(newBook); //여기까지
		
		response.sendRedirect("books.jsp");
	%> 
</body>
</html>