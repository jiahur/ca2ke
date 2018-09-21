<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
</head>
<body>
	<table>
		<c:forEach var="dto" items="${list}">
			<tr>
				<td>${dto.i_category}</td>
				<td>${dto.category_name}</td>
				<td>${dto.category_image}</td>
				<td>${dto.category_ongoing}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>