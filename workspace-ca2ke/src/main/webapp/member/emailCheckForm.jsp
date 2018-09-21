<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../assets/css/font.css" />
<link rel="stylesheet" href="../assets/css/common.css" />
<link rel="stylesheet" href="../assets/css/style.css" />
<link rel="stylesheet" href="../assets/css/resolution.css" media="only screen and (-webkit-min-device-pixel-ratio: 3)" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"/>
<script type="text/javascript" src="../assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../script/deleteScript.js"></script>
<script type="text/javascript" src="../script/modifyViewcScript.js"></script>
<script type="text/javascript">
	function check(){
		if(document.authSend.authNum.value == ""){
			alert("인증번호를 입력하세요");
			document.authSend.authNum.focus();
		}else if(document.authSend.authNum.value != '${param.authNum}'){
			alert("틀린 인증번호입니다. 다시 입력해주세요.");
			document.authSend.authNum.focus();
		}else if(document.authSend.authNum.value == '${param.authNum}'){
			alert("인증완료");
			opener.document.getElementById("hiddenlabel").value = "인증완료";
			if(opener.document.getElementById("hiddenlabel").value != ""){
			opener.document.joinForm.sendCheckEmail.disabled = true;	
			}
			window.close();
		}
	}
</script>
</head>
<body>
<!-- sub page contents -->
<center>
<br /><br />
<h5>인증번호 7자리를 입력하세요.</h5>
<div>
	<form method="post" name="authSend" id="authSend">
		<input type="text" name="authNum"><br /><br />
		<input type="button" value="확인"  onclick="check()">
	</form>
</div>
</body>
</html>