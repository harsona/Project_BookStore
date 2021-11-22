<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dto.Book"%>
<%@ page import="dao.BookRepository"%>
<!-- <jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session" /> -->
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<title>도서 상세 정보</title>
<script type="text/javascript"> //자바스크립트로 핸들러함수 addToCart() 작성 추가
	function addToCart() {
		if (confirm("상품을 장바구니에 추가하시겠습니까?")) {
			document.addForm.submit(); //확인을 클릭하면 아래 addForm()이 실행
		} else {		
			document.addForm.reset();
		}
	}
</script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="jumbotron bg-warning text-light">
		<div class="container">
			<h1 class="display-4">도서 상세 정보</h1>
		</div>
	</div>
	<% 
		String id = request.getParameter("id");
		//Book book = bookDAO.getBookById(id);
		BookRepository dao = BookRepository.getInstance();
		Book book = dao.getBookById(id);
		//Book 객체 타입의 변수 book에 getBookById() 반환결과값을 저장
	%>
	<div class="container">
		<div class="row">		
			<div class="col-md-5">
				<img src="./resources/images/<%=book.getFilename()%>" style="width:70%"/> 
			</div>
			<div class="col-md-6">
				<h3><b><%=book.getbName()%></b></h3>
				<p><%=book.getDescription()%>
				<p><b>도서코드</b> : <span class="badge badge-warning"><%=book.getBookId()%></span>
				<p><b>저자</b> :	<%=book.getAuthor()%>
				<p><b>출판사</b> : <%=book.getPublisher()%>
				<p><b>분류</b> : <%=book.getCategory()%>
				<p><b>재고수</b> : <%=book.getbInStock()%>
				<p><b>출판일</b> : <%=book.getReleaseDate()%>
				<h4><%=book.getbPrice()%>원</h4><br>
				
				<p><form name="addForm" action="./addCart.jsp?id=<%=book.getBookId()%>" method="post">
					<!-- 도서 주문을 클릭하면 상단의 핸들러함수 addToCart()가 실행 -->
					<a href="#" class="btn btn-success" onclick="addToCart()"> 도서 주문 &raquo;</a>&nbsp;&nbsp; 
					<a href="./cart.jsp" class="btn btn-warning"> 장바구니 &raquo;</a>&nbsp;&nbsp;
					<a href="./books.jsp" class="btn btn-secondary"> 도서 목록 &raquo;</a>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>