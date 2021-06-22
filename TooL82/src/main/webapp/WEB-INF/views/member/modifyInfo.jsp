<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!-- 하드코딩 or 내용만 보여주는 페이지로 진행되기를 요청합니다!!!! ㅠㅜ -->



 <form class="form-horizontal register-form"
role="form" id="fregisterform" name="fregisterform"
action="https://buts.co.kr/bbs/register_form_update.php"
onsubmit="return fregisterform_submit(this);" method="post"
enctype="multipart/form-data" autocomplete="off">

    <input type="hidden" name="w" value="">
    <input type="hidden" name="pim" value="">
    <input type="hidden" name="agree" value="1">
    <input type="hidden" name="agree2" value="1">
    <input type="hidden" name="cert_type" value="">
    <input type="hidden" name="cert_no" value="">
    <input type="hidden" name="mb_sex" value="">

    <div class="mw-800 form-signup mg-top-minus">
        <div class="h3">비밀번호 수정</div>
        <div class="form-round signup">
            <ul class="form-list">
                <li>
                    <span class="subject">ㆍ 아이디</span>
                    <input type="text" name="mb_id" value="" id="reg_mb_id" required  placeholder="아이디" minlength="3" maxlength="20" readonly>
                    <span class="lightgrey inline-break">영문자, 숫자, _ 입력 가능, 최소 3글자 입력해주세요</span>
                </li>
                <li>
                    <span class="subject">ㆍ 비밀번호</span>
                    <input type="password" name="mb_password" id="reg_mb_password"
                           required class="form-control input-sm"
                           placeholder="비밀번호" minlength="3" maxlength="20">
                </li>
                <li>
                    <span class="subject">ㆍ 비밀번호 확인</span>
                    <input type="password" name="mb_password_re"
                           id="reg_mb_password_re" required class="form-control input-sm"
                           placeholder="비밀번호 확인" minlength="3" maxlength="20">
                </li>
            </ul>
        </div>
        <div class="h3"><span class="text-purple">내 정보</span> 수정</div>
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
                    <span class="subject">ㆍ 판매자 여부</span>
                    <input type="radio" id="seller" name="usertype" value="0">
                    <label for="seller">판매자</label><br>
                    <input type="radio" id="buyer" name="usertype" value="1">
                    <label for="buyer">구매자</label><br>
                </li>
            </ul>
        </div>

        <div class="button-align center">

            <a href="/" class="button">취소</a>
            <button type="submit" id="btn_submit" class="button button-purple" accesskey="s">수정완료</button>
        </div>
    </div>
</form>