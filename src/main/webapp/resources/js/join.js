// agree
//이용약관 내용
$('#okagree').on('click',function() {
    if ($('#agree1').is(':checked'))
        alert('이용약관에 동의하세요!');
    else if ($('#agree2').is('checked'))
        alert('개인정보 수집에 동의하십시오');
    else
        location.href='/joion/checkme';
}); //동의했을 경우 클릭 시 이벤트



$('#noagree').on('click',function() {
    location.href ='/';
}); //동의하지 않음을 클릭시 이벤트




// checkme

    $('#chk2btn').on('click', function (){
    if($('#name2').val()=='')alert("이름을 입력하시오");
    else {
        const frm = $('#checkfrm2')
        frm.attr('action', '/join/joinme');
        frm.attr('method', 'post');
        frm.submit();
    }
});

$('#cancel2btn').on('click', function (){
    location.href='/';
});


// userid check

    $('#userid').on('blur',function() {
    $('#uidmsg').text('아이디를 사용할 수 없습니다.');
    $('#uidmsg').attr('style', 'color:red');
});
    $('#userid').on('focus',function() {});
    $('#uidmsg').text('8~16자로 정하세요');
    $('#uidmsg').attr('style', 'color:black' );





// ajax 유저 아이디 확인
function checkuserid() {
    let uid = $('#userid').val();
    if (uid == '') {
        $('#uidmsg').text(' 8~16자의 영문 소문자, 숫자와 특수기호(_)만 사용할 수 있습니다.');
        $('#uidmsg').attr('style', 'color:black');
        return;
    }
    $.ajax({ url: '/join/checkuid',
        type: 'GET', data: { 'uid': uid } })
        .done(function(data){
            let msg = '사용불가능한 아이디입니다';
            $('#uidmsg').attr('style', 'color:red !important');

            if (data.trim() == '0') {
                msg = '사용가능한 아이디입니다';
                $('#uidmsg').attr('style', 'color:blue !important');
            }
            $('#uidmsg').text( msg );
        })
        .fail(function(xhr, status, error){
            alert(xhr.status + '/' + error);
        });
}




// check equal passwd

$('#repasswd').on('blur', function(){
    if($('#passwd').val() != $('#repasswd').val()) {
       $('#pwdmsg').text('비밀번호가 일치하지 않습니다.');
       $('#pwdmsg').attr('style','color:red !important');
        }else{
        $('#pwdmsg').text('비밀번호가 일치합니다.');
        $('#pwdmsg').attr('style', 'color:blue');
        }
});


// joinme
$('#joinbtn').on('click', function(){
if ($('#userid').val() == '')alert('아이디를 입력하세요');
    if ($('#userid').val() == '')alert('아이디를 입력하세요');
    if ($('#usertype').val() == '')alert('가입유형을 선택하세요');
else if($('#passwd').val()=='')alert('패스워드를 입력하세요');
    else if($('#passwd').val()=='' || $('#repasswd').val())
alert('비밀번호가 일치하지 않습니다.')

  else if($('#email1').val()==''||$('#email2').val()=='')alert('이메일을 정확히 입력하세요');
    else if(grecaptcha.getFrequencyResponse()=='') alert('자동가입 방지를 확인하시오');


        const frm = $('#joinfrm');
       frm.attr('action','join/joinok');
        frm.attr('method','post');
        frm.submit();

});

$('#cancelbtn').on('click', function() { location.href = '/'; });




// send email2
// option:selected => select 요소들 중 선택한 요소의 값 알아냄
$('#email3').on('change', function() {
    let val = $('#email3 option:selected').text();
    if (val == '직접입력하기') {
        $('#email2').attr('readonly', false);  // readonly 속성 해제
        $('#email2').val('');
    } else {
        $('#email2').attr('readonly', true);  // readonly 속성 잠금
        $('#email2').val(val);
    }
});

// loginbtn
$('#loginbtn').on('click', function (){
    if ($('#userid').val() == '') alert('아이디를 입력하세요!');
    else if ($('#passwd').val() == '') alert('비밀번호를 입력하세요!');
    else {
        const frm = $('#loginfrm');
        frm.attr('method','post');
        frm.attr('action','/join/login');
        frm.submit();
    }
});


// close login modal
$('#lgmbtn').on('click', function() {
    $('#loginmodal').modal('hide');
});


// logoutbtn
$('#logoutbtn').on('click', function() {
    location.href = '/join/logout';
});





