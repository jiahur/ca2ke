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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"/>'
<script type="text/javascript" src="../assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../assets/js/script/loginScript.js"></script>
</head>
<body>
            <!-- sub page contents -->
			<div class="sub-contents-container">
                <div class="global-section su
                b-contents">

			
					<div class="sub-contents-box">

						<!-- login contents -->
						<p class="login-guide-text">
							ca2ke를 방문해주셔서 감사합니다.<br />
						</p>
						<form id="loginForm" name="loginForm" method="post" action="login">
						<div class="login-box">
							<div class="login-form-box">
								<p class="login-id-guide-text"><span class="t-blue">아이디는 이메일주소</span>입니다.</p>
								<input type="text" id="m_id" name="m_id" class="input-login id" >
								<input type="password" id="m_pwd" name="m_pwd" class="input-login pw" />
								<div class="img-checkbox login-id-save">
									<label for="idSave">
										<span class="img-checkbox-label">아이디 저장</span>
										<input type="checkbox" id="idSave" name="idSave" class="img-hidden-checkbox" />
										<i class="img-checkbox-item"></i>
									</label>a
								</div>
								<button type="submit" class="btn xl font-l redwine">로그인</button>
							</div>
							</form>
							<div class="login-member-box">
								<div class="member-join-box">
									<p class="member-title-box join">
										<span class="member-title-text">아직 회원이 아니신가요?</span>
										<em class="member-subtitle-text">가입 후 다양한 서비스와 혜택을 제공 받으실 수 있습니다.</em>
									</p>
									<div class="member-btn-box">
										<a href="joinForm" class="btn l font-m black pd-m">회원가입</a>
									</div>
								</div>
								<div class="member-find-idpw-box">
									<p class="member-title-box find-idpw">
										<span class="member-title-text">회원정보를 잊으셨나요?</span>
										<em class="member-subtitle-text">아이디 또는 비밀번호 정보를 찾으실 수 있습니다.</em>
									</p>
									<div class="member-btn-box">
										<a href="/home/member/idsearch" class="btn l font-m nobg pd-s">아이디/비밀번호 찾기</a>
									</div>
								</div>
							</div>
						</div>
						<!-- //login contents -->
					</div>
                </div>
            <!-- //sub page contents -->

</body>
</html>