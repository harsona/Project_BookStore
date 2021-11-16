<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<script type="text/javascript" src="./resources/js/validation.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<style>	h1 {font-family: 'Do Hyeon', sans-serif;}</style>
<title>신규 도서 등록</title>
</head>
<body>
	<fmt:setLocale value='<%= request.getParameter("language") %>'/>
	<fmt:bundle basename="bundle.message"> 
	<jsp:include page="header.jsp" />
	<div class="jumbotron bg-warning text-light">
		<div class="container"> <!-- title=신규 도서 등록 (message.properties에서 설정) -->
			<h1 class="display-4"><fmt:message key="title"/></h1> 
		</div>
	</div>
	<div class="container">
<!-- 다국어 설정 및 로그인 링크 <fmt:message key="..."/>으로 변경 -->
		<div class="text-right">
			<a href="?language=ko">Korean</a> | <a href="?language=en">English</a><br><br>
			<a href="logout.jsp" class="btn btn-sm btn-warning pull-right text-light">logout</a>
		</div>
		
		<form name="newBook" action="./processAddBook.jsp" class="form-horizontal" method="post" enctype="">
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="bookId"/></label>
				<div class="col-sm-3">
					<input type="text" id="bookId" name="bookId" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="bName"/></label>
				<div class="col-sm-3">
					<input type="text" id="bName" name="bName" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="bPrice"/></label>
				<div class="col-sm-3">
					<input type="text" id="bPrice" name="bPrice" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="description"/></label>
				<div class="col-sm-5">
					<textarea name="description" cols="50" rows="2"
						class="form-control"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="author"/></label>
				<div class="col-sm-3">
					<input type="text" name="author" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="publisher"/></label>
				<div class="col-sm-3">
					<input type="text" name="publisher" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="category"/></label>
				<div class="col-sm-3">
					<input type="text" name="category" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="bInStock"/></label>
				<div class="col-sm-3">
					<input type="text" id="bInStock" name="bInStock"
						class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="releaseDate"/></label>
				<div class="col-sm-3">
					<input type="text" id="releaseDate" name="releaseDate"
						class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="bType"/></label>
				<div class="col-sm-5">
					<input type="radio" name="bType" value="Paper"> <fmt:message key="bType_Paper"/>
					<input type="radio" name="bType" value="Ebook"> <fmt:message key="bType_Ebook"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="bImage"/></label>
				<div class="col-sm-5">
					<input type="file" name="bImage" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<!-- 유효성 검사 validation.js의 onclick="CheckAddBook()" 메소드 삽입 -->
					<br><input type="button" class="btn btn-warning" value="<fmt:message key="button"/>" onclick="CheckAddBook()">
				</div>
			</div>
		</form>
	</div>
</fmt:bundle>
</body>
</html>