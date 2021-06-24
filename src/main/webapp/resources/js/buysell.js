// search board
$('#findsellbtn').on('click', function(){
    if ($('#findtype').val() == ' ' || $('#findtype').val() == '검색 범위') alert('검색할 범위를 지정해야합니다.');
    else {
        let qry = '?findtype=' + $('#findtype').val();
        qry += "&findkey=" + $('#findkey').val() + "&cp=1";
        let url = '/member/sellfind' + qry;
        location.href = url;
    }
});
