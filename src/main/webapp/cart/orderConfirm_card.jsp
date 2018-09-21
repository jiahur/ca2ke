<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 완료 화면 - 카드</title>
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
	div#orderCfm_inner p#alert{
		text-align: center;
		color: red;
		font-weight: bold;
	}

</style>
</head>
<body>
	<div id="orderCfm">
		<div id="orderCfm_inner">
			<img src="../img/cart/o_confirm.PNG" alt="결제완료이미지"><br>
			<p id="alert">결제 완료된 주문은 취소하실 수 없습니다.</p>
			<table border="1">
				<tr>
					<td>주문 상품</td>
					<td>결제 금액</td>
				</tr>
				
				<c:forEach var="buyItem" items="${buyList }">
					<tr>
						<td>${buyItem.item_name}</td>
						<td>${buyItem.item_tot }원</td>
					</tr>
				</c:forEach>
				
				<tr>
					<td>총 결제 금액</td>
					<td>(${bank}카드) ${sum }원</td>
				</tr>
				
			</table>
			<input type="button" value="주문내역 보기">
			<input type="button" value="홈" onclick="location.href='../main/index.jsp'">
		</div>
	</div>
</body>
</html>