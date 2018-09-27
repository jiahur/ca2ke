<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.card {
		display: inline-block;
	}
</style>
</head>
<body>
	<div class="card" style="width: 20rem;">
			  <div class="card-body">
				<h4 class="card-title">카테고리 추가</h4>
				<p class="card-text">상품 카테고리 <br/>(e.g. cake/marcaroon/coffee...) 
				  <br/>새롭게 추가하기!</p>
				<a href="../addCategoryForm" class="btn btn-info">바로가기</a>
			  </div>
	</div>
			
	<div class="card" style="width: 20rem;">
			  <div class="card-body">
				<h4 class="card-title">카테고리 수정</h4>
				<p class="card-text">이미 등록된 상품 카테고리 <br/>이미지마크, 활성화상태, 세부사항
				  <br/>변경하기!</p>
				<a href="../category_view" class="btn btn-info">바로가기</a>
			  </div>
	</div>
</body>
</html>