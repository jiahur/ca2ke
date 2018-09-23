<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../assets/css/bootstrap.min.css"/>
<style type="text/css">
.form_group {
	padding: 30px;
	border-bottom: 1px dotted #ccc;
}
</style>
</head>
<body>
<div class="section">
	<div class="container recontainer">
	<form action="../item/itemAdd" method="post" name="itemAddForm" enctype="multipart/form-data">
	<div id="input">
		<div>
			<h3>상품 등록하기</h3>
			<br /><br />
		</div>
		<hr />
		<div class="form_group">
		<label id="category" for="i_category"></label>
		<select id ="category_list" name="i_category">
			<option selected>--- 선택하세요 ---</option>
			<option value="1">케이크</option>
			<option value="2">마카롱</option>
			<option value="3">커피</option>
		</select>
		</div>
		<div class="form_group">
			<label for="img">상품 이미지</label>
			<br />
			<input type="file" name="img">
		</div>
		<div class="form_group">
			<label for="item_name">상품명</label>
			<br />
			<input type="text" name="item_name">
		</div>
		<div class="form_group">
			<label for="item_price">아이템 가격</label>
			<br />
			<input type="text" name="item_price">
		</div>
		<div class="form_group">
			<label for="item_desc">아이템 설명</label>
			<br />
			<textarea name="item_desc" cols="100" rows="10"></textarea>
		</div>	
		<br />
		<div style="text-align: right;">
			<input type="submit" value="상품등록" class="btn btn-primary">
			<input type="reset" value="다시작성" class="btn btn-default">
		</div>
	</div>
	</form>
	</div>
</div>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
</body>
</html>