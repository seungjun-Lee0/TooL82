<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta property="og:description" content="회원정보 찾기 > " />

<title>회원정보 찾기</title>

</head>
<body class="responsive is-pc">
	<h1 style="display:inline-block
	!important;position:absolute;top:0;left:0;margin:0
	!important;padding:0 !important;font-size:0;line-height:0;border:0
	 !important;overflow:hidden !important">
	회원정보 찾기 > Buts	</h1>
<form>
	<div class="mw-400 form-pd form-password">
		<div class="form-title center"><span class="text-purple">아이디 / 패스워드</span> 찾기</div>
		<p class="form-text center">회원가입 시 등록하신 <span class="text-purple">이메일 주소를 입력</span>해 주세요. <br />해당 이메일로 아이디와 비밀번호 정보를 보내드립니다.</p>
		<div class="password-email">
			<input type="text" name="mb_email" id="mb_email"
			required class="form-control input-sm email" size="30"
			placeholder="이메일을 입력해주세요" maxlength="100">
		</div>

		<div class="button-align center">

			<button type="submit" class="button small button-purple">확인</button>
		</div>
	</div>

</form>

<script>
function fpasswordlost_submit(f) {
    if (!chk_captcha()) return false;

    return true;
}

$(function() {
    var sw = screen.width;
    var sh = screen.height;
    var cw = document.body.clientWidth;
    var ch = document.body.clientHeight;
    var top  = sh / 2 - ch / 2 - 100;
    var left = sw / 2 - cw / 2;
    moveTo(left, top);
});
</script>
<!-- } 회원정보 찾기 끝 --></div>


</body>
</html>
