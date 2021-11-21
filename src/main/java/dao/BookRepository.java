package dao;

import java.util.ArrayList;

import dto.Book;

//1. 자바빈즈로 사용한 클래스 BookRepository
public class BookRepository {

	private ArrayList<Book> listOfBooks = new ArrayList<Book>();
	
//5. BookRepository 클래스의 기본생성자에 대한 객체변수 instance와 Getter() 메소드 작성	
	private static BookRepository instance = new BookRepository(); 
	
	public static BookRepository getInstance() {
		return instance;
	}
	
//2. 메인에 표시할 책 3권 등록해보기 (bookId, bName, bPrice)
	public BookRepository() { 

		Book book1 = new Book("b9791157675807", "정보처리기사 실기", 33000); 
		book1.setDescription("정보처리기사 필기 합격<br>2022년 4월 실기 응시 예정");
		book1.setAuthor("NCS 정보처리기술사 연구회");
		book1.setPublisher("건기원");
		book1.setCategory("컴퓨터/IT");
		book1.setbInStock(100);
		book1.setReleaseDate("2021/03");
		book1.setbType("Paper");
		book1.setFilename("b9791157675807.png");

		Book book2 = new Book("b9788988474846", "SQL 자격검정 실전문제", 18000);
		book2.setDescription("2021년 11월 20일 응시<br>12월 17일 결과 발표");
		book2.setAuthor("한국데이타베이스진흥원");
		book2.setPublisher("한국데이터진흥원");
		book2.setCategory("컴퓨터/IT");
		book2.setbInStock(10);
		book2.setReleaseDate("2016/11");
		book2.setbType("Paper");
		book2.setFilename("b9788988474846.png");

		Book book3 = new Book("b9788931462326", "리눅스마스터 2급 기본서", 25000);
		book3.setDescription("2021년 12월 11일 응시<br>12월 31일 결과 발표");
		book3.setAuthor("권소라");
		book3.setPublisher("영진닷컴");
		book3.setCategory("컴퓨터/IT");
		book3.setbInStock(999);
		book3.setReleaseDate("2021/03");
		book3.setbType("Paper");
		book3.setFilename("b9788931462326.png");

		listOfBooks.add(book1);
		listOfBooks.add(book2);
		listOfBooks.add(book3);
	}
	
//3. 변수 listOfBooks에 저장된 도서목록을 가져오는 getAllBooks() 메소드 작성
	public ArrayList<Book> getAllBooks() {
		return listOfBooks;
	}

//4. listOfBooks에서 아이디가 일치하는 도서의 상세 정보를 가져오는 getBookById 메소드 작성
	public Book getBookById(String bookId) {
		Book bookById = null;

		for (int i=0; i<listOfBooks.size(); i++) {
			Book book = listOfBooks.get(i);
			if (book!=null && book.getBookId()!=null && book.getBookId().equals(bookId)){
				bookById = book;
				break;
			}
		} 
		return bookById;
	}
	
//6. 객체 변수 listOfBooks에 새로운 도서 정보를 등록하는 addBook()메소드 작성
	public void addBook(Book book) {
		listOfBooks.add(book);
	}
}
