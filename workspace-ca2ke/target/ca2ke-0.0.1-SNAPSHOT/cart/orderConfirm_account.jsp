<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 완료 화면 - 무통장 입금</title>
<link rel="stylesheet" href="../assets/css/common.css"/>
<link rel="stylesheet" href="../assets/css/order_confirm.css"/>
</head>
<body>
		<div class="container">
			<div class="content">
				<img src="../image/o_confirm_a.png" alt="결제완료이미지"><br>
				
				<table class="confirm">
					<tr>
						<td class="td1">주문자명</td>
						<td class="td2">${sessionScope.m_name }님</td>
					</tr>
					<tr>
						<td class="td1">입금정보</td>
						<td class="td2">
							${bank }&nbsp;&nbsp; 계좌번호: ${account_num } &nbsp;&nbsp;입금액: ${sum }원
						</td>
					</tr>
					<tr>
						<td class="td1">주문상품</td>
						<td class="td2">${buyItem.item_name}</td>
					</tr>
					<tr>
						<td class="td1">주문금액</td>
						<td class="td2">${sum }원</td>
					</tr>
				</table>
			</div>
			<div class="button_group">
				<input type="button" value="주문내역 보기" class="btn-primary">
				<input type="button" value="홈" class="btn-default" onclick="location.href='../main/index.jsp'">
			</div>
		</div>
</body>
</html>