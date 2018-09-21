<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>      

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<link rel="stylesheet" href="../assets/css/itemList.css">
<script type="text/javascript"src="../assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../assets/js/script/itemAdd.js"></script>


</head>
<body>
<div class="section">
	<div class="container">

			<c:if test="${totalA!=0 }"> <!-- if -->
			<ul class="itemlist">
				<c:forEach var="itemDTO" items="${list}">
						<li>
							<span><img class="item_image" src="../storage/${itemDTO.item_image}" alt="이미지없음"></span>	
							<%-- <span class="item_name"><strong>${itemDTO.item_name}</strong></span> --%>
						    
							<span class="hidden_layer">
								<span class="hidden_form">
									<span class="item_num">${itemDTO.item_num }</span>
									<label class="item_name">${itemDTO.item_name}</label>
									<input type="button" class="minus" value="-">
									<span class="item_qty">1</span>
									<input type="button" class="plus" value="+">
									<span class="item_price" data-default="${itemDTO.item_price}">${itemDTO.item_price}</span>
									<input type="button" class="item_add" value="추가">
								</span>
							</span>
							
						</li>
						
				</c:forEach>
				
				
				<c:if test="${sessionScope.admin==1}">
				<li>
					<a href="itemAddForm?category=${param.category }"><img class="item_image" src="../img/plus.jpg" alt="상품추가" width="100" height="100"></a>
				</li>
				</c:if>
				
				
			</ul>
			<jsp:include page="../item/buyList.jsp"/>
			</c:if><!-- if end -->
			

			<c:if test="${totalA==0 &&sessionScope.admin==1}">
			<ul class="itemlist">
				<!-- 관리자일때만 아이템 추가 버튼 생성 -->
				<li>
					<a href="itemAddForm?category=${param.category }"><img class="item_image" src="../img/plus.jpg" alt="상품추가" width="100" height="100"></a>
				</li>
			</ul>
			</c:if>
			<c:if test="${totalA==0 &&sessionScope.admin!=1}">
				
					<ul id="item_empty">
						<li>
							<span>등록된 상품이 없습니다.</span>
						</li>
					</ul>
			</c:if>
	</div>
</div>
</body>
</html>