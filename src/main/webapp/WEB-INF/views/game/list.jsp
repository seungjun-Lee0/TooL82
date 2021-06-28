<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:parseNumber var="cp" value="${param.cp}"/>
<fmt:parseNumber var="sp" value="${(cp-1) / 10}" integerOnly="true"/>
<%-- 정수로 나오기 위해 integerOnly --%>
<fmt:parseNumber var="sp" value="${sp * 10 + 1}"/>
<fmt:parseNumber var="ep" value="${sp +9}"/>

<%-- 총 게시물 수를 페이지 당 게시물 수로 나눔 = 총 페이지 수 --%>
<fmt:parseNumber var="tp" value="${gmcnt / 8}" integerOnly="true"/>
<c:if test="${ (gmcnt % 8) > 0}">
    <fmt:parseNumber var="tp" value="${tp + 1}"/>
</c:if>

<%-- 글번호 --%>
<fmt:parseNumber var="snum" value="${gmcnt - (cp - 1) * 30}"/>

<%-- 페이지 링크: 검색 기능 x --%>
<c:set var="pglink" value="/game/list?cp="/>

<%-- 이미지 로고 출력 --%>
<c:set var="baseURL" value="http://localhost/cdn/" />

<script src="//code.jquery.com/jquery-1.12.4.min.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/css/personal/modal.css">


<div class="title">Coming Soon</div>
<div class="recommand-list">
    <div class="popupModalVideo">
        <a data-video="ZaSTQbfQuQg"><img src="https://img.youtube.com/vi/ZaSTQbfQuQg/mqdefault.jpg" class="recommand-thumb popup-youtube"/></a>
        <a data-video="-kiZBSp87Qw"><img src="https://img.youtube.com/vi/-kiZBSp87Qw/mqdefault.jpg" class="recommand-thumb popup-youtube" /></a>
        <a data-video="ULFAEnoc5jA"><img src="https://img.youtube.com/vi/ULFAEnoc5jA/mqdefault.jpg" class="recommand-thumb popup-youtube" /></a>
        <a data-video="UNch5YTXUc4"><img src="https://img.youtube.com/vi/UNch5YTXUc4/mqdefault.jpg" class="recommand-thumb popup-youtube" /></a>
    </div>
    <div class="video_modal_popup">
        <div class="video_modal_popup-closer"></div>
    </div>
</div>

<div class="text">
    <span class="text" style="display:inline-block; width: 260px; text-align: center;">Guilty Gear Strive</span>
    <span class="text" style="display:inline-block; margin-left: 17px; width: 260px; text-align: center;">Sniper Ghost Warrior Contract 2</span>
    <span class="text" style="display:inline-block; margin-left: 17px; width: 260px; text-align: center;">Jurassic World Evolution CE</span>
    <span class="text" style="display:inline-block; margin-left: 17px; width: 260px; text-align: center;">ANIMUS:Revenant</span>
</div>

<div class="title-wrap">
    <div class="title">
        <a href="./list.php?ca_id=10" class="text">게임</a>
    </div>
</div>

<div class="item-list">
        <c:forEach var="gm" items="${gms}">
            <c:set var="f" value="${fn:split(gm.fnames, '/')[0]}" />
            <c:set var="pos" value="${fn:indexOf(f,'.')}" />
            <c:set var="fname" value="${fn:substring(f, 0, pos)}" />
            <c:set var="fext" value="${fn:substring(f, pos+1, fn:length(f))}" />
            <div class="item-row <c:if test="${gm.party eq gm.cpartied}">disabled</c:if>
                                    <c:if test="${gm.leftd < 0 and gm.party ne gm.cpartied}">disabled</c:if>">
                <div class="item-type">
                    <span>${gm.title}</span>
                    <c:if test="${fname eq ''}">
                        <img src="https://buts.co.kr/thema/Buts/colorset/Basic/img/icon-butsicon-small-glay.png"
                             width="40" height="40" style="float: right">
                    </c:if>
                    <c:if test="${fname ne ''}">
                    <img src="${baseURL}${fname}${gm.uuid}.${fext}" width="40" height="40"
                         id="logo" style="float: right">
                    </c:if>
                </div>
                <div class="item-title">
                        ${fn:substring(gm.userid,0,3)}***
                </div>
                <div>
                    <c:if test="${gm.party eq gm.cpartied}">
                        <div class="detail-sale-badge">
                            <span class="join-ended">
                                인원 모집 완료! 새로운 공구를 기다려주세요!
                            </span>
                        </div>
                    </c:if>
                    <c:if test="${gm.leftd < 0 and gm.party ne gm.cpartied}">
                        <div class="detail-sale-badge">
                        <span class="join-ended">
                            인원 모집 실패! 새로운 공구를 기다려주세요!
                        </span>
                        </div>
                    </c:if>
                    <c:if test="${gm.party ne gm.cpartied and gm.leftd >= 0}">
                        <progress value="${gm.partyrt}" max="100" id="jb"></progress>
                    </c:if>
                </div>
                <div class="item-info">
                    <div class="item-price">
                        <del>${gm.oprice}원</del>
                        <span class="Rajdhani">${gm.sprice}</span>원
                        <span class="sale-badge">${gm.pricert}% 할인</span>
                    </div>
                    <div class="item-quantity">

                        <span class="Rajdhani">
                            <c:if test="${gm.party ne gm.cpartied and gm.leftd >= 0}">
                                ${gm.cpartied} / ${gm.party}</span>명
                        </c:if>

                    </div>
                    <div class="item-date">
                            ${gm.edate}<span class="pc-inline">까지</span>
                            <c:if test="${gm.party ne gm.cpartied and gm.leftd >= 0}">
                                (<strong>${gm.leftd}</strong>일)
                            </c:if>
                    </div>
                </div>
                <c:if test="${gm.party ne gm.cpartied and gm.leftd >= 0}">
                    <c:if test="${empty sessionScope.MyInfo.mno}">
                        <a href="/game/detail?pno=${gm.pno}&mno=-1" class="item-button"></a>
                    </c:if>
                    <c:if test="${not empty sessionScope.MyInfo.mno}">
                        <a href="/game/detail?pno=${gm.pno}&mno=${sessionScope.MyInfo.mno}" class="item-button"></a>
                    </c:if>
                </c:if>
            </div>
        </c:forEach>

</div>
<div class="item-more">
    <button id="tryit" title="더보기">
        더보기
    </button>
</div>


<div class="apages">
    <c:forEach var="i" begin="${sp}" end="${tp}" step="1">
        <%--					표시된 페이지 i가 총페이지수보다 작거나 같을 동안만 출력--%>
        <c:if test="${i le tp}">
            <input type="hidden" id="page" class="page" value="${i+1}"/>
        </c:if>
        <c:if test="${i eq tp}">
            <input type="hidden" id="epage" class="epage" value="${i}"/>
        </c:if>
    </c:forEach>
    <input type="hidden" id="cpage" value="2">
    <input type="hidden" id="spage" class="spage" value="${sp}"/>
    <input type="hidden" id="plink" class="plink" value="${pglink}"/>
    <input type="hidden" id="tpage" class="tpage" value="${tp}"/>
</div>

<script src="/js/modal.js"></script>