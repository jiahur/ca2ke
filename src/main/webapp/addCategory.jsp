<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
</head>
<body>
	<h1>카테고리 추가</h1>
	<br /><hr /><br /><br />
	<form action="">
		  <div class="form-group">
		    <label for="category_name">카테고리명</label>
		    <input type="text" class="form-control" name="category_name" required="required">
		  </div>
		  <div class="form-group">
		    <label for="category_image">카테고리 이미지</label>
		    <input type="file" class="form-control-file" name="category_image" required="required">
		  </div>
		  <div align="center">
		  	<input type="submit" class="btn btn-primary" value="추가"/>
		  	<input type="button" class="btn btn-default" value="취소" onclick="window.close()"/>
		  </div>
	</form>
</body>
</html>