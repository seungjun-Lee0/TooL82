<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="mw-400 form-pd form-login">

    <form name="loginfrm" id="loginfrm" method="post">

        <div class="login-logo">
            <img src="/resources/banner/tool82logo.jpeg" alt="" />
        </div>                            <!-- 위치는 확인은 되나 이미지 깨짐 등은 확인이 안됨OTL -->

        <div class="login-input">
            <input type="text" name="mb_id" id="login_id" required  maxLength="20" placeholder="아이디를 입력하세요" />
        </div>
        <div class="login-input">
            <input type="password" name="mb_password" id="login_pw" required maxLength="20" placeholder="패스워드를 입력하세요">
        </div>
        <div class="login-option">
            <div class="left">
                <a href="../register/regAgree" id="logint">82피플 가입</a>

                <a href="find" id="login_password_lost">아이디/비밀번호찾기</a>
            </div>
        </div>
        <button type="submit" class="form-button button button-purple">로그인</button>
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



</div>

</div>