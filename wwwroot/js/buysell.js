$(document).ready(function() {
    // search seller board
    $('#findsellbtn').on('click', function() {
        if ($('#findtype2').val() == null) {
            alert('카테고리를 선택해주세요.');
        } else {
            let qry = '?ftype=' + $('#findtype2').val();
            qry += "&fkey=" + $('#findkey').val();
            let url = '/Purchase/SellerSearch' + qry;
            location.href = url;
        }
    });

    // search buyer board
    $('#findbuybtn').on('click', function() {
        if ($('#findtype1').val() == null) {
            alert('카테고리를 선택해주세요.');
        } else {
            let qry = '?ftype=' + $('#findtype1').val();
            qry += "&fkey=" + $('#findkey1').val();
            let url = '/Purchase/BuyerSearch' + qry;
            location.href = url;
        }
    });
});
