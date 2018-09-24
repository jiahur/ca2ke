<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../assets/css/main.css"/>
<link rel="stylesheet" href="../assets/css/carousel.css"/>
<title></title>
</head>
<body>
   <div class="member">
		<ul>
			<li><a href=""><span>LOGIN</span></a></li>
			<li> | </li>
			<li><a href=""><span>JOIN</span></a></li>
			<li> | </li>
			<li><a href=""><span>CART</span></a></li>
			<li> | </li>
			<li><a href=""><span>MyPage</span></a></li>
		</ul>
	</div>




	<c:if test="${display2 == null}">
	    <div id="nav">
	    	<div class="jcarousel">
				<ul  class="nav_ul">
				    <li><a href="itemList?category=1"><span>
				    	<img src="../img/cake.png" alt="cake" style="width: 60px; height: 90px;"/>
				    	<br/>CAKE
				    </span></a></li>
				    <li><a href="itemList?category=2"><span>
				    	<img src="../img/macaron.png" alt="macaron" style="width: 60px; height: 90px;"/>
				    	<br/>MACARON
				    </span></a></li>
				    <li><a href="itemList?category=3"><span>
				    	<img src="../img/coffee.png" alt="coffee" style="width: 60px; height: 90px;"/>
				    	<br />COFFEE
				    </span></a></li>
				    <li><a href="itemList?category=1"><span>
				    	<img src="../img/cake.png" alt="cake" style="width: 60px; height: 90px;"/>
				    	<br/>CAKE
				    </span></a></li>
				    <li><a href="itemList?category=2"><span>
				    	<img src="../img/macaron.png" alt="macaron" style="width: 60px; height: 90px;"/>
				    	<br/>MACARON
				    </span></a></li>
				    <li><a href="itemList?category=3"><span>
				    	<img src="../img/coffee.png" alt="coffee" style="width: 60px; height: 90px;"/>
				    	<br />COFFEE
				    </span></a></li>
				</ul>				
	            <a href="#" class="jcarousel-control-prev">&lsaquo;</a>
	            <a href="#" class="jcarousel-control-next">&rsaquo;</a>
			</div>
	    </div>
    </c:if>
  
  
  
  
  
  
  
  
  
  
    <div id="section">
		<c:if test="${display != null}">
			<jsp:include page="${display}"/>
		</c:if>
		
		<c:if test="${display2 != null }">
			<jsp:include page="${display2}"/>
		</c:if>
    </div>
    
    
    
    
    
    
    
    
    
       
     <div id="footer">
	     <div class="foot_nav">
	        <ul class="foot_menu" style="min-width: 1600px;">
	            <li class="foot_menu01"><a href="#about" class="link_about"><span>ABOUT</span></a></li>
	            <li class="foot_menu02"><a href="#nav" class="link_cake"><span>CAKE &amp;</span></a></li>
	            <li class="foot_menu03"><a href="#store" class="link_store"><span>STORE</span></a></li>
	            <li class="foot_menu04"><a href="/que/write.do"><span>CONTACT</span></a></li>
	        </ul>
	    </div>
	   	<div class="foot_info">
	        <div class="foot_info_shop">
			            통신판매업신고번호 2017-서울용산-1285
			            제조영업신고 제2017-0033997호
			            <br>
			            생산지주소 서울시 용산구 이태원로26길 16-7, 지층(이태원동) CA2KE
			            연락처 010-4400-3441
			            <br>
			            대표자 윤창석
			            사업자등록번호 651-23-00530
			        상호명 케2크
	              @2015  CAFE CA2KE ALL RIGHTS RESERVED.
	        </div>
        </div>
     </div>
     
<script type="text/javascript" src="../assets/js/jquery.js"></script>
<script type="text/javascript" src="../assets/js/jcarousel/jquery.jcarousel.min.js"></script>
<script type="text/javascript" src="../assets/js/jcarousel/jcarousel.responsive.js"></script>
</body>
</html>