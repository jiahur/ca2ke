<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../assets/js/script/idnpwFind.js"></script>
</head>
<body>
<center>
<br /><br />
<h5>password 찾기</h5>
<div>
	<form method="post" name="FindCheckPw" id="FindCheckPw">
		이메일 :<input type="email" name="m_email" id="m_email"><br /><br />
		아이디 :<input type="text" name="m_id" id="m_id"><br /><br />
		<input type="button" value="확인"  onclick="pwCheckButton()">
	</form>
</div>

</body>
</html>