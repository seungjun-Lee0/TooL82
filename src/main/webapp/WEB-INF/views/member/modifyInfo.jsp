<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="email" value="${fn:split(sessionScope.MyInfo.email, '@')}" />

<form class="form-horizontal register-form" role="form" id="modifymemfrm" name="modifymemfrm" >

    <div class="mw-800 form-signup mg-top-minus">
        <div class="h3">비밀번호 수정</div>
        <div class="form-round signup">
            <ul class="form-list">
                <li>
                    <span class="subject">ㆍ 아이디</span>
                    <input type="text" name="userid" value="${sessionScope.MyInfo.userid}" id="userid" required  placeholder="아이디" minlength="3" maxlength="20" readonly>
                    <span class="lightgrey inline-break"></span>
                </li>
                <li>
                    <span class="subject">ㆍ 비밀번호</span>
                    <input type="password" name="passwd" id="passwd" required placeholder="비밀번호" minlength="3" maxlength="20">
                    <span class="lightgrey inline-break" id="modpwdmsg">수정할 비밀번호를 입력하세요</span>
                </li>
                <li>
                    <span class="subject">ㆍ 비밀번호 확인</span>
                    <input type="password" name="repasswd" id="repasswd" required placeholder="비밀번호 확인" minlength="3" maxlength="20">
                    <span class="lightgrey inline-break" id="modrepwdmsg"></span>
                </li>
            </ul>
        </div>
        <div class="h3"><span class="text-purple">내 정보</span> 수정</div>
        <div class="form-round signup">
            <ul class="form-list">
                <li>
                    <span class="subject">ㆍ 이름</span>
                    <input type="text" id="name" name="name" value="${sessionScope.MyInfo.name}" required  placeholder="이름" size="10" readonly>
                </li>
                <li>
                    <span class="subject">ㆍ 이메일</span>
                    <input type="text" name="email1" value="${email[0]}" id="email1" required placeholder="이메일" size="70" maxlength="100">
                    <span class="lightgrey at">@</span>
                    <input type="text" class="width-200" name="email2" id="email2" class="form-control border-danger col-2" readonly  value="${email[1]}">
                    <select class="width-200" id="email3">
                        <option>-선택하세요-</option>
                        <option>직접입력하기</option>
                        <option>naver.com</option>
                        <option>gmail.com</option>
                        <option>hotmail.com</option>
                    </select>
                </li>
                <li>
                    <span class="subject">ㆍ 판매자 여부</span>
                    <div class="form-inline inline-break" style="padding-top: -10px">
                        <input type="radio" id="seller" name="selleryn" value="0" checked>
                        <label for="seller"> &nbsp;판매자</label><br> &nbsp;&nbsp;&nbsp;
                        <input type="radio" id="buyer" name="selleryn" value="1">
                        <label for="buyer"> &nbsp;구매자</label><br>
                    </div>
                </li>
            </ul>
        </div>

        <div class="button-align center">

            <a href="/" class="button">취소</a>
            <button type="button" id="modifybtn" class="button button-purple" accesskey="s">수정완료</button>
        </div>
    </div>
    <input type="hidden" id="email" name="email">
</form>