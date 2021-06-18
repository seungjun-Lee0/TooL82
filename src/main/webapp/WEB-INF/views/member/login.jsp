<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="mw-400 form-pd form-login">
    <form class="form" role="form" name="flogin" action="https://buts.co.kr/bbs/login_check.php" onsubmit="return flogin_submit(this);" method="post">
        <div class="login-logo">
            <img src="https://buts.co.kr/thema/Buts/colorset/Basic/img/big-butslogo.png" alt="" />
        </div>
        <div class="login-input">
            <input type="text" name="mb_id" id="login_id" required  maxLength="20" placeholder="아이디를 입력하세요" />
        </div>
        <div class="login-input">
            <input type="password" name="mb_password" id="login_pw" required maxLength="20" placeholder="패스워드를 입력하세요">
        </div>
        <div class="login-option">
            <div class="left">
                <a href="https://buts.co.kr/bbs/password_lost.php" id="login_password_lost">아이디/비밀번호찾기</a>
            </div>
        </div>
        <button type="submit" class="form-button button button-purple">로그인</button>
    </form>

    </div>

</div>