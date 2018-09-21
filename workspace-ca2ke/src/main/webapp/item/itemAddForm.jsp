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
			<h3>��ǰ ����ϱ�</h3>
			<br /><br />
		</div>
		<hr />
		<div class="form_group">
		<label id="category" for="i_category"></label>
		<select id ="category_list" name="i_category">
			<option selected>--- �����ϼ��� ---</option>
			<option value="1">����ũ</option>
			<option value="2">��ī��</option>
			<option value="3">Ŀ��</option>
		</select>
		</div>
		<div class="form_group">
			<label for="img">��ǰ �̹���</label>
			<br />
			<input type="file" name="img">
		</div>
		<div class="form_group">
			<label for="item_name">��ǰ��</label>
			<br />
			<input type="text" name="item_name">
		</div>
		<div class="form_group">
			<label for="item_price">������ ����</label>
			<br />
			<input type="text" name="item_price">
		</div>
		<div class="form_group">
			<label for="item_desc">������ ����</label>
			<br />
			<textarea name="item_desc" cols="100" rows="10"></textarea>
		</div>	
		<br />
		<div style="text-align: right;">
			<input type="submit" value="��ǰ���" class="btn btn-primary">
			<input type="reset" value="�ٽ��ۼ�" class="btn btn-default">
		</div>
	</div>
	</form>
	</div>
</div>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
</body>
</html>