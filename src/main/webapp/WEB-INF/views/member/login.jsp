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
            <div class="input-check">
                <input type="checkbox" name="auto_login" id="login_auto_login" />
                <label for="login_auto_login">자동로그인</label>
            </div>
            <div class="right">
                <a href="./register.php" class="v-bar">회원가입</a>
                <a href="https://buts.co.kr/bbs/password_lost.php" id="login_password_lost">아이디/비밀번호찾기</a>
            </div>
        </div>
        <button type="submit" class="form-button button button-purple">로그인</button>
        <div class="form-text">
            벗츠 회원이 아닌가요? <br />
            첫가입 시 500포인트! <span class="text-purple">추천인 등록 시 추가 500포인트!</span> 받으세요~
        </div>
    </form>

    </div>

</div>