$(document).ready(function() {
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
    $(window).scroll(function() {
        if ($(this).scrollTop() > 200) {
            $('.top').fadeIn();
        } else {
            $('.top').fadeOut();
        }
    });

    $('.top').click(function() {
        $('html, body').animate({ scrollTop : 0 }, 400);
        return false;
    });

    // 더보기 버튼
    $(document).on("click", "#tryit", function () {
        var plink = $('#plink').val();
        var cpage = $('#cpage').val();

        // 필요한 요소가 없으면 실행하지 않음
        if (!plink || !cpage) {
            return;
        }

        const fullContent = document.querySelector('.item-list');
        const xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function () {
            if (xhr.readyState === xhr.DONE) {
                if (xhr.status === 200 || xhr.status === 201) {
                    const data = xhr.response;
                    const addList = data.querySelector('.item-list');
                    if (addList) {
                        fullContent.appendChild(addList);
                    }
                } else {
                    console.error(xhr.response);
                }
            }
        }

        xhr.open('GET', plink + cpage);
        xhr.send();
        xhr.responseType = "document";

        var number = parseInt(cpage);
        number++;
        $('#cpage').val(number);

        var tpage = parseInt($('#tpage').val());
        if (number > tpage + 1) {
            $('#tryit').hide();
        }
    });

    // 구매 버튼 핸들러
    $('#buyreqgamebtn, #buyreqmusicbtn, #buyrequtilbtn, #buyreqvideobtn').on('click', function () {
        if (confirm("신청된 구매요청은 취소 하실 수 없습니다. 정말 구매하시겠습니까?")) {
            var frm = $(this).closest('form');
            if (frm.length === 0) {
                // 버튼 ID로 폼 찾기
                var btnId = $(this).attr('id');
                if (btnId === 'buyreqgamebtn') frm = $('#buygamefrm');
                else if (btnId === 'buyreqmusicbtn') frm = $('#buymusicfrm');
                else if (btnId === 'buyrequtilbtn') frm = $('#buyutilfrm');
                else if (btnId === 'buyreqvideobtn') frm = $('#buyvideofrm');
            }
            if (frm.length > 0) {
                frm.submit();
            }
        }
    });
});
