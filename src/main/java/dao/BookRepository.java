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

		Book Book1 = new Book("9791157675807", "정보처리기사 실기", 33000); 
		Book1.setDescription("정보처리기사 필기 합격,<br>2022년 5월 실기 응시 예정");
		Book1.setAuthor("NCS 정보처리기술사 연구회");
		Book1.setPublisher("건기원");
		Book1.setCategory("컴퓨터/IT");
		Book1.setbInStock(100);
		Book1.setReleaseDate("2021/03");
		Book1.setbType("Paper");

		Book Book2 = new Book("9788988474846", "SQL 자격검정 실전문제", 18000);
		Book2.setDescription("2021년 11월 20일 응시");
		Book2.setAuthor("한국데이타베이스진흥원");
		Book2.setPublisher("한국데이터진흥원");
		Book2.setCategory("컴퓨터/IT");
		Book2.setbInStock(10);
		Book2.setReleaseDate("2016/11");
		Book2.setbType("Paper");

		Book Book3 = new Book("9788931462326", "리눅스마스터 2급 기본서", 25000);
		Book3.setDescription("2021년 12월 11일 응시");
		Book3.setAuthor("권소라");
		Book3.setPublisher("영진닷컴");
		Book3.setCategory("컴퓨터/IT");
		Book3.setbInStock(999);
		Book3.setReleaseDate("2021/03");
		Book3.setbType("Paper");

		listOfBooks.add(Book1);
		listOfBooks.add(Book2);
		listOfBooks.add(Book3);
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
