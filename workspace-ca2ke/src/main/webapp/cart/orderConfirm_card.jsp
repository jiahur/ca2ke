<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 완료 화면 - 카드</title>
<link rel="stylesheet" href="../assets/css/common.css" />
<link rel="stylesheet" href="../assets/css/order_confirm.css" />
</head>
<body>
	<div class="container">
		<div class="content">
			<img src="../image/o_confirm.PNG" alt="결제완료이미지"><br>
			<p id="alert">결제 완료된 주문은 취소하실 수 없습니다.</p>
			<table class="confirm">
				<tr>
					<td class="td1">주문 상품</td>
					<td class="td1">결제 금액</td>
				</tr>
				
				<c:forEach var="buyItem" items="${buyList }">
					<tr>
						<td class="td2">${buyItem.item_name}</td>
						<td class="td2">${buyItem.item_tot }원</td>
					</tr>
				</c:forEach>
				
				<tr>
					<td class="td1">총 결제 금액</td>
					<td class="td2">(${bank}카드) ${sum }원</td>
				</tr>
				
			</table>
		</div>
		<div class="button_group">
			<input type="button" class="btn-primary" value="주문내역 보기">
			<input type="button" value="홈" class="btn-default" onclick="location.href='../main/index.jsp'">
		</div>
	</div>
</body>
</html>