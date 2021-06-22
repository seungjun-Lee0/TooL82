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
<fmt:parseNumber var="tp" value="${vdcnt / 8}" integerOnly="true"/>
<c:if test="${ (vdcnt % 8) > 0}">
    <fmt:parseNumber var="tp" value="${tp + 1}"/>
</c:if>

<%-- 글번호 --%>
<fmt:parseNumber var="snum" value="${vdcnt - (cp - 1) * 30}"/>

<%-- 페이지 링크: 검색 기능 x --%>
<c:set var="pglink" value="/video/list?cp="/>



<div id="sct_hhtml" style="background-color:#242424;"></div>
<div class="title">Coming Soon</div>
<div class="recommand-list">
    <a href="https://www.youtube.com/watch?v=jjKCQCf7iEQ" class="recommand-thumb popup-youtube"><img src="https://img.youtube.com/vi/jjKCQCf7iEQ/mqdefault.jpg" alt="" /></a>
    <a href="https://www.youtube.com/watch?v=Q-RChtPvRao" class="recommand-thumb popup-youtube"><img src="https://img.youtube.com/vi/Q-RChtPvRao/mqdefault.jpg" alt="" /></a>
    <a href="https://www.youtube.com/watch?v=OBN-XOR5xG4" class="recommand-thumb popup-youtube"><img src="https://img.youtube.com/vi/OBN-XOR5xG4/mqdefault.jpg" alt="" /></a>
    <a href="https://www.youtube.com/watch?v=Kem4BZ0qQsU" class="recommand-thumb popup-youtube"><img src="https://img.youtube.com/vi/Kem4BZ0qQsU/mqdefault.jpg" alt="" /></a>
</div>
<div class="text">
    <span class="text" style="display:inline-block; width: 260px; text-align: center;">Adobe Premiere Pro</span>
    <span class="text" style="display:inline-block; margin-left: 17px; width: 260px; text-align: center;">Vegas Pro</span>
    <span class="text" style="display:inline-block; margin-left: 17px; width: 260px; text-align: center;">LumaFusion</span>
    <span class="text" style="display:inline-block; margin-left: 17px; width: 260px; text-align: center;">KineMaster</span>
</div>

<div class="title-wrap">
    <div class="title">
        <a href="/video/list" class="text">영상</a>
    </div>
</div>

<div class="item-list">
    <div class="item-box">
        <c:forEach var="vd" items="${vds}">
            <div class="item-row <c:if test="${vd.party eq vd.cpartied}">disabled</c:if>">
                <div class="item-type">
                    <span>${vd.title}</span>
                    <img src="https://buts.co.kr/thema/Buts/colorset/Basic/img/icon-butsicon-small-glay.png" alt="" id="logo" style="float: right"/>
                </div>
                <div class="item-title">
                        ${fn:substring(vd.userid,0,3)}***
                </div>
                <div>
                    <c:if test="${vd.party eq vd.cpartied}">
                        <div class="detail-sale-badge">
                            <span class="join-ended">
                                인원 모집 완료! 새로운 공구를 기다려주세요!
                            </span>
                        </div>
                    </c:if>
                    <c:if test="${vd.party ne vd.cpartied}">
                        <progress value="${vd.partyrt}" max="100" id="jb"></progress>
                    </c:if>
                </div>
                <div class="item-info">
                    <div class="item-price">
                        <del>${vd.oprice}원</del>
                        <span class="Rajdhani">${vd.sprice}</span>원
                        <span class="sale-badge">${vd.pricert}% 할인</span>
                    </div>
                    <div class="item-quantity">

                        <span class="Rajdhani">
                            <c:if test="${vd.party ne vd.cpartied}">
                                ${vd.cpartied} / ${vd.party}</span>명
                        </c:if>

                    </div>
                    <div class="item-date">
                            ${vd.edate}<span class="pc-inline">까지</span>
                            <c:if test="${vd.party ne vd.cpartied}">
                                (<strong>${vd.leftd}</strong>일)
                            </c:if>
                    </div>
                </div>
                <c:if test="${vd.party ne vd.cpartied}">
                    <a href="/video/detail?pno=${vd.pno}" class="item-button"></a>
                </c:if>
            </div>
        </c:forEach>
    </div>
</div>


<div class="next-page">
    <div class="next-item" style="text-align: center">
        <c:if test="${tp ne 1}">
            <span type="button" class="page-button" id="tryit">더보기</span>
        </c:if>
    </div>
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