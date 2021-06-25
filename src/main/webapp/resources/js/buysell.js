// search board
$('#findsellbtn').on('click', function(){
    if ($('#findkey').val() == null ) alert('검색 내용을 작성해주세요.');
    else {
        let qry = '?findtype=' + $('#findtype').val();
        qry += "&findkey=" + $('#findkey').val() + "&cp=1";
        let url = '/member/sellfind' + qry;
        location.href = url;
    }
});
