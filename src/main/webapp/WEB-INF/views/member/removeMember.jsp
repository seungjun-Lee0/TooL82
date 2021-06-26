<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="mw-400 form-pd form-login">
    <form class="form" role="form" name="removefrm" id="removefrm">
        <div class="login-logo">
            <img src="/banner/tool82_logo.jpeg" alt="" />
        </div>
        <div class="login-input">
            <input type="text" name="userid" id="userid" required  maxLength="20" placeholder="아이디를 입력하세요" value="${sessionScope.MyInfo.userid}"/>
            <span id="uidmsg"></span>
        </div>
        <div class="login-input">
            <input type="password" name="passwd" id="passwd" required maxLength="20" placeholder="탈퇴를 위해 비밀번호를 입력하세요">
            <span id="rmvpwmsg"></span>
        </div>
<%--        <div class="login-option">--%>
<%--            <div class="left">--%>
<%--                <a href="https://buts.co.kr/bbs/password_lost.php" id="login_password_lost">아이디/비밀번호찾기</a>--%>
<%--            </div>--%>
<%--        </div>--%>
        <div class="form-inline" >
        <button type="button" class="form-button button button-purple" id="cancelrmv" style="width: 49%; min-width: fit-content; color: white">취소하기</button>&nbsp;
        <button type="button" class="form-button button button-purple" id="removebtn" style="width: 49%; min-width: fit-content">탈퇴하기</button>
        </div>
        <input type="hidden" id="sesspw" value="${sessionScope.MyInfo.passwd}">
        <input type="hidden" id="sessmno" value="${sessionScope.MyInfo.mno}">
        <input type="hidden" id="sessyn" value="${sessionScope.MyInfo.selleryn}">

    </form>

</div>




