<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@700&family=Gowun+Dodum&display=swap" rel="stylesheet">
<title>도서 정보 편집</title>
<script type="text/javascript">
	function deleteConfirm(id) {
		if (confirm("해당 도서를 삭제합니다!!") == true)
			location.href = "./deleteBook.jsp?id=" + id;
		else
			return;
	}
</script>
</head>
<%
	String edit = request.getParameter("edit");
%>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="jumbotron bg-warning text-light">
		<div class="container">
			<h1 class="display-4">도서 정보 변경</h1>
		</div>
	</div>

	<div class="container">
		<div class="row" align="center">
			<%@ include file="dbconnection.jsp"%>
			<%
				String sql = "select * from bookDB";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
			%>
			<div class="col-md-4">
				<p><br><img src="E:/Project/upload/<%=rs.getString("b_fileName")%>.png" style="width:80%"><br><br>
				<p><h5><%=rs.getString("b_bName")%></h3>
		   <%-- <p><%=rs.getString("b_description")%> --%>
				<p><%=rs.getString("b_bPrice")%>원<br>
				<p>
					<%
						if (edit.equals("update")) {
					%>
				<a href="./updateBook.jsp?id=<%=rs.getString("b_bookId")%>"	class="btn btn-warning" role="button">수정 &raquo;</a>
					<%
						} else if (edit.equals("delete")) {
					%>
				<a href="#" onclick="deleteConfirm('<%=rs.getString("b_bookId")%>')" class="btn btn-danger" role="button">도서 삭제 &raquo;</a>
					<%
						}
					%>
				<br><br><br>								
			</div>
			<%
				}
				if (rs != null) rs.close();
	 			if (pstmt != null) pstmt.close();
	 			if (conn != null) conn.close();
	 		%>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>