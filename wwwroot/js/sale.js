$(document).ready(function() {
    // email
    $('#email3').on('change', function() {
        let val = $('#email3 option:selected').text();
        if (val == '직접입력하기') {
            $('#email2').attr('readonly', false);
            $('#email2').val('');
        } else {
            $('#email2').attr('readonly', true);
            $('#email2').val(val);
        }
    });

    // datepicker
    if ($.fn.datepicker) {
        $("#sdate").datepicker({
            dateFormat: 'yy-mm-dd',
            minDate: 0,
            maxDate: "+7D"
        });
        $("#edate").datepicker({
            dateFormat: 'yy-mm-dd',
            minDate: +1,
            maxDate: "+6M"
        });
    }

    // change file name
    $('#img1').on('change', function() {
        var fname = $(this).val();
        fname = fname.substring(fname.lastIndexOf("\\") + 1);
        $(this).next('.custom-file-label').html(fname);
    });

    $('#img2').on('change', function() {
        var fname = $(this).val();
        fname = fname.substring(fname.lastIndexOf("\\") + 1);
        $(this).next('.custom-file-label').html(fname);
    });

    // sale submit
    $('#sellbtn').on('click', function() {
        var isValid = true;

        if ($('#category').length && ($('#category').val() == '' || $('#category').val() == '기본 분류 선택')) {
            if (document.querySelector('#cat_warn'))
                document.querySelector('#cat_warn').innerHTML = '<font color="#dc143c">판매할 서비스를 설정해주세요</font>';
            isValid = false;
        }

        if ($('#title').val() == '' || $('#title').val() == '제품 이름') {
            if (document.querySelector('#tit_warn'))
                document.querySelector('#tit_warn').innerHTML = '<font color="#dc143c">제품 이름을 작성해주세요</font>';
            isValid = false;
        }

        if ($('#party').val() == '' || $('#party').val() == '총 인원수' || parseInt($('#party').val()) <= 9) {
            if (document.querySelector('#prt_warn'))
                document.querySelector('#prt_warn').innerHTML = '<font color="#dc143c">최소 10명부터 모집해야합니다.</font>';
            isValid = false;
        }

        if (isValid) {
            if ($('#email1').length && $('#email2').length) {
                $('#email').val($('#email1').val() + '@' + $('#email2').val());
            }

            const frm = $('#sellfrm');
            if (frm.length) {
                frm.attr("method", "post");
                frm.attr('action', "/Sale/Create");
                frm.attr('enctype', "multipart/form-data");
                frm.submit();
                alert('판매 등록이 완료되었습니다!');
            }
        }
    });

    // update sale item
    $('#updatebtn').on('click', function () {
        location.href = '/Sale/Edit?pno=' + $('#pno').val();
    });

    // checkbox for image update
    $('#die1').on('change', function () {
        if ($('#die1').is(':checked')) {
            $('#img1').attr('disabled', false);
            $('#todie').val($('#todie').val() + "1");
        } else {
            $('#img1').attr('disabled', true);
            $('#todie').val($('#todie').val().replace(/1/g, ''));
        }
    });

    $('#die2').on('change', function () {
        if ($('#die2').is(':checked')) {
            $('#img2').attr('disabled', false);
            $('#todie').val($('#todie').val() + "2");
        } else {
            $('#img2').attr('disabled', true);
            $('#todie').val($('#todie').val().replace(/2/g, ''));
        }
    });

    // update submit
    $('#updateokbtn').on('click', function () {
        if ($('#email1').length && $('#email2').length) {
            $('#email').val($('#email1').val() + '@' + $('#email2').val());
        }

        const frm = $('#updatefrm');
        if (frm.length) {
            frm.attr("method", "post");
            frm.attr('action', "/Sale/Edit");
            frm.attr('enctype', "multipart/form-data");
            frm.submit();
            alert('판매 수정이 완료되었습니다!');
        }
    });

    // delete buttons
    $('#deleteubtn, #deletegbtn, #deletembtn, #deletevbtn').on('click', function () {
        if (confirm("삭제된 게시물은 복구 하실 수 없습니다. 정말 삭제하시겠습니까?")) {
            var frm = $(this).closest('form');
            if (frm.length) {
                frm.attr("method", "post");
                frm.attr('action', "/Sale/Delete");
                frm.submit();
            }
        }
    });
});
