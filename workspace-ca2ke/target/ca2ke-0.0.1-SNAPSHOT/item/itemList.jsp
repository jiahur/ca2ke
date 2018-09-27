<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>      
<%

	int admin = 1;

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="../css/itemList.css">


</head>
<body>
<div class="section">
	<div class="container">
			<ul class="itemlist">
			<c:if test="${totalA!=0 }"> <!-- if -->
				<c:set var="i" value="0"/>
				<!-- ������ ����Ʈ ��� -->
				<c:forEach var="itemDTO" items="${list}">

					<c:if test="${i%4==0 &&i!=0 }">
					</ul><ul class="itemlist">
					</c:if>
						<li>
							<span><img class="item_image" src="../storage/${itemDTO.item_image}" alt="${param.category }"></span>	
							<span><strong>${itemDTO.item_name}</strong></span>
						</li>
					<c:set var="i" value="${i+1}"/>
				</c:forEach>
			</c:if><!-- if end -->
			

			
			<%if(admin==1) {%>
				<!-- �������϶��� ������ �߰� ��ư ���� -->
				<li>
					<a href="../item/itemAddForm?category=${param.category }"><img class="item_image" src="../image/plus.jpg" alt="��ǰ�߰�" width="100" height="100"></a>
				</li>

			<%}else{ %>
				<c:if test="${totalA==0 }">
					<ul id="item_empty">
						<li>
							<span>��ϵ� ��ǰ�� �����ϴ�.</span>
						</li>
					</ul>
				</c:if>
			<%} %>
			</ul>

	</div>
</div>
</body>
</html>