<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="assets/css/common.css">
</head>
<body>
    <div class="container">
    	<div id="myPage_menu">
		<ul>
		    <li><a href="#">주문조회</a></li>
		    <li><a href="#">위시리스트</a></li>
		    <li><a href="#">취소/교환/환불</a></li>
		    <li><a href="#">쿠폰</a></li>
		    <li><a href="#">포인트</a></li>
		    <li><a href="#">1:1 문의</a></li>
		    <li><a href="#">정보 수정</a></li>
		</ul>
	    </div>
	
	    <div id="thum">
		<ul>
		    <li><a href="#"><div></div></a></li>
		    <li><a href="#"><div></div></a></li>
		    <li><a href="#"><div></div></a></li>
		    <li><a href="#"><div></div></a></li>
		</ul>	
	    </div>
	
	    <div id="detail">
		<h3>주문조회</h3>
		<table class="table_list">
		    <tr>
			<td class="table_title table_1">주문번호</td>
			<td class="table_title table_2">item</td>
			<td class="table_title table_3">결제금액</td>
			<td class="table_title table_4">주문상태</td>
		    </tr>
		</table>
	    </div>
    </div>
</body>
</html>