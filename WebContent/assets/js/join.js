 $(function () {
            $("form").submit(function () {
                var $pw = $('input[name=cus_pw]');
                var $pw_re = $('input[name=cus_pw_re]');
                var $name = $('input[name=cus_name]');
                var $agree = $('input[name=priority]:checked').val();
                if (!(/[a-zA-Z0-9]{8,12}$/.test($pw.val()))) {
                    alert('PW를 다시 확인하고 입력해주세요');
                    return false;
                } else if ($pw.val() != $pw_re.val()) {
                    alert('PW와 동일하게 입력해주세요');
                    return false;
                } else if (!(/[가-힣]{2,5}$/.test($name.val()))) {
                    alert('이름 입력을 다시 확인하고 입력해주세요');
                    return false;
                } else if ($agree != 'agree'){
                	alert('약관에 동의해야 합니다');
                	return false;
                }
                return true;
            });
            $('input[name]').focusin(function () {
                switch ($(this).attr('name')) {
                    case "cus_pw": $(this).next().text('소문자, 대문자, 숫자로 8~12글자만 입력 해주세요'); break;
                    case "cus_pw_re": $(this).next().text('비밀번호 재입력'); break;
                    case "cus_name": $(this).next().text('한글로만 2~5글자 입력 해주세요'); break;
                }
            });
            $('input[name]').focusout(function () {
                $(this).next().text("");
            });
        });
        

 function idchk(id){
 	if(id==""){
 		alert("아이디를 입력하세요");
 	}else{
 		url = "customer/idchk.jsp?cus_id=" + id;
 		window.open(url,"idcheck","width=400, height=350");
 	}
 }
 
 
 function logout() {
			sessionStorage.clear();
			alert("로그아웃 되었습니다.");
			location.href="index.jsp";
			}
 
 