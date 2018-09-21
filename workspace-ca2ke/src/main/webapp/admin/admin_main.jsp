<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="../assets/css/admin_common.css"/>
</head>
<body>
    <div class="container">
		<div id="header">
			<h1>관리자페이지</h1>
		</div>
		<div id="nav">
			<ul>
				<li><a href="">회원관리</a></li>
				<li><a href="">상품관리</a></li>
				<li><a href="">주문관리</a></li>
				<li><a href="">매출관리</a></li>
			</ul>
		</div>
		<div id="section">
			<jsp:include page="admin_item.jsp"/>
		</div>
		<div id="footer">
			
		</div>
	</div>
</body>
</html>