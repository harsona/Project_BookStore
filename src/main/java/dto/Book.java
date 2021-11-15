package dto;

public class Book {
//1. 멤버 변수 선언하기	 
	private String bookId;		//1.도서코드 ISBN
	private String bName;		//2.도서명
	private Integer bPrice;		//3.가격
	private String author;		//4.저자
	private String description; //5.상세정보
	private String publisher;   //6.출판사
	private String category;	//7.분류
	private long bInStock;		//8.재고수
	private String releaseDate; //9.출판일
	private String bType; 		//10.타입(Paper, Ebook)
	private String filename;     //11.이미지 파일명

//2. 기본 생성자 작성하기
	public Book() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Book(String bookId, String bName, Integer bPrice) {
		this.bookId = bookId;
		this.bName = bName;
		this.bPrice = bPrice;
	}

//3. 모든 멤버 변수의 Setter/Getter() 메소드 작성하기
	public String getBookId() {
		return bookId;
	}
	public void setBookId(String bookId) {
		this.bookId = bookId;
	}
	public String getbName() {
		return bName;
	}
	public void setbName(String bName) {
		this.bName = bName;
	}
	public Integer getbPrice() {
		return bPrice;
	}
	public void setbPrice(Integer bPrice) {
		this.bPrice = bPrice;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public long getbInStock() {
		return bInStock;
	}
	public void setbInStock(long bInStock) {
		this.bInStock = bInStock;
	}
	public String getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}
	public String getbType() {
		return bType;
	}
	public void setbType(String bType) {
		this.bType = bType;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
}