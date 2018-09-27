<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="../assets/css/bootstrap.min.css"/>
</head>
<body>
	<div style="padding: 50px;"><h3>관리자 생성</h3></div>
	<form action="../managerAdd" method="post">
		  <div class="form-group">
		    <label for="a_name">관리자이름</label>
		    <input type="text" class="form-control" name="a_name" required="required"/>
		  </div>
		  <div class="form-group">
		    <label for="a_id">관리자 아이디</label>
		    <input type="text" class="form-control" id="a_id" 
		    	name="a_id" required="required" onchange="checkManagerId()"/>
		    <span class="a_id_info">반드시 아이디는 "admin"으로 시작해야 합니다.</span>
		  </div>
		  <div class="form-group">
		    <label for="tmp_pwd">관리자패스워드</label>
		    <input type="password" class="form-control" name="tmp_pwd" required="required"/>
		  </div>
		  <div class="form-group">
		    <label for="a_pwd">관리자패스워드</label>
		    <input type="password" class="form-control" name="a_pwd" required="required"/>
		    <span class="a_pwd_info"></span>
		  </div>

		   
		  <div align="right">
		  	<input type="submit" class="btn btn-primary" value="생성"/>
		  	<input type="reset" value="다시작성" class="btn btn-default"/>
		  </div>
	</form>

<script type="text/javascript" src="/ca2ke/assets/js/jquery.js"></script>
<script type="text/javascript">
	function checkManagerId(id) {
		
	}
	$(function () {
		$("#a_id").change(function () {
			
		});
	});
</script>
</body>
</html>