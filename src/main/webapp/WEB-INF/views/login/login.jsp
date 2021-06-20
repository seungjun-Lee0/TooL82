<%@ page pageEncoding="UTF-8"%>

<link rel="stylesheet" href="../../../resources/css/join.css" type="text/css" >
   <h2>로그인</h2>
   <span style="color:#000000">${error}</span>
<div class="login-logo"  style="text-align: center;">
    <img src="../../../resources/img/tool82_color_logo.png" width="300px"  />
</div>
    <form name="loginfrm" id="loginfrm" method="post">
        <div style="text-align: center;"> <label for="userid" style="text-align: center;">아이디</label>
            <input type="text" name="userid" id="userid">
        </div>

        <div style="text-align: center;"><label for="passwd" style="text-align: center;">비밀번호</label>
            <input type="password" name="passwd" id="passwd">
        </div>

        <div style="text-align: center;">
            <p  text-color:black;><a href="/join/joinme">회원가입</a></p>
            <p  text-color:black;><a href="/join/lost.php">아이디/패스워드찾기</a></p>
            <br>
            <button type="submit"
                     class="form-button button button-purple">로그인</button>
		</div>

    </form>

<script>
var loginbtn = document.getElementById('loginbtn');
loginbtn.addEventListener('click', loginok);

function loginok() {
	var frm = document.getElementById('loginfrm');
	if (frm.userid.value == '')
		alert('아이디를 입력하세요!');
	else if (frm.passwd.value == '')
		alert('비밀번호를 입력하세요!');
	else {
		frm.action = 'login';
		frm.submit();
	}        			
}
</script>


