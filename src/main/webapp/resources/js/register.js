// 약관동의
$('#regbtn').on('click', function() {
    if(!$('#agree1').is(':checked'))
        alert('회원가입 약관에 동의해주세요!');
    else if(!$('#agree2').is(':checked'))
        alert('개인정보 처리 방침에 동의해주세요!');
    else
        location.href = '/register/regForm';
});

// 회원가입
$('#btn_submit').on('click', function() {
$('#userid').on('blur', function() { checkUserid(); });

function checkUserid() {
    // let uid = $('#userid').val();
    if ($('#userid').val() == '') {
        $('#idmsg').text('아이디를 입력하세요!');
        $('#idmsg').attr('style', 'color:red');
        return;
    }
    $.ajax({
        url: '/member/checkuid',
        type: 'GET',
        data: {'uid':$('#userid').val()}
    })
        .done(function(data) {
            let msg = '사용 불가능한 아이디입니다!';
            $('#idmsg').attr('style','color:red');

            if (data.trim() == '0') {
                msg = '사용 가능한 아이디입니다!';
                $('#idmsg').attr('style','color:blue');
            }
            $('#idmsg').text(msg);
        })
        .fail(function(xhr, status, error) {
            alert(xhr.status + '/' + error);
        });
}

$('#passwd').on('blur', function() {
    if ($('#passwd').val() == '') {
        $('#pwdmsg').text('비밀번호를 입력하세요!');
        $('#pwdmsg').attr('style', 'color:red');
    }
    else $('#pwdmsg').remove();
});

$('#repasswd').on('blur', function() {
    if ($('#repasswd').val() == '') {
        $('#repwdmsg').text('비밀번호를 다시 입력하세요!');
        $('#repwdmsg').attr('style', 'color:red');
    }
    else if ($('#passwd').val() == $('#repasswd').val()) {
        $('#repwdmsg').text('비밀번호가 일치합니다!');
        $('#repwdmsg').attr('style', 'color:blue');
    }
    else {
        $('#repwdmsg').text('비밀번호가 일치하지 않습니다!');
        $('#repwdmsg').attr('style', 'color:red');
    }
});

$('#name').on('blur', function() {
    if ($('#name').val() == '') {
        $('#namemsg').text('이름을 입력하세요!');
        $('#namemsg').attr('style', 'color:red');
    }
    else $('#namemsg').remove();
});

$('#email1').on('blur', function() {
    if ($('#email1').val() == '') {
        $('#emailmsg').text('이메일을 입력하세요!');
        $('#emailmsg').attr('style', 'color:red');
    }
    else $('#emailmsg').remove();
});

$('#email3').on('change', function() {
    let val = $('#email3 option:selected').text();
    if (val == '직접입력하기') {
        $('#email2').attr('readonly', false); // readonly 해제
        $('#email2').val('');
    }
    else {
        $('#email2').attr('readonly', true); // readonly 잠금
        $('#email2').val(val);
    }
});

// radio 버튼 체크 여부


    $('#email').val($('#email1').val() + '@' + $('#email2').val());

    const frm = $('#fregisterform');
    frm.attr('method', 'post');
    frm.attr('action', '/register/regOk');
    frm.submit();

    alert('툴팔이의 회원이 되신 것을 환영합니다:)');
});

// 로그인
$('#userid').on('blur', function() {
    if ($('#userid').val() == '') {
        $('#uidmsg').text('아이디를 입력하세요!');
        $('#uidmsg').attr('style', 'color:red');
    }
    else $('#uidmsg').remove();
});

$('#passwd').on('blur', function() {
    if ($('#passwd').val() == '') {
        $('#pwmsg').text('비밀번호를 입력하세요!');
        $('#pwmsg').attr('style', 'color:red');
    }
    else $('#pwmsg').remove();
});

$('#loginbtn').on('click', function() {
    const frm = $('#loginfrm');
    frm.attr('method', 'POST');
    frm.attr('action', '/member/login');
    frm.submit();
});

// 회원정보수정
$('#modifybtn').on('click', function() {
    $('#email').val($('#email1').val() + '@' + $('#email2').val());

    const frm = $('modifymemfrm');
    frm.attr('method', 'post');
    frm.attr('action', '/member/mypage');
    frm.submit();
});

