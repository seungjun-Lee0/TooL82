
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


// buy agree
$('#buyreqbtn').click(function () {
    if ($('#chk_confirm').is(":checked") == false)
        alert('동의 여부를 확인해주세요.');
    else
        location.href='/game/list';
})


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
    // console.log($('#epage').val());
    // console.log($('#cpage').val());
    // console.log($('#tpage').val());
});


// $(document).on("click","#tryit2", function (){
//     const fullContent = document.querySelector('.item-box');
//     var btn = document.createElement("button");
//     btn.setAttribute("id","tryit")
//     var t = document.createTextNode("더보기");
//     btn.appendChild(t);
//     fullContent.appendChild(btn);
//     $('#tryit2').remove();
//     madeBox();
// });

function madeBox() { // 만약 버튼을 클릭했다면
    const itemContent = document.querySelector('.item-list');
    const fullContent = document.querySelector('.next-page');
    const xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === xhr.DONE) {
            if (xhr.status === 200 || xhr.status === 201) {
                const data = xhr.response; // 다음페이지의 정보
                const addList = data.querySelector('.item-box'); // 다음페이지에서 list아이템을 획득
                itemContent.appendChild(addList); // itemContent에 list를 더해주기
                if ($('#cpage').val() < $('#tpage').val()) {    // 다음페이지에서 버튼아이템을 획득
                    const addList2 = data.querySelector('.next-item');
                    fullContent.appendChild(addList2); // fullContent에 list를 더해주기
                }
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

    if ($('#cpage').val() >= $('#tpage').val() + 1 ) {
        $('#tryit').remove();
    }

}
