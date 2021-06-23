<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="mw-400 form-pd form-login">
    <form class="form" role="form" name="loginfrm" id="loginfrm">
        <div class="login-logo">
            <img src="https://buts.co.kr/thema/Buts/colorset/Basic/img/big-butslogo.png" alt="" />
        </div>
        <div class="login-input">
            <input type="text" name="userid" id="userid" required  maxLength="20" placeholder="아이디를 입력하세요" />
            <span id="uidmsg"></span>
        </div>
        <div class="login-input">
            <input type="password" name="passwd" id="passwd" required maxLength="20" placeholder="패스워드를 입력하세요">
            <span id="pwmsg"></span>
        </div>
        <div class="login-option">
            <div class="left">
                <a href="https://buts.co.kr/bbs/password_lost.php" id="login_password_lost">아이디/비밀번호찾기</a>
            </div>
        </div>
        <button type="button" class="form-button button button-purple" id="loginbtn">로그인</button>
    </form>

    </div>

</div>