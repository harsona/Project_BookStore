<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconnection.jsp" %>
<%
	String filename = "";
	String realFolder = "E:/project/upload"; //웹 어플리케이션상의 절대 경로
	String encType = "utf-8"; //인코딩 타입
	int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기5Mb

	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	String bookId = multi.getParameter("bookId");
	String bName = multi.getParameter("bName");
	String bPrice = multi.getParameter("bPrice");
//	String description = multi.getParameter("description");
	String author = multi.getParameter("author");
	String publisher = multi.getParameter("publisher");
	String category = multi.getParameter("category");
	String bInStock = multi.getParameter("bInStock");
	String releaseDate = multi.getParameter("releaseDate");
	String bType = multi.getParameter("bType");

	Integer price;

	if (bPrice.isEmpty())
		price = 0;
	else
		price = Integer.valueOf(bPrice);

	long stock;

	if (bInStock.isEmpty())
		stock = 0;
	else
		stock = Long.valueOf(bInStock);

	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);	

	
		String sql = "select * from bookDB where b_bookId = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bookId);
		rs = pstmt.executeQuery();

		if (rs.next()) {
			if (fileName != null) {
				sql = "UPDATE bookDB SET b_bName=?, b_bPrice=?, b_author=?, b_publisher=?, b_category=?, b_bInStock=?, b_releaseDate=?, b_btype=?, b_fileName=? WHERE b_bookId=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, bName);
				pstmt.setInt(2, price);
				pstmt.setString(3, author);
				pstmt.setString(4, publisher);
				pstmt.setString(5, category);
				pstmt.setLong(6, stock);
				pstmt.setString(7, releaseDate);
				pstmt.setString(8, bType);
				pstmt.setString(9, fileName);
				pstmt.setString(10, bookId);
				pstmt.executeUpdate();
			} else {
				sql = "UPDATE bookDB SET b_bName=?, b_bPrice=?, b_author=?, b_publisher=?, b_category=?, b_bInStock=?, b_releaseDate=?, b_btype=? WHERE b_bookId=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, bName);
				pstmt.setInt(2, price);
				pstmt.setString(3, author);
				pstmt.setString(4, publisher);
				pstmt.setString(5, category);
				pstmt.setLong(6, stock);
				pstmt.setString(7, releaseDate);
				pstmt.setString(8, bType);
				pstmt.setString(9, bookId);
				pstmt.executeUpdate();
			}
		}
	if (rs != null) rs.close();
 	if (pstmt != null) pstmt.close();
 	if (conn != null) conn.close();

	response.sendRedirect("editBook.jsp?edit=update");
%>


