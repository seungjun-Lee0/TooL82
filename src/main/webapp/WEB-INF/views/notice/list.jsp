<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="title-wrap title-wrap-borderborder">
    <div class="title">
        <a href="" class="text">공지사항</a>
    </div>
    <div class="title-right">
        <div class="search-bar">
            <form name="fsearch" method="get" role="form">
                <input type="hidden" name="bo_table" value="notice">
                <input type="hidden" name="sca" value="">
                <input type="hidden" name="sop" value="and">
                <select name="sfl" id="sfl">
                    <option value="wr_subject">제목</option>
                    <option value="wr_content">내용</option>
                    <option value="wr_subject||wr_content">제목+내용</option>
                    <option value="mb_id,1">회원아이디</option>
                    <option value="mb_id,0">회원아이디(코)</option>
                    <option value="wr_name,1">글쓴이</option>
                    <option value="wr_name,0">글쓴이(코)</option>
                </select>
                <input type="text" name="stx" value="" required id="stx" maxlength="20" placeholder="검색어를 입력해 주세요">
                <button type="submit" class="submit">
                    <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABMAAAATCAIAAAD9MqGbAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAZtJREFUeNqUk78vQ1Ecxc/tj4mIpqqlJiEhDZI+lfjRsEmsEouhu4U/xYJZwmAxCmMr7aA/EpHGQLr49Sgh6Nb2Orev+l6pas/wXt6953O/997veUJKiW8960gn5FUWb3n16fJgKABtRvT48FvCIEtFnBzKZBSWdb4dAloYi8vC6fxFEtvfkblL2B0IzWNME54+NZd/wEVaLUfD4AhW1wQNdeTRgTyLosul5rz+nzUf77C/Ld9fMbWApRVRG7fldaROVbWGGMVBTjkcSMVAs0lmErJcxmQYDbEazKPSRrNJ8iap8ZBAUxkGw1wlXysN8A00B+GtGAxzlURrKpfU0263kGw3pd/+Q7JDVLfbQg4H1It9a04ahsFRCxmcFjYbUlHVt7/0dK8MtDGJJsm4sCXFomp3Q5iDe1uSBm0ORrb+TN9ESLgrEX/RcZ6spo/q9SOyLjo620l8cBY3ObVnKyysfxnDlY7L66zqG+vzJnklPBs3WfjE7qa0wnVkc5lwPyIbotUkUKxDgBjhTBw8WHsqfMjYsXx/k18CDACJhvJ23Xt3WQAAAABJRU5ErkJggg==" alt="" />
                </button>
            </form>
        </div>
    </div>
</div>

<form name="fboardlist" id="fboardlist" action="./board_list_update.php" onsubmit="return fboardlist_submit(this);" method="post" role="form" class="form">
    <input type="hidden" name="bo_table" value="notice">
    <input type="hidden" name="sfl" value="">
    <input type="hidden" name="stx" value="">
    <input type="hidden" name="spt" value="">
    <input type="hidden" name="sca" value="">
    <input type="hidden" name="sst" value="wr_num, wr_reply">
    <input type="hidden" name="sod" value="">
    <input type="hidden" name="page" value="1">
    <input type="hidden" name="sw" value="">

    <div class="table-list list-wrap">
        <table>
            <thead>
            <tr>
                <th class="pc-table">번호</th>
                <th>제목</th>
                <th>등록일</th>
                <th class="pc-table">조회</th>
            </tr>
            </thead>
            <tbody>
            <tr class="active">
                <td class="pc-table" style="width: 10%">공지</td>
                <td>
                    <div class="subject notice">
                        <a href="https://buts.co.kr/bbs/board.php?bo_table=notice&amp;wr_id=30">
                            [공지] 무료 계정 및 무료로 배포되는 이용권을 이용한 파티 모집 제한												<span class="wr-icon wr-hot"></span>																	</a>
                    </div>
                </td>
                <td>2020.12.11</td>
                <td class="pc-table" style="width: 10%">2111</td>
            </tr>
            <tr class="">
                <td class="pc-table" style="width: 10%">13</td>
                <td>
                    <div class="subject">
                        <a href="/notice/detail">
                            [2021.06.14] 벗츠 먹튀 파티장에 대한 조치 진행 안내																													</a>
                    </div>
                </td>
                <td>06.14</td>
                <td class="pc-table" style="width: 10%">75</td>
            </tr>

            </tbody>
        </table>
    </div>

    <div class="page-number">
        <ul>
            <li class="disabled"><a><i class="fa fa-angle-double-left"></i></a></li><li class="disabled"><a><i class="fa fa-angle-left"></i></a></li><li class="active"><a>1</a></li><li class="disabled"><a><i class="fa fa-angle-right"></i></a></li><li class="disabled"><a><i class="fa fa-angle-double-right"></i></a></li>							</ul>
    </div>

    <div class="button-align right mg-top-0">
    </div>

</form>
