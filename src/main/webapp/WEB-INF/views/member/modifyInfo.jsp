<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="email" value="${fn:split(mb.email, '@')}" />

<form class="form-horizontal register-form" role="form" id="modifymemfrm" name="modifymemfrm" >
<%--    <input type="hidden" name="w" value="">--%>
<%--    <input type="hidden" name="url" value="https://buts.co.kr/bbs/register_form.php">--%>
<%--    <input type="hidden" name="pim" value="">--%>
<%--    <input type="hidden" name="agree" value="1">--%>
<%--    <input type="hidden" name="agree2" value="1">--%>
<%--    <input type="hidden" name="cert_type" value="">--%>
<%--    <input type="hidden" name="cert_no" value="">--%>
<%--    <input type="hidden" name="mb_sex" value="">--%>

    <div class="mw-800 form-signup mg-top-minus">
        <div class="h3">비밀번호 수정</div>
        <div class="form-round signup">
            <ul class="form-list">
                <li>
                    <span class="subject">ㆍ 아이디</span>
                    <input type="text" name="userid" value="${UID}" id="userid" required  placeholder="아이디" minlength="3" maxlength="20" readonly>
                    <span class="lightgrey inline-break"></span>
                </li>
                <li>
                    <span class="subject">ㆍ 비밀번호</span>
                    <input type="password" name="passwd" id="passwd" required class="form-control input-sm" placeholder="비밀번호" minlength="3" maxlength="20">
                    <span class="lightgrey inline-break" id="pwdmsg">영문, 숫자, 특수문자 입력 가능, 최소 7글자 입력해주세요</span>
                </li>
                <li>
                    <span class="subject">ㆍ 비밀번호 확인</span>
                    <input type="password" name="repasswd" id="repasswd" required class="form-control input-sm" placeholder="비밀번호 확인" minlength="3" maxlength="20">
                    <span class="lightgrey inline-break" id="repwdmsg"></span>
                </li>
            </ul>
        </div>
        <div class="h3"><span class="text-purple">내 정보</span> 수정</div>
        <div class="form-round signup">
            <ul class="form-list">
                <li>
                    <span class="subject">ㆍ 이름</span>
                    <input type="text" id="name" name="name" value="${mb.name}" required  placeholder="이름" size="10">
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
                    <input type="radio" id="seller" name="selleryn" value="0">
                    <label for="seller">판매자</label><br>
                    <input type="radio" id="buyer" name="selleryn" value="1">
                    <label for="buyer">구매자</label><br>
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