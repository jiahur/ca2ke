<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../assets/css/translateelement.css">
<link rel="stylesheet" href="../assets/css/colorbox.css">
<link rel="stylesheet" href="../assets/css/common.css">
<link rel="stylesheet" href="../assets/css/font.css">
<link rel="stylesheet" href="../assets/css/style.css">
<script type="text/javascript" src="../assets/js/script/idnpwFind.js"></script>
</head>
<body>
<div class="sub-contents-container"> 
	<div class="global-section sub-contents">
		<div class="sub-contents-box">
       	<ul class="tab-list-box column2">
       		<li><button type="button" class="btn-tab-item on"onclick="javascript:location='findIdForm';">아이디 찾기</button></li>
        	<li><button type="button" class="btn-tab-item"onclick="javascript:location='findPwForm';">비밀번호 찾기</button></li>
        </ul>
			<div class="tab-contents">
            	<div class="find-idpw-box">
                    <p class="find-idpw-top-text">
            	본인 명의의 이메일로 <span class="t-gray">본인 인증을 통해,</span><br /><span class="t-gray">비밀번호를 확인</span>하실 수 있습니다.
                    </p>
                    <i class="icon-cer-phone"></i>
                    <div class="icon-btn-box">
                    	<a href="#" onclick="pwFind()" class="btn xl font-l black pd-xl">이메일 인증하기</a>
                	</div>
            	</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>