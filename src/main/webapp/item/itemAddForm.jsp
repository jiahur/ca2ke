<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="../assets/css/itemAddForm.css">


</head>
<body>
<div class="section">
	<div class="container">
	<form action="itemAdd" method="post" name="itemAddForm" enctype="multipart/form-data">
	<div id="input">
		<h3 id="category">ī�װ�</h3>
		<select id ="category_list" name="i_category">
			<option selected>--- �����ϼ��� ---</option>
			<option value="1">����ũ</option>
			<option value="2">��ī��</option>
			<option value="3">Ŀ��</option>
		</select>
		<h3>������ �̹���</h3>
		<input type="file" name="img">
		<h3>��ǰ��</h3>
		<input type="text" name="item_name">
		<h3>������ ����</h3>
		<input type="text" name="item_price">
		<h3>������ ����</h3>
		<textarea name="item_desc" cols="100" rows="10"></textarea>
		
		<input type="submit" value="��ǰ���" class="myButton">
		<input type="reset" value="�ٽ��ۼ�" class="myButton">
	</div>
	</form>
	</div>
</div>
</body>
</html>