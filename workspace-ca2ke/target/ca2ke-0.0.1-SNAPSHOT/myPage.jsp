<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../assets/css/common.css"/>
<link rel="stylesheet" href="../assets/css/myPage.css"/>
</head>
<body>
    <div class="container">
    <div class="title">마이페이지</div>
    	<div id="myPage_menu" class="menu">
		<ul>
		    <li><a href="#">회원정보수정</a></li>
		    <li><a href="#">구매내역</a></li>
		    <li><a href="..//main/cart">장바구니</a></li>
		    <li><a href="#">회원탈퇴</a></li>
		</ul>
	    </div>
	    <!-- 
	    <c:if test="${display == null}"></c:if>		메뉴선택시 디스플레이 include 예정
	     -->
		<div class="content">	
		    <div id="thum">
			<ul>
			    <li><a href="#">
			    	<div>
			    		<img src="../img/myPage_icon1.png" alt="" style="width:120px; height:120px;"/><br />
			    		<span class="thum_detail">0 <br /> 주문리스트<br /></span>
			    	</div>
			    </a></li>
			    
			    
			    <li><a href="#">
			  		<div>
			   	 		<img src="../img/myPage_icon2.png" alt="" style="width:120px; height:120px;"/><br />
			   	 		<span class="thum_detail">0 <br /> 구매내역<br /></span>
			  	    </div>
			    </a></li>
			    
			    
			    <li><a href="#">
			    	<div>
			    		<img src="../img/myPage_icon3.png" alt="" style="width:120px; height:120px;"/><br />
			    		<span class="thum_detail">0 <br /> 장바구니<br /></span>
			    	</div>
			    </a></li>
			    
			    
			    <li><a href="#">
			    	<div>
			    		<img src="../img/myPage_icon4.png" alt="" style="width:120px; height:120px;"/><br />
			    		<span class="thum_detail">0 <br /> 회원탈퇴<br /></span>
			    	</div>
			    </a></li>
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
	    
    </div>
</body>
</html>