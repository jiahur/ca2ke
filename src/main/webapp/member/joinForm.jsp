<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script type="text/javascript" src="../assets/js/script/joinScript.js"></script>
<style>
.form-select-sign {
    display: inline-block;
    vertical-align: middle;
    box-sizing: border-box;
    border: 1px solid #ccc;
    width: 20%;
    min-width: 115px;	
}
</style>
</head>
<body>
<form action="join" name="joinForm" id="joinForm" method="post">
<!-- sub page contents -->
<div class="sub-contents-container">
	<div class="global-section sub-contents">
		
		<div class="sub-contents-box">
			<h3 class="contents-title">회원정보 입력</h3>
            <div class="form-box">
            	<p class="essential-text t-green">* 필수 입력 사항입니다.</p>
           
            <table class="form-table">
           		<tbody>
                	<tr>
               			<th scope="row"><label for="memberId">아이디</label> <span class="t-green">*</span></th>
                    	<td>
		                    <div class="input-box">
								<input type="text" id="m_id" name="m_id" placeholder="아이디를 입력해주세요." class="input l" />
								 <button type="button" onclick="checkId()"  class="btn l font-l redwine pd-m" name="checkbutton" id="checkbutton">중복확인</button>
								 
		                    </div>
                        </td>
                    </tr>
                    <tr>
                    	<th scope="row"><label for="memberPass">비밀번호</label> <span class="t-green">*</span></th>
                        <td>
                        	<div class="input-box">
                        	
								<div class="mobile-block">
                                	<input type="password" id="m_pwd" name="m_pwd" class="input l" placeholder="비밀번호를 입력해주세요."/>
                                </div>
                                
								<div class="mobile-block">
									<span class="input-guide-text inline t-gray"></span>
								</div>
								
							</div>
                        </td>
                    </tr>
                    <tr>
                    	<th scope="row"><label for="memberPassConfirm">재입력</label> <span class="t-green">*</span></th>
                        <td>
                        	<div class="input-box">
                        	
									<div class="mobile-block">
                                    	<input type="password" id="m_repwd" name="m_repwd" class="input l" />
                                    </div>
                                    
									<div class="mobile-block">
										<span class="input-guide-text inline t-green">비밀번호를 한번 더 입력해 주세요.</span>
									</div>
                        	</div>
                        </td>
                    </tr>
                    <tr>
                    	<th scope="row">이름</th>
                        <td><input type="text" name="m_name" class="input l" placeholder="성함을 입력해주세요."></td>
                    </tr>
                    <tr>
                    	<th scope="row">휴대폰번호</th>
                    	<td><input type="text" name="m_phone" id="m_phone" placeholder="휴대폰번호 입력시 '-'를 제외하고 입력해주세요." class="input l"></td>
                    </tr>
                    <tr>
                    	<th scope="row">이메일</th>
  						<td><input type="email" name="m_email" class="input l" placeholder="이메일 형식에 맞춰주세요.">
  						<button type="button"  class="btn l font-l redwine pd-m" onclick="">이메일인증</button></td>
                    </tr>
         		 </tbody>
      		</table>
  		</div>
			<div class="form-btn-box">
				<button type="button" class="btn l font-l redwine pd-m" onclick="joinCheck();">
				완&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;료</button>
				<button type="reset" class="btn l font-l nobg pd-m">다시작성</button>
			</div>	
		</div>
	</div>
</div>
</form>
</body>
</html>