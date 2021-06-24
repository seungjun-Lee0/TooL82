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

// 아이디 중복체크
$('#userid').on('blur', function () {
    $.ajax({
        url: '/member/checkuid',
        type: 'GET',
        data: {'uid': $('#userid').val()}
    })
        .done(function (data) {
            let msg = '사용 불가능한 아이디입니다!';
            $('#idmsg').attr('style', 'color:red');

            if (data.trim() == '0') {
                msg = '사용 가능한 아이디입니다!';
                $('#idmsg').attr('style', 'color:blue');
            }
            $('#idmsg').text(msg);
        })
        .fail(function (xhr, status, error) {
            alert(xhr.status + '/' + error);
        });
})

// 중복 아이디 가입 방지
// else if ($.ajax.data =='0');

// 비밀번호 일치 체크
$('#repasswd').on('blur', function () {
    if ($('#passwd').val() == $('#repasswd').val()) $('#repwdmsg').text('비밀번호가 일치합니다!').attr('style', 'color:blue');
    else $('#repwdmsg').text('비밀번호가 일치하지 않습니다!').attr('style', 'color:red');
});

// 회원가입
$('#btn_submit').on('click', function() {

    if ($('#userid').val() == '') $('#idmsg').text('아이디를 입력하세요!').attr('style', 'color:red');
    // else if ($('#idmsg').remove());

    // else if ($('#idmsg').val() == '사용 가능한 아이디입니다!');
    // ajax로 받아온 userid 끌어와서 비교해야 중복 아이디로 가입 방지 가능. 기능 구현 필요

    else if ( ($('#passwd').val() == '')) $('#pwdmsg').text('비밀번호를 입력하세요!').attr('style', 'color:red');
    // else if ($('#pwdmsg').remove());
    else if ($('#repasswd').val() == '') $('#repwdmsg').text('비밀번호를 다시 입력하세요!').attr('style', 'color:red');
    // else if ($('#repwdmsg').remove());
    else if ($('#name').val() == '') $('#namemsg').text('이름을 입력하세요!').attr('style', 'color:red');
    // else if ($('#name').val() != '') $('#namemsg').remove();
    else if ($('#email1').val() == '') $('#emailmsg').text('이메일을 입력하세요!').attr('style', 'color:red');
    // else if ($('#email1').val() != '') $('#emailmsg').remove();
    else {

    $('#email').val($('#email1').val() + '@' + $('#email2').val());

    const frm = $('#fregisterform');
    frm.attr('method', 'post');
    frm.attr('action', '/register/regOk');
    frm.submit();

    alert('툴팔이의 회원이 되신 것을 환영합니다:)');
    } // else
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

// 회원정보수정
$('#modifybtn').on('click', function() {

    if ($('#passwd').val() == '') $('#modpwdmsg').text('비밀번호를 입력하세요!').attr('style', 'color:red');
    else if ($('#repasswd').val() == '') $('#modrepwdmsg').text('비밀번호를 다시 입력하세요!').attr('style', 'color:red');
    else {
    $('#email').val($('#email1').val() + '@' + $('#email2').val());

    const frm = $('#modifymemfrm');
    frm.attr('method', 'post');
    frm.attr('action', '/member/modifyInfo');
    frm.submit();
    alert('정보수정이 완료되었습니다!')}

});

