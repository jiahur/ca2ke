<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="../assets/css/bootstrap.min.css"/>
</head>
<body>
    <div class="container">
		<div id="header" align="center" style="padding:50px;">
			<h1>KYERI 관리 페이지</h1>
		</div>
	
		<ul class="nav nav-tabs" id="myTab" role="tablist">
		  <li class="nav-item">
			<a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">회원관리</a>
		  </li>
		  <li class="nav-item">
			<a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">상품관리</a>
		  </li>
		  <li class="nav-item">
			<a class="nav-link" id="messages-tab" data-toggle="tab" href="#messages" role="tab" aria-controls="messages" aria-selected="false">주문관리</a>
		  </li>
		  <li class="nav-item">
			<a class="nav-link" id="settings-tab" data-toggle="tab" href="#settings" role="tab" aria-controls="settings" aria-selected="false">매출관리</a>
		  </li>
		</ul>


		
		
		
		<div class="tab-content">
		  <div class="tab-pane active" id="home" role="tabpanel" aria-labelledby="home-tab">
			

			<div class="card" style="width: 20rem;">
			  <div class="card-body">
				<h4 class="card-title">카테고리 추가</h4>
				<p class="card-text">상품 카테고리 <br/>(e.g. cake/marcaroon/coffee...) 
				  <br/>새롭게 추가하기!</p>
				<a href="../category/addCategory.jsp" class="btn btn-info">바로가기</a>
			  </div>
			</div>
			
			<div class="card" style="width: 20rem;">
			  <div class="card-body">
				<h4 class="card-title">카테고리 수정</h4>
				<p class="card-text">이미 등록된 상품 카테고리 <br/>이미지마크, 활성화상태, 세부사항
				  <br/>변경하기!</p>
				<a href="../category/category_view.jsp" class="btn btn-info">바로가기</a>
			  </div>
			</div>
			
		  </div>
		  <div class="tab-pane" id="profile" role="tabpanel" aria-labelledby="profile-tab">...</div>
		  <div class="tab-pane" id="messages" role="tabpanel" aria-labelledby="messages-tab">...</div>
		  <div class="tab-pane" id="settings" role="tabpanel" aria-labelledby="settings-tab">...</div>
		</div>
	</div>
	
<script type="text/javascript" src="../assets/js/jquery.js"></script>
<script type="text/javascript" src="../assets/js/popper.min.js"></script>
<script type="text/javascript" src="../assets/js/bootstrap.min.js"></script>
</body>
</html>