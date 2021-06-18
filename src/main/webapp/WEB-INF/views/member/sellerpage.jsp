<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link rel="stylesheet" href="/css/buts/shoppartner.css">

<!-- [[ 파트너 페이지 ]] -->

<div class="partner-wrap">

    <!-- nav -->
    <div class="partner-shade"></div>
    <div class="partner-nav">
        <ul>
            <li >
                <a href="/member/mypage"> 내 정보</a>
            </li>
            <li >
                <a href="/member/sellerpage"> 판매 목록</a>
            </li>
            <li >
                <a href="/member/buyerpage"> 구매 목록</a>
            </li>
        </ul>
    </div>

    <!-- body -->
    <div class="partner-body">

        <div id="page-wrapper">

            <!-- [[ 파트너 참여정보 ]] -->

            <form class="form" role="form" name="frm_saleitem" method="get">
                <input type="hidden" name="ap" value="saleitem">

                <div class="partner-well">
                    <select name="sca" id="sca">
                        <option value="">카테고리</option>
                        <option value="1010">&nbsp;&nbsp;&nbsp;영상</option>
                        <option value="1020">&nbsp;&nbsp;&nbsp;음악</option>
                        <option value="1030">&nbsp;&nbsp;&nbsp;게임</option>
                        <option value="1030">&nbsp;&nbsp;&nbsp;유틸</option>
                    </select>
                    <input type="text" name="searchbtn" id="searchbtn" required placeholder="검색하세요" size="70" maxlength="100">
                    <button type="submit" class="button mini border button-purple">검색</button>
                    <a href="./?ap=saleitem" class="button mini button-purple">리셋</a>
                </div>

            </form>

            <div class="title"><span class="text-purple">판매</span> 정보</div>
            <div class="title"><span class="text-purple">총</span> 판매금액</div>

            <div class="table-list scroll">
                <table >
                    <thead>
                    <tr>
                        <th scope="col">판매일</th>
                        <th scope="col">제품명</th>
                        <th scope="col">상태</th>
                        <th scope="col">결제금액</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td colspan="9">
                            <div class="empty">
                                <div class="icon"><img src="https://buts.co.kr/thema/Buts/colorset/Basic/img/icon-butsicon-big-glay.png" /></div>
                                <h5>등록된 내용이 없습니다.</h5>
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div><!-- /#page-wrapper -->
    </div><!-- /#wrapper -->
</div>