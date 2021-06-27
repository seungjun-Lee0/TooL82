
// current buy rate
$('.bar-percentage[data-percentage]').each(function () {
    var progress = $(this);
    var percentage = Math.ceil($(this).attr('data-percentage'));
    $({countNum: 0}).animate({countNum: percentage}, {
        duration: 2000,
        easing:'linear',
        step: function() {
            var pct = Math.floor(this.countNum) + '%';
            progress.text('달성률: ' + pct) && progress.siblings().children().css('width',pct);
        }
    });
});





// to the top
$( document ).ready( function() {
    $( window ).scroll( function() {
        if ( $( this ).scrollTop() > 200 ) {
            $( '.top' ).fadeIn();
        } else {
            $( '.top' ).fadeOut();
        }
    } );
    $( '.top' ).click( function() {
        $( 'html, body' ).animate( { scrollTop : 0 }, 400 );
        return false;
    } );
} );




// 더보기 버튼
$(document).on("click","#tryit", function (){
    const fullContent = document.querySelector('.item-list');
    const xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === xhr.DONE) {
            if (xhr.status === 200 || xhr.status === 201) {
                const data = xhr.response; // 다음페이지의 정보
                const addList = data.querySelector('.item-list'); // 다음페이지에서 list아이템을 획득
                fullContent.appendChild(addList); // infinite에 list를 더해주기
                oneTime = false;
            } else {
                console.error(xhr.response);
            }
        }
    }

    xhr.open('GET',  $('#plink').val() + $('#cpage').val()); // 다음페이지의 정보를 get
    xhr.send();
    xhr.responseType = "document";

    var number = $('#cpage').val();
    number++
    $('#cpage').val(number);

    if ( $('#cpage').val() > $('#tpage').val() + 1 ) {
        $('#tryit').hide();
    }
});

$('#buyreqgamebtn').on('click', function () {
    if (confirm("신청된 구매요청은 취소 하실 수 없습니다. 정말 구매하시겠습니까?") == true){    //확인
        const frm = $('#buygamefrm');
        frm.attr("method", "post");
        frm.attr('action', "/game/detail");
        frm.attr('enctype', "multipart/form-data");
        frm.submit();
    }else{   //취소
        return;
    }
});

$('#buyreqmusicbtn').on('click', function () {
    if (confirm("신청된 구매요청은 취소 하실 수 없습니다. 정말 구매하시겠습니까?") == true){    //확인
        const frm = $('#buymusicfrm');
        frm.attr("method", "post");
        frm.attr('action', "/music/detail");
        frm.attr('enctype', "multipart/form-data");
        frm.submit();
    }else{   //취소
        return;
    }
});

$('#buyrequtilbtn').on('click', function () {
    if (confirm("신청된 구매요청은 취소 하실 수 없습니다. 정말 구매하시겠습니까?") == true){    //확인
        const frm = $('#buyutilfrm');
        frm.attr("method", "post");
        frm.attr('action', "/util/detail");
        frm.attr('enctype', "multipart/form-data");
        frm.submit();
    }else{   //취소
        return;
    }
});


$('#buyreqvideobtn').on('click', function () {
    if (confirm("신청된 구매요청은 취소 하실 수 없습니다. 정말 구매하시겠습니까?") == true){    //확인
        const frm = $('#buyvideofrm');
        frm.attr("method", "post");
        frm.attr('action', "/video/detail");
        frm.attr('enctype', "multipart/form-data");
        frm.submit();
    }else{   //취소
        return;
    }
});
