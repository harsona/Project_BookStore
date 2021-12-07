<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header.jsp</title>
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>
</head>
<body>
<nav class="navbar navbar-expand  navbar-dark bg-dark">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="./welcome.jsp">Home</a>
		</div>
		<div>
			<ul class="navbar-nav mr-auto">
				<c:choose>
					<c:when test="${empty sessionId}">
						<li class="nav-item"><a class="nav-link" href="<c:url value="/member/loginMember.jsp"/>">로그인 </a></li>
						<li class="nav-item"><a class="nav-link" href='<c:url value="/member/addMember.jsp"/>'>회원가입</a>
					</c:when>
					<c:otherwise>
						<li style="padding-top: 7px; color: white">[<%=sessionId%>님]</li>
						<li class="nav-item"><a class="nav-link" href="<c:url value="/member/logoutMember.jsp"/>">로그아웃 </a></li>
						<li class="nav-item"><a class="nav-link" href='<c:url value="/member/updateMember.jsp"/>'>회원정보수정</a>
					</c:otherwise>
				</c:choose>
				<li class="nav-item"><a class="nav-link" href="<c:url value="/books.jsp"/>">도서목록</a></li>
				<li class="nav-item"><a class="nav-link" href="<c:url value="/addBook.jsp"/>">도서등록</a></li>
				<li class="nav-item"><a class="nav-link" href="<c:url value="/editBook.jsp?edit=update"/>">도서수정</a></li>
				<li class="nav-item"><a class="nav-link" href="<c:url value="/editBook.jsp?edit=delete"/>">도서삭제</a></li>			
			</ul>
		</div>
	</div>
</nav>
</body>
</html>



