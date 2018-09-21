<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 관리</title>
<script type="text/javascript" src="../assets/js/jquery-3.3.1.min.js"></script>
</head>
<body>
	<div id="orderlist">
		<table border="1">
			<tr>
				<th>주문번호</th>
				<th>주문일</th>
				<th>주문자명</th>
				<th>연락처</th>
				<th>카테고리</th>
				<th>상품명</th>
				<th>수량</th>
				<th>픽업요청일</th>
				<th>픽업요청시간</th>
				<th>주문준비현황</th>
				<th>픽업시간</th>
			</tr>
			
			<c:forEach var="dto" items="${orderList }">
				<tr>
					<td>${dto.o_num }</td>
					<td>${dto.o_date }</td>
					<td>${dto.m_name }</td>
					<td>${dto.m_phone }</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</c:forEach>
		</table>	
	</div>
</body>
</html>