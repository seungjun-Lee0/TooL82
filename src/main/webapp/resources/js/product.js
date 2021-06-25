
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




// next page

$(document).on("click","#tryit", function (){
    madeBox();
});

function madeBox() { // 만약 버튼을 클릭했다면
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

}


function button_event(){
    if (confirm("정말 구매하시겠습니까?") == true){    //확인
        document.form.submit();
    }else{   //취소
        return;
    }
}



// buy agree
// $('#buyreqbtn').click(function () {
//     if ($('#chk_confirm').is(":checked") == false)
//         alert('동의 여부를 확인해주세요.');
//     else if ($('#chk_confirm').is(":checked") == true) {
//         if (confirm("정말 구매하시겠습니까?") == true){
//         var data = {}
//         data["pno"] = $('#pno').val();
//         data["mno"] = $('#mno').val();
//         data["category"] = $('#category').val();
//         data["title"] = $('#title').val();
//         data["edate"] = $('#enddate').val();
//         data["sprice"] = $('#sprice').val();
//         location.href = '/game/buy?pno=' + $('#pno').val();
//         $.ajax({
//             type : "POST",
//             url : "/game/buy",
//             dataType : 'json',
//             data : JSON.stringify(data) ,
//             contentType: "application/json; charset=UTF-8",
//             success : function(response) {
//                         alert(response.message);
//                     },
//             error : function(request, status, error) {
//                 alert(response.message);
//             }
//         });
//     }
//     } else
//         return;
// });

$('#buyreqbtn').on('click', function () {
    const frm = $('#buyfrm');
    frm.attr("method", "post");
    frm.attr('action', "/game/buy");
    frm.attr('enctype', "multipart/form-data");
    frm.submit();
})


