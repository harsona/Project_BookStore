<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Book"%>
<%@ page import="dao.BookRepository"%>
<%
	String id = request.getParameter("id");
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("../books.jsp");
		return;
	}

	BookRepository dao = BookRepository.getInstance();
	
	Book book = dao.getBookById(id);
	if (book == null) {
		response.sendRedirect("./exception/exceptionNoBookId.jsp");
	}
//-----여기까지는 addCart.jsp와 동일 

//장바구니 cartlist에 등록된 모든 도서를 가져오도록 getAttribute() 작성
	ArrayList<Book> cartList = (ArrayList<Book>) session.getAttribute("cartlist");
	Book goodsQnt = new Book(); //addCart.jsp의 goodsQnt 다시 생성
	
	for (int i = 0; i < cartList.size(); i++) {
		goodsQnt = cartList.get(i);  // 상품리스트 하나씩 출력
		if (goodsQnt.getBookId().equals(id)) { 
			cartList.remove(goodsQnt); //요청 파라미터와 id가 같으면 삭제
		}
	}
	response.sendRedirect("cart.jsp");
%>