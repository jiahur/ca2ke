<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload=function(){
		if('${m_name}'){
			alert('${m_name}' + "님 ca2ke에 오신걸 환영합니다.");
			location.href="main.jsp";
		}else{
			alert("로그인에 실패하였습니다.다시 시도해주세요.");
			location.href="loginForm.jsp";
		}
	}
</script>
</head>
<body>

</body>
</html>