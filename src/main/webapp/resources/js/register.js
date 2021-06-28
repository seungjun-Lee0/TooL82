// 약관동의
$('#regbtn').on('click', function() {
    if(!$('#agree1').is(':checked'))
        alert('회원가입 약관에 동의해주세요!');
    else if(!$('#agree2').is(':checked'))
        alert('개인정보 처리 방침에 동의해주세요!');
    else
        location.href = '/register/regForm';
});

// email readonly 속성 잠금/해제
$('#email3').on('change', function () {
    let val = $('#email3 option:selected').text();
    if (val == '직접입력하기') {
        $('#email2').attr('readonly', false); // readonly 해제
        $('#email2').val('');
    } else {
        $('#email2').attr('readonly', true); // readonly 잠금
        $('#email2').val(val);
    }
});

$('#userid').on('blur', function () {  checkuserid(); });

// 아이디 중복체크

function checkuserid() {
    let uid = $('#userid').val();
    if (uid == '') { // 아이디를 입력하지 않고 탭을 누른 경우
        $('#idmsg').text('영문, 숫자, _ 입력 가능, 최소 3글자 입력해주세요');
        return;
    }
    $.ajax({
        url: '/member/checkuid',
        type: 'GET',
        data: { 'uid': $('#userid').val() }
    })
        .done(function(data){
            let msg = '사용불가능한 아이디입니다!!';
            $('#idmsg').attr('style', 'color:red !important');

            if (data.trim() == '0' && $('#userid').val().length > 3 ) {
                msg = '사용가능한 아이디입니다!!';
                $('#idmsg').attr('style', 'color:blue !important');
            }
            $('#idmsg').text( msg );
        })
        .fail(function(xhr, status, error){
            alert(xhr.status + '/' + error);
        });
}

// 비밀번호 최소 숫자 체크
$('#passwd').on('blur', function () {
    if ($('#passwd').val().length < 7)
        $('#pwdmsg').text('최소 일곱글자 이상 입력하세요!').attr('style', 'color:red');
    else
        $('#pwdmsg').text('영문, 숫자, 특수문자 입력 가능, 최소 7글자 입력해주세요').attr('style', 'color:#888888');
});

// 비밀번호 일치 체크
$('#repasswd').on('blur', function () {
    if ($('#passwd').val() == $('#repasswd').val())
        $('#repwdmsg').text('비밀번호가 일치합니다!').attr('style', 'color:blue');
    else $('#repwdmsg').text('비밀번호가 일치하지 않습니다!').attr('style', 'color:red');
});

// 회원가입
$('#btn_submit').on('click', function() {

    if ($('#userid').val() == '') $('#idmsg').text('아이디를 입력하세요!').attr('style', 'color:red');

    else if ($('#userid').val().length < 3 ) $('#idmsg').text('최소 세글자 이상 입력하세요!').attr('style', 'color:red');

    else if ($('#idmsg').text() == '사용불가능한 아이디입니다!!') $('#idmsg').text('사용불가능한 아이디입니다!!').attr('style', 'color:red');

    else if ( ($('#passwd').val() == '')) $('#pwdmsg').text('비밀번호를 입력하세요!').attr('style', 'color:red');

    else if ($('#repasswd').val() == '') $('#repwdmsg').text('비밀번호를 다시 입력하세요!').attr('style', 'color:red');

    else if ($('#passwd').val().length < 7 ) $('#idmsg').text('최소 일곱글자 이상 입력하세요!').attr('style', 'color:red');

    else if ($('#passwd').val() != $('#repasswd').val()) $('#repwdmsg').text('비밀번호가 일치하지 않습니다!').attr('style', 'color:red');

    else if ($('#name').val() == '') $('#namemsg').text('이름을 입력하세요!').attr('style', 'color:red');

    else if ($('#email1').val() == '') $('#emailmsg').text('이메일을 입력하세요!').attr('style', 'color:red');

    else {
    $('#email').val($('#email1').val() + '@' + $('#email2').val());

    const frm = $('#fregisterform');
    frm.attr('method', 'post');
    frm.attr('action', '/register/regOk');
    frm.submit();

    alert('툴팔이의 회원이 되신 것을 환영합니다:)');
    }
});

// 로그인
$('#loginbtn').on('click', function() {

    if ($('#userid').val() == '') $('#uidmsg').text('아이디를 입력하세요!').attr('style', 'color:red');
    else if ($('#passwd').val() == '') $('#pwmsg').text('비밀번호를 입력하세요!').attr('style', 'color:red');

    else {
    const frm = $('#loginfrm');
    frm.attr('method', 'POST');
    frm.attr('action', '/member/login');
    frm.submit(); }
});

// 마이페이지 정보수정
$('#modbtn').on('click', function() {
    location.href = '/member/modifyInfo';
});

// 수정할 비밀번호 최소 숫자 체크
$('#passwd').on('blur', function () {
    if ($('#passwd').val().length < 7)
        $('#modpwdmsg').text('최소 일곱글자 이상 입력하세요!').attr('style', 'color:red');
    else
        $('#modpwdmsg').text('영문, 숫자, 특수문자 입력 가능, 최소 7글자 입력해주세요').attr('style', 'color:#888888');
});

// 수정할 비밀번호 일치 체크
$('#repasswd').on('blur', function () {
    if ($('#passwd').val() == $('#repasswd').val())
        $('#modrepwdmsg').text('비밀번호가 일치합니다!').attr('style', 'color:blue');
    else $('#modrepwdmsg').text('비밀번호가 일치하지 않습니다!').attr('style', 'color:red');
});

// 회원정보수정
$('#modifybtn').on('click', function() {

    if ($('#passwd').val() == '') $('#modpwdmsg').text('비밀번호를 입력하세요!').attr('style', 'color:red');
    else if ($('#repasswd').val() == '') $('#modrepwdmsg').text('비밀번호를 다시 입력하세요!').attr('style', 'color:red');
    else if ($('#repasswd').val().length < 7 ) $('#modpwdmsg').text('최소 일곱글자 이상 입력하세요!').attr('style', 'color:red');
    else if ($('#passwd').val() != $('#repasswd').val()) $('#modrepwdmsg').text('비밀번호가 일치하지 않습니다!').attr('style', 'color:red');
    // else if ($('#passwd').val() == $('#repasswd').val()) $('#modrepwdmsg').text('비밀번호가 일치합니다!').attr('style', 'color:blue');
    else {
    $('#email').val($('#email1').val() + '@' + $('#email2').val());

    const frm = $('#modifymemfrm');
    frm.attr('method', 'post');
    frm.attr('action', '/member/modifyInfo');
    frm.submit();
    alert('정보수정이 완료되었습니다!')}

});

// 회원 탈퇴
$('#delbtn').on('click', function() {
    location.href = '/member/remove';
});

$('#removebtn').on('click', function() {
    if ($('#passwd').val() == '') alert('비밀번호를 입력하세요!');
    else if ($('#sesspw').val() != $('#passwd').val()) $('#rmvpwdmsg').text('비밀번호를 확인하세요!').attr('style', 'color:red');
    else if (alert('정말 탈퇴하시겠습니까?'));
    else {
        const frm = $('#removefrm');
        frm.attr('method', 'post');
        frm.attr('action', '/member/remove');
        frm.submit();
        // alert('정상적으로 탈퇴되었습니다.');
    }
});


$('#cancelrmv').on('click', function() {
    location.href = '/member/mypage';
});

