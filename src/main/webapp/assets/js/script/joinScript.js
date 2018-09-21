var idck = 0;

function joinCheck(){

	if(document.joinForm.m_id.value == ""){
		alert("아이디를 입력해주세요.");
		document.joinForm.m_id.focus();
		return false;
	}else if(document.joinForm.m_pwd.value == ""){
		alert("비밀번호를 입력해주세요.");
		document.joinForm.m_pwd.focus();
		return false;
	}else if(document.joinForm.m_repwd.value == ""){
		alert("비밀번호를 재입력해주세요.");
		document.joinForm.m_repwd.focus();
		return false;
	}else if(document.joinForm.m_name.value == ""){
		alert("성함을 입력해주세요.");
		document.joinForm.m_name.focus();
		return false;
	}else if(document.joinForm.m_phone.value == ""){
		alert("연락처를 입력해주세요.");
		document.joinForm.m_phone.focus();
		return false;
	}else if(document.joinForm.m_pwd.value != document.joinForm.m_repwd.value ){
		alert("비밀번호가 서로 맞지 않습니다.");
		document.joinForm.m_pwd.value = "";
		document.joinForm.m_repwd.value ="";
		document.joinForm.m_pwd.focus();
		return false;
	}
	
	
	//아이디 체크여부 확인 (아이디 중복일 경우 = 0 , 중복이 아닐경우 = 1 )
	if(confirm("회원가입을 하시겠습니까?")){
        if(idck==0){
            alert('중복체크부터 해주세요');
            return false;
        }else{
        $("#joinForm").submit();
        }
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
	if(document.joinForm.m_phone.value != ""){
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

$(function() {
    $("#checkbutton").click(function() {

    	var pattern1 = /(^[a-zA-Z])/;
    	var pattern2 = /([^a-zA-Z0-9-_])/;
    	var pattern4 = "admin";
    	var id = document.joinForm.m_id.value;
    	var pattern5 = id.indexOf(pattern4);
    	if(!pattern1.test(id)){
    	    alert("아이디의 첫글자는 영문이어야 합니다.");
    	    return false;
    	}else if(pattern2.test(id)){
    	    alert("아이디는 영문, 숫자, -, _ 만 사용할 수 있습니다.");
    	    return false;
    	}else if(pattern5 != -1){
    	    alert("admin이 들어가면 사용할수 없습니다.");
    	    return false;
    	}
        //userid 를 param.
        var m_id =  $("#m_id").val(); 
        $.ajax({
            async: true,
            type : 'POST',
            data : m_id,
            url : "joinCheckId",
            dataType : "json",
            contentType: "application/json; charset=UTF-8",
            success : function(data) {
                if (data.exist == true) {
                    alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");    
                    $("#m_id").focus();        
                } else {
                    alert("사용가능한 아이디입니다.");
                    $("#m_pwd").focus();
                    idck = 1;
                }
            },
            error : function(error) {
                
                alert("error : " + error);
            }
        });
    });
});


