<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문/결제</title>
<script type="text/javascript" src="../assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		//결제방법 선택
		$("input[type='radio']:eq(0)").change(function(){
			$("#paymentDetail").empty();
		    $("#paymentDetail").load("../cart/paymentDetail.jsp #card", function(){
		    	$(this).show();
		    	//한글 깨질 경우 server.xml의 Connector connectionTimeout라인에 URIEncoding="UTF-8" 추가할 것
		    });
		});
		
		$("input[type='radio']:eq(1)").change(function(){
			$("#paymentDetail").empty();
		    $("#paymentDetail").load("../cart/paymentDetail.jsp #account", function(){
		    	$(this).show();
		    });
		});
		
		
		//결제하기 버튼 클릭 시 입력값 검사
		$("input[type='button']:eq(1)").click(function(){
			if (!$("input[name='paymentType']").is(":checked")){
				alert("결제 방법을 선택해주세요.");
				$("input[name='paymentType']:eq(0)").focus();
				return false;
			}
			if ($("#paymentDetail input[name='cardType'").length){
				
				if (!$("#paymentDetail input[name='cardType']").is(":checked")){
					alert("카드 구분을 선택해주세요.");
					$("#paymentDetail input[name='cardType']:eq(0)").focus();
					return false;
				}
			}
			if ($("#paymentDetail select option:selected").index()==0){
				alert("세부사항을 선택해주세요.");
				$("#paymentDetail select option:eq(0)").focus();
				return false;
			} else if ($("#paymentDetail select option:selected").index()>0){ //카드/은행명 전달
				var bank = $("#paymentDetail select option:selected").text();
				$("#bank").val(bank);
			}
			
			if (!$("input[type='checkbox']:eq(0)").is(":checked")){
				alert("결제 진행을 동의해주세요.");
				$("input[type='checkbox']:eq(0)").focus();
				return false;
			}
			
			$("#orderReady").submit();
		});
	});
</script>
</head>
<body>
	<h2>주문/결제</h2>
	<div id="cart">
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
							${dto.item_qty }<br>
						</td>	
						<td>${dto.item_price }원</td>
						<td>${dto.p_request_date } &nbsp;/&nbsp; ${dto.p_request_time}</td>
						<td>
							${dto.item_tot }원<br>
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
	</div>
	
	<div id="memberInfo">
		<h2>주문자 정보</h2>
		<label>회원이름</label><span>${memberDTO.m_name }</span><br>
		<label>핸드폰번호</label><span>${memberDTO.m_phone }</span><br>
		<input type="button" value="정보수정">
	</div>
	
	<form id="orderReady" method="post" action="orderConfirm">
		<input type="hidden" name="m_id" value="${sessionScope.m_id }">
		<input type="hidden" name="sum" value="${sum }">
		<div>
			<h3>결제방법 선택</h3>
				<label><input type="radio" name="paymentType" id="paymentType" value="card">신용카드</label>
				<label><input type="radio" name="paymentType" id="paymentType" value="account">무통장입금</label>
			
			<div id="paymentDetail"><label id="default"></label></div>  <!--jquery로 출력  -->
			<input type="hidden" name="bank" id="bank" value="">
			
			<label><input type="checkbox" name="orderOk" id="orderOk">결제 진행 동의</label><br>
			<input type="button" value="결제하기">
			<input type="button" value="홈" onclick="">
		</div>
	</form>
</body>
</html>