<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Book"%>
<%@ page import="dao.BookRepository"%>
<%
//1. 요청 파라미터 아이디 전송 / 없을시에는 도서목록 페이지로 이동
	String id = request.getParameter("id");
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("books.jsp");
		return;
	}
//2. 도서 데이터 접근 클래스 BookRepository의 기본생성자에 대한 객체변수 instance를 얻어오도록 작성
	BookRepository dao = BookRepository.getInstance();

//3. getBookById()로 도서 상세 정보를 불러오고 없으면 예외페이지로 이동
	Book book = dao.getBookById(id);
	if (book == null) {
		response.sendRedirect("exceptionNoBookId.jsp");
	}
//4. getAllBooks로 도서 목록을 불러와 ArrayList객체 goodsList에 저장 
	ArrayList<Book> goodsList = dao.getAllBooks();
	Book goods = new Book();  //goods 생성
	for (int i = 0; i < goodsList.size(); i++) {
		goods = goodsList.get(i);
		if (goods.getBookId().equals(id)) { 			
			break;
		}
	}
//5. 세션 carlist를 ArrayList객체 list에 저장	
	ArrayList<Book> list = (ArrayList<Book>) session.getAttribute("cartlist");
	if (list == null) { 
		list = new ArrayList<Book>();
		session.setAttribute("cartlist", list);
	}
//6. 장바구니 수량 증가
	int cnt = 0;
	Book goodsQnt = new Book(); //goodsQnt 생성
	
	for (int i = 0; i < list.size(); i++) {
		goodsQnt = list.get(i);
		
		if (goodsQnt.getBookId().equals(id)) {
			cnt++;
			int orderQuantity = goodsQnt.getQuantity() + 1;
			goodsQnt.setQuantity(orderQuantity);
		}
	}
	if (cnt == 0) { 
		goods.setQuantity(1);
		list.add(goods);
	}

	response.sendRedirect("book.jsp?id=" + id);
%>