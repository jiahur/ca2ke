<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="/ca2ke/assets/css/bootstrap.min.css"/>
<style type="text/css">
#glayLayer {
	display: none; position: fixed; left: 0; top:0;
	height: 20%; width:100%; background: black;
	filter: alpha(opacity=60); opacity: 0.60;
}

#overLayer {
	display:none; position:fixed; top:20%; left:25%; 
	width: 50%; height: 80%;
	margin-top: auto; margin-left: auto;
	overflow: auto;
}
</style>
</head>
<body>
	<div id="glayLayer"></div><div id="overLayer"></div>

    <div class="container">
		<div id="header" align="center" style="padding:50px;">
			<h1>관리 페이지</h1>
		</div>
	
		<ul class="nav nav-tabs" id="myTab" role="tablist">
		  <c:if test="${tab =='admin_member.jsp'}">
			  <li class="nav-item">
				<a class="nav-link active" id="member-tab" data-toggle="tab" href="/ca2ke/admin/tab_member" role="tab" aria-controls="member" aria-selected="true">회원관리</a>
			  </li>
		  </c:if>
		  <c:if test="${tab !='admin_member.jsp'}">
			  <li class="nav-item">
				<a class="nav-link" id="member-tab" data-toggle="tab" href="/ca2ke/admin/tab_member" role="tab" aria-controls="member" aria-selected="false">회원관리</a>
			  </li>
		  </c:if>
		  <c:if test="${tab == 'admin_item.jsp'}">
			  <li class="nav-item">
				<a class="nav-link active" id="item-tab" data-toggle="tab" href="/ca2ke/admin/tab_item" role="tab" aria-controls="item" aria-selected="true">상품관리</a>
			  </li>
		  </c:if>
		  <c:if test="${tab != 'admin_item.jsp'}">
			  <li class="nav-item">
				<a class="nav-link" id="item-tab" data-toggle="tab" href="/ca2ke/admin/tab_item" role="tab" aria-controls="item" aria-selected="false">상품관리</a>
			  </li>
		  </c:if>
		  <c:if test="${tab == 'admin_order'}">
			  <li class="nav-item">
				<a class="nav-link active" id="order-tab" data-toggle="tab" href="/ca2ke/admin/tab_order" role="tab" aria-controls="order" aria-selected="true">주문관리</a>
			  </li>
		  </c:if>
		  <c:if test="${tab != 'admin_order'}">
			  <li class="nav-item">
				<a class="nav-link" id="order-tab" data-toggle="tab" href="/ca2ke/admin/tab_order" role="tab" aria-controls="order" aria-selected="false">주문관리</a>
			  </li>
		  </c:if>
		  <c:if test="${tab == 'admin_account'}">
			  <li class="nav-item">
				<a class="nav-link active" id="account-tab" data-toggle="tab" href="/ca2ke/admin/tab_account" role="tab" aria-controls="account" aria-selected="true">매출관리</a>
			  </li>
		  </c:if>
		  <c:if test="${tab != 'admin_account'}">
			  <li class="nav-item">
				<a class="nav-link" id="account-tab" data-toggle="tab" href="/ca2ke/admin/tab_account" role="tab" aria-controls="account" aria-selected="false">매출관리</a>
			  </li>
		  </c:if>
		  <c:if test="${tab == 'admin_manager'}">
			  <li class="nav-item">
				<a class="nav-link active" id="manager-tab" data-toggle="tab" href="/ca2ke/admin/tab_manager" role="tab" aria-controls="manager" aria-selected="true">관리자</a>
			  </li>
		  </c:if>
		  <c:if test="${tab != 'admin_manager'}">
			  <li class="nav-item">
				<a class="nav-link" id="manager-tab" data-toggle="tab" href="/ca2ke/admin/tab_manager" role="tab" aria-controls="manager" aria-selected="false">관리자</a>
			  </li>
		  </c:if>
		</ul>

		<div id="admin-content">
			<jsp:include page="${display}"/>
		</div>
		
		
		
		<div>
			<jsp:include page="${tab}"/>
		</div>
	</div>
</body>
</html>