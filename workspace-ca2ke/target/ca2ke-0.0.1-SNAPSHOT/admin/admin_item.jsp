<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link type="text/css" href="../assets/css/admin_common.css">
<style type="text/css">
table {
	table-layout: fixed;
}

.thum {
	display: inline-block;
	width: 200px;
	height: 150px;
	border: 1px dotted #ccc;
	text-align: center;
	padding-top: 80px;
	color: #0069d9;
	border-radius: 20px;
	font-weight: bold;
	cursor: pointer;
}

.thum:hover {
	background-color: #0069d9;
	color: white;
}
</style>
</head>
<body>
	<div id="wrapper">
		<div class="admin_list">
			<table>
				<tr>
					<td><div class="thum" onclick="location.href='../item/addCategory.jsp'">카테고리 <br> 추가하기</div></td>
				
					<td><div class="thum"></div></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>