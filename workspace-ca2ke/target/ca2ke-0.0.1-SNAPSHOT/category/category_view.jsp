<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<link rel="stylesheet" href="../assets/css/bootstrap.min.css"/>
</head>
<body>
	<div id="header" align="center">
		<h1>카테고리 관리</h1>
	</div>

	<button class="btn btn-info" onclick="location.href='category/addCategory.jsp'">
		+ 새로운 카테고리 추가
	</button>
	<br/>
	<table class="table">
		<thead>
			<tr>
				<th scope="col">#</th>
				<th scope="col">카테고리명</th>
				<th scope="col">마크</th>
				<th scope="col">상태</th>
				<th scope="col"></th>
			</tr>
		</thead>
		<c:forEach var="dto" items="${list}">
			<tr>
				<td>${dto.i_category}</td>
				<td>${dto.category_name}</td>
				<td>
					<img 
						src="storage/${dto.category_image}" 
						alt="이미지"
						style="width:80px;height:80px;"
					/>
				</td>
				<td>${dto.category_ongoing}</td>
				<td>
					<form action="updateCategoryForm" method="post">
						<input type="hidden" name="req" value="${dto.i_category}"/>
						<input type="submit" class="btn btn-default" value="수정"/>
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>