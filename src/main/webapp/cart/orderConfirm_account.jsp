<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 완료 화면 - 무통장 입금</title>
<style type="text/css">
	*{
	}
	div#orderCfm{
		width: 100%;
		margin: 0 auto;
	}
	div#orderCfm_inner{
		width: 850px;
		height: 500px;
		margin: 0 auto;
		align-content: center;
	}
	table#message #notice{
		text-align: center;
		color: red;
		font-weight: bold;
	}
</style>
</head>
<body>
	<div id="orderCfm">
		<div id="orderCfm_inner">
			<img src="../img/cart/o_confirm_a.png" alt="결제완료이미지"><br>
			
			<table id="message" border="1">
				<tr>
					<td>주문자명</td>
					<td>${sessionScope.m_name }님</td>
				</tr>
				<tr>
					<td>입금 정보</td>
					<td>${bank }&nbsp;&nbsp; 계좌번호: ${account_num } &nbsp;&nbsp;입금액: ${sum }원</td>
				</tr>
				<tr>
					<td colspan="2" id="notice">입금이 완료되면 주문을 취소하실 수 없습니다.</td>
				</tr>
			</table>
			<br>
			<br>
			
			<table id="detail" border="1">
				<tr>
					<td>주문 상품</td>
					<td>주문 금액</td>
				</tr>
				
				<c:forEach var="buyItem" items="${buyList }">
					<tr>
						<td>${buyItem.item_name}</td>
						<td>${buyItem.item_tot }원</td>
					</tr>
				</c:forEach>
				
				<tr>
					<td>총 주문 금액</td>
					<td>${sum }원</td>
				</tr>
			</table>
			
			<input type="button" value="주문내역 보기">
			<input type="button" value="홈" onclick="location.href='../main/index.jsp'">
		</div>
	</div>
</body>
</html>