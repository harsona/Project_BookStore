<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@700&family=Gowun+Dodum&display=swap" rel="stylesheet">
<title>회원 정보</title>
</head>
<body>
	<jsp:include page="/header.jsp" />
	<div class="jumbotron bg-warning">
		<div class="container">
			<h1 class="display-3">회원정보</h1>
		</div>
	</div>

	<div class="container" align="center">
		<%
			String msg = request.getParameter("msg");

			if (msg != null) {
				if (msg.equals("0"))
					out.println(" <h2 class='alert alert-warning'><br>회원정보가<br><br>수정되었습니다.<br><br></h2>");
				else if (msg.equals("1"))
					out.println(" <h2 class='alert alert-warning'><br>회원가입을<br><br>축하드립니다.<br><br></h2>");
				else if (msg.equals("2")) {
					String loginId = (String) session.getAttribute("sessionId");
					out.println("<br><h2 class='alert alert-warning'>" + loginId + "님<br><br>환영합니다<br><br></h2>");
				}				
			} else {
				out.println("<h2 class='alert alert-warning'><br>회원정보가<br><br>삭제되었습니다.<br><br></h2>");
			}
		%>
	</div>	
</body>
</html>