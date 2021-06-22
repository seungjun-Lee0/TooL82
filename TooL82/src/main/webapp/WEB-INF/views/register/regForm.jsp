<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core %>



<div class="card card-body bg-light">
    <script src="https://www.google.com/recaptcha/api.js"></script>


<form name="joinfrm" id="joinfrm" >


    <input type="hidden" name="agree" value="1">
    <input type="hidden" name="agree2" value="1">
    <input type="hidden" name="cert_type" value="">
    <input type="hidden" name="cert_no" value="">

    <div class="mw-800 form-signup mg-top-minus">
        <div class="h3">아이디/비밀번호</div>
        <div class="form-round signup">
            <ul class="form-list">
                <li>
                    <span class="subject">ㆍ 아이디</span>
                    <input type="text" name="mb_id" value="" id="reg_mb_id" required  placeholder="아이디" minlength="3" maxlength="20">
                    <span class="lightgrey inline-break">영문자, 숫자, _ 입력 가능, 최소 3글자 입력해주세요</span>
                </li>
                <li>
                    <span class="subject">ㆍ 비밀번호</span>
                    <input type="password" name="passwd" id="passwd" required class="form-control input-sm" placeholder="비밀번호" minlength="3" maxlength="20">
                </li>
                <li>
                    <span class="subject">ㆍ 비밀번호 확인</span>
                    <input type="password" name="mb_password_re" id="reg_mb_password_re" required class="form-control input-sm" placeholder="비밀번호 확인" minlength="3" maxlength="20">
                </li>
            </ul>
        </div>
        <div class="h3"><span class="text-purple">내 정보</span> 입력</div>
        <div class="form-round signup">
            <ul class="form-list">
                <li>
                    <span class="subject">ㆍ 이름</span>
                    <input type="text" id="reg_mb_name" name="mb_name" value="" required  placeholder="이름" size="10">
                </li>
                <li>
                    <span class="subject">ㆍ 이메일</span>
                    <input type="text" name="email1" value="" id="email1" required placeholder="이메일" size="70" maxlength="100">
                    <span class="lightgrey at">@</span>
                    <input type="text" class="width-200" name="email2" id="email2" class="form-control border-danger col-2" readonly>
                    <select class="width-200" id="email3">
                        <option>-선택하세요-</option>
                        <option>직접입력하기</option>
                        <option>naver.com</option>
                        <option>gmail.com</option>
                        <option>hotmail.com</option>
                    </select>
                </li>
                <li>
                    <span class="subject">ㆍ 가입유형</span>
                    <input type="radio" id="seller" name="usertype" value="0">
                    <label for="seller">판매자</label><br>
                    <input type="radio" id="buyer" name="usertype" value="1">
                    <label for="buyer">구매자</label><br>
                </li>
            </ul>
        </div>



        <div class="form-group row">
            <label class="col-2 col-form-label text-danger text-right">자동가입방지</label>
            <div class="g-recaptcha"
                 data-sitekey="6LdmIwgbAAAAAPO06Cyw44ZE0pkeDeMHEwVbgiM-"></div>
            <input type="hidden" id="g-recaptcha" name="g-recaptcha" />
        </div><!-- 캡차 -->



        <div class="button-align center">

            <a href="/" class="button">취소</a>
            <button type="submit" id="btn_submit" class="button button-purple" accesskey="s">회원 가입</button>
        </div>
    </div>
</form>
</div>