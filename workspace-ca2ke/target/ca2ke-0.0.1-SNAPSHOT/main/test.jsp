<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		session.setAttribute("m_id", "num1");
		session.setAttribute("m_name", "홍길동");
	%>
	
	<a href="../cart/cart">장바구니 이동</a>
	<a href="../order/">주문 관리</a>
</body>
</html>