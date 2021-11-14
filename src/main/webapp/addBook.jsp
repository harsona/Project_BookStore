<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="./resources/js/validation.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<style>	h1 {font-family: 'Do Hyeon', sans-serif;}</style>
<title>신규 도서 등록</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="jumbotron bg-warning text-light">
		<div class="container">
			<h1 class="display-4">신규 도서 등록</h1>
		</div>
	</div>
	<div class="container">
		<form name="newBook" action="./processAddBook.jsp" class="form-horizontal" method="post">
			<div class="form-group row">
				<label class="col-sm-2">도서코드</label>
				<div class="col-sm-3">
					<input type="text" name="bookId" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">도서명</label>
				<div class="col-sm-3">
					<input type="text" name="bName" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">도서가격</label>
				<div class="col-sm-3">
					<input type="text" name="bPrice" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상세정보</label>
				<div class="col-sm-5">
					<textarea name="description" cols="50" rows="2"
						class="form-control"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">저자</label>
				<div class="col-sm-3">
					<input type="text" name="author" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">출판사</label>
				<div class="col-sm-3">
					<input type="text" name="publisher" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">분류</label>
				<div class="col-sm-3">
					<input type="text" name="category" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">재고수</label>
				<div class="col-sm-3">
					<input type="text" id="bInStock" name="unitsInStock"
						class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">출판일</label>
				<div class="col-sm-3">
					<input type="text" id="releaseDate" name="unitsInStock"
						class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">타입</label>
				<div class="col-sm-5">
					<input type="radio" name="bType" value="Paper"> 일반도서
					<input type="radio" name="bType" value="Ebook"> E-BOOK
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">이미지</label>
				<div class="col-sm-5">
					<input type="file" name="bImage" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<br><input type="submit" class="btn btn-warning" value="등록">
				</div>
			</div>
		</form>
	</div>
</body>
</html>