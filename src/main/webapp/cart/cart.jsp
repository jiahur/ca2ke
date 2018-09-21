<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
</head>
<script type="text/javascript" src="../assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(".changeBtn").click(function(){
			var cart_num = $("#cart_num").val();
			var item_qty = $("#item_qty").val();
			var item_num= $("#item_num").val();
			location.href="changeQty?cart_num="+cart_num+"&item_qty="+item_qty+"&item_num="+item_num;
		});
		
		$(".deleteBtn").click(function(){
			var cart_num = $("#cart_num").val();
			location.href="deleteCart?cart_num="+cart_num;
		});
		
		if(${change_result==1}){
			alert("주문 수량이 수정되었습니다.");
		}
		if(${delete_result==1}){
			alert("선택하신 주문이 삭제되었습니다.");
		}
	});
</script>
<body>
	<div id="cart">
		<h2>장바구니</h2>
		<div id="cartNotice">
			<span>· 상품정보가 변경된 경우 주문이 불가할 수 있습니다. 주문 변경 시 반드시 확인해주시길 바랍니다.</span>
		</div>
		<form id="cartTable" method="post" action="orderReady">
		    <input type="hidden" name="m_id" value="${sessionScope.m_id }">
		    <input type="hidden" name="m_name" value="${sessionScope.m_name }">
			<table border="1">
				<tr>
					<td colspan="2">상품 정보</td>
					<td>수량</td>
					<td>상품금액</td>
					<td>픽업날짜</td>
					<td>주문금액</td>
				</tr>
				
				<c:forEach var="dto" items="${cartList}">
					<tr>
						<td><img src="../img/cart/marker.png" alt="상품이미지"></td>
						<td>${dto.item_name }</td>
						<td>
							<input type="hidden"  id="cart_num" value="${dto.cart_num }">
							<input type="hidden"  id="item_num" value="${dto.item_num }">
							<input type="text" id="item_qty" value="${dto.item_qty }"><br>
							<input type="button" class="changeBtn" value="개수 수정">
						</td>	
						<td>${dto.item_price }원</td>
						<td>${dto.p_request_date } &nbsp;/&nbsp; ${dto.p_request_time}</td>
						<td>
							${dto.item_tot }원<br>
							<input type="button" class="deleteBtn" value="삭제"> <!--장바구니# 기준으로 삭제  -->
						</td>
					</tr>
					<c:set var="sum" value="${sum+dto.item_tot }"/>
				</c:forEach>
				
				<tr>
					<td colspan="4"></td>
					<td>결제금액</td>
					<td>${sum }원</td>
				</tr>
			</table>
			<div id="buttonLine">
				<input type="submit" value="주문하기">
				<input type="button" value="홈" onclick="history.back();">
			</div>
		</form>
	</div>
</body>
</html>