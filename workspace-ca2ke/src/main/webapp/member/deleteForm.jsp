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
<script type="text/javascript" src="../assets/js/script/modifyViewcScript.js"></script>
<script type="text/javascript" src="../assets/js/script/deleteScript.js"></script>
<style>
.form-select-sign {
    display: inline-block;
    vertical-align: middle;
    box-sizing: border-box;
    border: 1px solid #ccc;
    width: 20%;
    min-width: 115px;	
}
#divcenter > button{
margin-left: 220px;
margin-top: 80px;
}
</style>
</head>
<body>
<div id="divcenter">
<form action="delete" name="delete" id="delete" method="post">
<!-- sub page contents -->
<div class="sub-contents-container">
	<div class="global-section sub-contents">
		<div class="sub-contents-box">
            <div class="form-box">  
	            <table class="form-table">
	           		<tbody>
	                    <tr>
	                    	<th scope="row"><label>현재비밀번호 입력 : </label> <span class="t-green"></span></th>
	                        <td>
	                        	<div class="input-box">
									<div class="mobile-block">
	                                	<input type="password" id="m_pwd" name="m_pwd" class="input l"/>
	                                </div>
									<div class="mobile-block">
										<span class="input-guide-text inline t-gray"></span>
									</div>
								</div>
	                        </td>
	                    </tr>
	                 
	         		 </tbody>
	      		</table>
  			</div>
		</div>
	</div>
</div>
</form>
</div>
</body>
</html>