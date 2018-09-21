var idck = 0;

function modifyCheck(){

	if(document.modifyForm.m_pwd.value == ""){
		alert("비밀번호를 입력해주세요.");
		document.modifyForm.m_pwd.focus();
		return false;
	}else if(document.modifyForm.m_repwd.value == ""){
		alert("비밀번호를 재입력해주세요.");
		document.modifyForm.m_repwd.focus();
		return false;
	}else if(document.modifyForm.m_name.value == ""){
		alert("성함을 입력해주세요.");
		document.modifyForm.m_name.focus();
		return false;
	}else if(document.modifyForm.m_phone.value == ""){
		alert("연락처를 입력해주세요.");
		document.modifyForm.m_phone.focus();
		return false;
	}else if(document.modifyForm.m_pwd.value != document.modifyForm.m_repwd.value ){
		alert("비밀번호가 서로 맞지 않습니다.");
		document.modifyForm.m_pwd.value = "";
		document.modifyForm.m_repwd.value ="";
		document.modifyForm.m_pwd.focus();
		return false;
	}else{
        $("#modifyForm").submit();
    }
	
	
}

$(document).ready(function(){
	$("#m_phone").blur(function(){
		var num = $("#m_phone").val();
		blur(num);
	});	
	$("#m_phone").click(function(){
		var num = $("#m_phone").val();
		focus(num);
	});
});
function focus(num){
	num = num.replace(/[^0-9]/g,'');
			$("#m_phone").val(num);
}
function blur(num){
	if(document.modifyForm.m_phone.value != ""){
		num = num.replace(/[^0-9]/g,'');
		var tmp ='';
		tmp += num.substr(0,3);
		tmp += '-';
		tmp += num.substr(3,4);
		tmp += '-';
		tmp += num.substr(7);
		$("#m_phone").val(tmp);
	}
	
}
