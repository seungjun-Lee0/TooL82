<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="//code.jquery.com/jquery-1.12.4.min.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/css/personal/modal.css">

<style>
    .cologo li {
        border: solid 1px #cec8f1;
        float: left;
    }
</style>

<div class="title-wrap">
    <div class="title">곧 <span class="text-purple">마감</span> 되는 공구 목록
        <span class="title-text">&nbsp&nbsp&nbsp<span class="text-purple">8282</span> 서두르세요!!</span></div>

</div>

<div class="item-slide party">
    <a href="" class="slide-navi prev"></a>
    <a href="" class="slide-navi next"></a>
    <div class="item-boundary">
        <div class="item-list">
                <c:forEach var="hm" items="${hms}">
                    <c:if test="${hm.category eq 'm'}">
                        <c:set var="category" value="music" />
                    </c:if>
                    <c:if test="${hm.category eq 'v'}">
                        <c:set var="category" value="video" />
                    </c:if>
                    <c:if test="${hm.category eq 'u'}">
                        <c:set var="category" value="util" />
                    </c:if>
                    <c:if test="${hm.category eq 'g'}">
                        <c:set var="category" value="game" />
                    </c:if>
                    <div class="item-row <c:if test="${hm.party eq hm.cpartied}">disabled</c:if>">
                        <div class="item-type">
                            <span>${hm.title}</span>
                            <img src="https://buts.co.kr/thema/Buts/colorset/Basic/img/icon-butsicon-small-glay.png" alt="" id="logo" style="float: right"/>
                        </div>
                        <div class="item-title">
                                ${fn:substring(hm.userid,0,3)}***
                        </div>
                        <div>
                            <c:if test="${hm.party eq hm.cpartied}">
                                <div class="detail-sale-badge">
                        <span class="join-ended">
                            인원 모집 완료! 새로운 공구를 기다려주세요!
                        </span>
                                </div>
                            </c:if>
                            <c:if test="${hm.party ne hm.cpartied}">
                                <progress value="${hm.partyrt}" max="100" id="jb"></progress>
                            </c:if>
                        </div>
                        <div class="item-info">
                            <div class="item-price">
                                <del>${hm.oprice}원</del>
                                <span class="Rajdhani">${hm.sprice}</span>원
                                <span class="sale-badge">${hm.pricert}% 할인</span>
                            </div>
                            <div class="item-quantity">

                    <span class="Rajdhani">
                        <c:if test="${hm.party ne hm.cpartied}">
                            ${hm.cpartied} / ${hm.party}</span>명
                                </c:if>

                            </div>
                            <div class="item-date">
                                    ${hm.edate}<span class="pc-inline">까지</span>
                                <c:if test="${hm.party ne hm.cpartied}">
                                    (<strong>${hm.leftd}</strong>일)
                                </c:if>
                            </div>
                        </div>
                        <c:if test="${hm.party ne hm.cpartied}">
                            <a href="/${category}/detail?pno=${hm.pno}" class="item-button"></a>
                        </c:if>
                    </div>
                </c:forEach>
        </div>
    </div>
</div>

<!-- event -->
<div class="event-slide event">
    <a href="" class="slide-navi prev"></a>
    <a href="" class="slide-navi next"></a>
    <div class="event-boundary">
        <div class="event-list" style="padding-bottom: 5px;">
            <img src="/banner/tool82_banner1.png" alt="banner1" />
        </div>
        <div class="event-list">
            <img src="/banner/tool82_banner2.png" alt="banner2" />
        </div>
    </div>
    <div class="indicator"></div>
</div>

<!-- recommand -->
<div class="title">TooL82 <span class="text-purple">추천</span> 신작게임 트레일러!!</div>
<div class="recommand-list" style="padding-bottom: 50px">
    <div class="popupModalVideo">
        <a data-video="ssrNcwxALS4"><img src="https://img.youtube.com/vi/ssrNcwxALS4/mqdefault.jpg" class="recommand-thumb popup-youtube"/></a>
        <a data-video="bMcrXmaocv0"><img src="https://img.youtube.com/vi/bMcrXmaocv0/mqdefault.jpg" class="recommand-thumb popup-youtube" /></a>
        <a data-video="55PRv_e00wc"><img src="https://img.youtube.com/vi/55PRv_e00wc/mqdefault.jpg" class="recommand-thumb popup-youtube" /></a>
        <a data-video="3TL1ueQlBz8"><img src="https://img.youtube.com/vi/3TL1ueQlBz8/mqdefault.jpg" class="recommand-thumb popup-youtube" /></a>
    </div>
    <div class="video_modal_popup">
        <div class="video_modal_popup-closer"></div>
    </div>
</div>

<div class="form-half form-round signup" style="height: 350px">
    <div class="title" style="margin-top: 0px"> <span class="title-text">공지사항</span></div>
    <table>
        <thead>
        <tr>
            <th class="pc-table">번호</th>
            <th>제목</th>
            <th style="width: 100px">등록일</th>
            <th class="pc-table">조회</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="hmn" items="${hmns}">
            <tr class="">
                <td class="pc-table" style="width: 10%">${hmn.bno}</td>
                <td>
                    <div class="subject">
                        <a href="/notice/detail?bno=${hmn.bno}">
                                ${hmn.title}																													</a>
                    </div>
                </td>
                <td>${fn:substring(hmn.regdate,0,10)}</td>
                <td class="pc-table" style="width: 10%">${hmn.views}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<div class="form-half form-round signup" style="height: 350px; margin-left: 30px">
    <div class="title" style="margin-top: 0px"> <span class="title-text">협력사</span></div>

    <ul class="cologo" style="margin-top: 40px;margin-left: 5px;">
        <li><img src="/logo/Ableton.png" width="85" height="85"/></li>
        <li><img src="/logo/Acidpro.png" width="85" height="85"/></li>
        <li><img src="/logo/Autocad.png" width="85" height="85"/></li>
        <li><img src="/logo/Finale.png" width="85" height="85"/></li>
        <li><img src="/logo/Nintendo.png" width="85" height="85"/></li>
        <li><img src="/logo/Notion6.png" width="85" height="85"/></li>
        <li><img src="/logo/Picsart.png" width="85" height="85"/></li>
        <li><img src="/logo/Playstation.png" width="85" height="85"/></li>
        <li><img src="/logo/Solidwork.jpg" width="85" height="85"/></li>
        <li><img src="/logo/Steam.jpeg" width="85" height="85"/></li>
    </ul>
</div>

<script src="/js/modal.js"></script>