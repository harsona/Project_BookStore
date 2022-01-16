<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@700&family=Gowun+Dodum&display=swap" rel="stylesheet">
<title>도서 정보 수정</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="jumbotron bg-warning text-light">
		<div class="container">
			<h1 class="display-4">도서 정보 수정</h1>
		</div>
	</div>
	<%@ include file="dbconnection.jsp"%>
	<%
		String bookId = request.getParameter("id");

		String sql = "select * from bookDB where b_bookId = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bookId); //물음표에 bookId 값을 설정
		rs = pstmt.executeQuery();
		if (rs.next()) {
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<p><img src="E:/project/upload/<%=rs.getString("b_filename")%>.png" alt="bImage" style="width: 75%" /><br>
				<p><input type="submit" class="btn btn-warning btn-block" style="width: 75%;" value="등 록">
			</div>
			<div class="col-md-7">
				<form name="newBook" action="./processUpdateBook.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
					<div class="form-group row">
						<label class="col-sm-2">도서코드</label>
						<div class="col-sm-5">
							<input type="text" id="bookId" name="bookId" class="form-control" value='<%=rs.getString("b_bookId")%>'>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">도서명</label>
						<div class="col-sm-5">
							<input type="text" id="bName" name="bName" class="form-control" value="<%=rs.getString("b_bName")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">가격</label>
						<div class="col-sm-5">
							<input type="text" id="bPrice" name="bPrice" class="form-control" value="<%=rs.getInt("b_bPrice")%>">
						</div>
					</div>
					
<%--      				<div class="form-group row">
						<label class="col-sm-2">상세설명</label>
						<div class="col-sm-5">
							<textarea name="description" cols="50" rows="2"
								class="form-control"><%=rs.getString("b_description")%></textarea>
						</div>
					</div>  --%>

					<div class="form-group row">
						<label class="col-sm-2">저자</label>
						<div class="col-sm-5">
							<input type="text" name="author" class="form-control" value="<%=rs.getString("b_author")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">출판사</label>
						<div class="col-sm-5">
							<input type="text" name="publisher" class="form-control" value="<%=rs.getString("b_publisher")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">분류</label>
						<div class="col-sm-5">
							<input type="text" name="category" class="form-control" value="<%=rs.getString("b_category")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">재고수량</label>
						<div class="col-sm-5">
							<input type="text" id="bInStock" name="bInStock" class="form-control" value="<%=rs.getLong("b_bInStock")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">출판일</label>
						<div class="col-sm-5">
							<input type="text" id="releaseDate" name="releaseDate" class="form-control" value="<%=rs.getString("b_releaseDate")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">도서타입</label>
						<div class="col-sm-5">
							<input type="radio" name="bType" value="bType_Paper"> 일반도서 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="bType" value="bType_Ebook"> 전자도서 
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">이미지</label>
						<div class="col-sm-5">
							<input type="file" name="bImage" class="form-control">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%
		}
		if (rs != null)	rs.close();
 		if (pstmt != null) pstmt.close();
 		if (conn != null) conn.close();
 	%>
</body>
</html>
