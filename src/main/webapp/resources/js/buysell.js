// search board
$('#findsellbtn').on('click', function(){
    if ($('#findtype2').val() == null ) alert('카테고리를 선택해주세요.');
    else {
        let mno = '?mno=' + $('#mno').val();
        let qry = '&findtype=' + $('#findtype2').val();
        qry += "&findkey=" + $('#findkey').val() + "&cp=1";
        let url = '/member/sellfind' + mno + qry;
        location.href = url;
    }
});

// search board
$('#findbuybtn').on('click', function(){
    if ($('#findtype1').val() == null ) alert('카테고리를 선택해주세요.');
    else {
        let mno = '?mno=' + $('#mno').val();
        let qry = '&findtype=' + $('#findtype1').val();
        qry += "&findkey=" + $('#findkey1').val() + "&cp=1";
        let url = '/member/buyfind' + mno + qry;
        location.href = url;
    }
});
