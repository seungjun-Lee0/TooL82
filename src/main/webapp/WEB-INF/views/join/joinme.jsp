<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core %>




<div id="main">

<script src="https://www.google.com/recaptcha/api.js"></script>

<div>
<i class="fas fa-users fa-2x"> 회원가입 </i>
<hr>
</div><!-- 페이지 타이틀 -->

<nav>
<ul class="breadcrumb">
<li class="breadcrumb-item active">
<button type="button" disabled class="btn btn-success">이용약관</button>
</li>
<li class="breadcrumb-item">
<button type="button" disabled
class="btn btn-success">실명확인</button>
</li>
<li class="breadcrumb-item">
<button type="button" disabled
class="btn btn-success">정보입력</button>
</li>
<li class="breadcrumb-item">
<button type="button" disabled class="btn btn-light">가입완료</button>
</li>
</ul>
</nav><!-- 브레드크럼 -->

<div>
<h2>회원정보 입력</h2>
<small class="text-muted">
회원정보는 개인정보 취급방침에 따라 안전하게 보호되며,
회원님의 명백한 동의없이 공개 또는 제3자에게 제공되지 않습니다.
</small>
<hr>
</div><!-- 섹션 타이틀 -->

<div class="card card-body bg-light">
<h3>회원가입</h3>

<form name="joinfrm" id="joinfrm">
<div class="row">
<div class="col-11 offset-1">



    <div class="form-group row">


        <select class="form-control border-danger col-2"
                id="usertype">
            <option>-가입유형 선택-</option>
            <option value="0">일반회원</option>
            <option value="1">셀러파트너</option>
        </select>

        <script>
            var usertype = $("#usertype");
            usertype.on("change", function(){

                console.log($(this).find("option:selected").val());
            })

        </script>
    </div>


 <!--   <div class="custom-control custom-radio">
        <input type="radio" id="customer" name="usertype" value="0"
               class="custom-control-input">
        <label for="customer" class="custom-control-label text-warning">일반회원</label>
    </div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <div class="custom-control custom-radio">
        <input type="radio" id="seller" name="uertype" value="1"
               class="custom-control-input">
        <label for="seller" class="custom-control-label text-warning">셀러파트너</label>
    </div>  -->
</div><!-- 가입유형 -->



<div class="form-group row">
<label class="col-2 col-form-label text-danger text-right" for="name">
이름</label>
<input type="text" name="name" id="name"
class="form-control border-danger col-2" readonly
value="${param.name}">
</div><!-- 이름 -->


<div class="form-group row">
<label class="col-2 col-form-label text-danger text-right" for="customerid">아이디</label>
<input type="text" name="userid" id="customerid"
class="form-control border-danger col-3">
<span id="uidmsg" class="col-form-label">&nbsp;8~16자의 영문 소문자, 숫자와 특수기호(_)만 사용할 수 있습니다.</span>
</div><!-- 아이디 -->


<div class="form-group row">
<label class="col-2 col-form-label text-danger text-right" for="passwd">비밀번호</label>
<input type="password" name="passwd" id="passwd"
class="form-control border-danger col-3">
<span id='pwdmsg' class="col-form-label">&nbsp;8~16자의 영문 소문자, 숫자와 특수기호(_)만 사용할 수 있습니다.</span>
</div><!-- 비번 -->

<div class="form-group row">
<label class="col-2 col-form-label text-danger text-right" for="repasswd">비밀번호 확인</label>
<input type="password" name="repasswd" id="repasswd"
class="form-control border-danger col-3">
<span class="col-form-label">&nbsp;이전 항목에서 입력했던 비밀번호를 한번 더 입력하세요.</span>
</div><!-- 비번확인 -->






<div class="form-group row">
<label class="col-2 col-form-label text-danger text-right"
       for="email1">전자우편 주소</label>
<input type="text" name="email1" id="email1"
class="form-control border-danger col-3">

<div class="input-group-prepend">
<span class="input-group-text">@</span>
</div>
<input type="text" name="email2" id="email2"
class="form-control border-danger col-2" readonly>
&nbsp;

<select class="form-control border-danger col-2" id="email3">
<option>-선택하세요-</option>
<option>직접입력하기</option>
<option>naver.com</option>
<option>gmail.com</option>
<option>hotmail.com</option>
</select>
</div><!-- 이메일 -->



<div class="form-group row">
<label class="col-2 col-form-label text-danger text-right">자동가입방지</label>
<div class="g-recaptcha"
data-sitekey="6LdmIwgbAAAAAPO06Cyw44ZE0pkeDeMHEwVbgiM-"></div>
<input type="hidden" id="g-recaptcha" name="g-recaptcha" />
</div><!-- 캡차 -->




</div><!-- 정보입력 -->



<div class="row">
<div class="col-12 text-center">
<hr>
<button type="button" class="btn btn-primary"
id="joinbtn"><i class="fas fa-check-circle"></i>
입력완료</button>
<button type="button" class="btn btn-danger"
id="cancelbtn"><i class="fas fa-times-circle"></i>
입력취소</button>
</div>
</div><!-- 버튼들 -->


<input type=hidden" name="email" id="email">


</div>
</form>
</div>

</form>
</div><!-- 회원정보 입력 -->


</div>

<!--

-->