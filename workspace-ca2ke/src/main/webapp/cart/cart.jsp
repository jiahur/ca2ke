<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link rel="stylesheet" href="../assets/css/common.css"/>
<link rel="stylesheet" href="../assets/css/cart.css"/>
</head>
<body>
	<div class="container">
		<div class="title">장바구니</div>
		<div id="cartNotice">
			<span>· 상품정보가 변경된 경우 주문이 불가할 수 있습니다. 주문 변경 시 반드시 확인해주시길 바랍니다.</span>
		</div>
		
		<form id="cartTable" method="post" action="orderReady">
		    <input type="hidden" name="m_id" value="${sessionScope.m_id }">
		    <input type="hidden" name="m_name" value="${sessionScope.m_name }">
			<table class="cart_table">
				<tr>
					<th class="table1">상품 정보</th>
					<th class="table2">수량</th>
					<th class="table3">상품금액</th>
					<th class="table4">픽업날짜</th>
					<th class="table5">주문금액</th>
				</tr>

				<c:forEach var="dto" items="${cartList}">
					<tr>
						<td>
							<img src="../image/marker.png" alt="상품이미지">
							<section class="comment">
								<h3>${dto.item.name}</h3><br />
								설명입니다 <br />
								설명입니다 <br />
								설명입니다 <br />
							</section>
						</td>
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
					<td class="sum_cart" colspan="6">결제금액 ${sum }원</td>
				</tr>
			</table>
			<div id="buttonLine">
				<input type="submit" class="btn-primary" value="주문하기">
				<input type="button" class="btn-default" value="홈" onclick="history.back();">
			</div>
		</form>
	</div>
	
	
	
	
	
	
	
	
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
</body>
</html>