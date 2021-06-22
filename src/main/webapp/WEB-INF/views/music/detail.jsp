<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="fnames" value="${fn:split(mc.fnames, '/' )}" />
<c:set var="baseURL" value="http://localhost/cdn/" />

<div class="title-wrap title-wrap-border">
    <div class="title">
        <a href="./music/list" class="text">음악</a>
    </div>
</div>

<div class="item-view-title">
    <div class="symbol">
        <c:set var="f" value="${fnames[0]}" />
        <c:set var="pos" value="${fn:indexOf(f, '.')}" />
        <c:set var="fname" value="${fn:substring(f, 0, pos)}" />
        <c:set var="fext" value="${fn:substring(f, pos+1, fn:length(f))}" />
        <div>
            <c:if test="${fname ne ''}">
                <img src="${baseURL}${fname}${mc.uuid}.${fext}" class="img-fluid">
            </c:if>
        </div>
    </div>
    <div class="subject" id="title" name="title">${mc.title}️</div>
</div>

<div class="item-view-row">
	<span class="picture">
		<img src="https://buts.co.kr/thema/Buts/colorset/Basic/img/icon-butsicon-small.png" alt="" />
	</span>
    <span id="userid" name="userid">${fn:substring(mc.userid,0,3)}***</span>
    <span class="right pc-block">판매글 번호 : <span class="lightgrey">${mc.pno}</span></span>
</div>

<div class="item-view-row">
    <div class="bar-wrap">
        <div class="bar-percentage" data-percentage="${mc.partyrt+1}"></div>
        <div class="bar-container">
            <div class="bar"></div>
        </div>
    </div>

    <br>
</div>

<div class="item-view-row">
		<span > 종료일 :
            <span class="fw300" id="enddate">
                ${mc.edate}
            </span>
            <span class="lightgrey">
                (${mc.leftd}일)
            </span>
	    </span>

    <span class="v-bar left">판매가 :
        <span class="sale-price">${mc.oprice}</span>
        <span class="price Rajdhani text-purple">${mc.sprice}</span>
        <span class="lightgrey"> 원</span></span>
    <span class="detail-sale-badge">${mc.pricert}% 할인</span>

    <span class="v-bar left"> 남은 인원 :
            <span class="fw300" id="party">
                ${mc.party - mc.cpartied}
            </span>명
    </span>
</div>

<div class="empty" id="detailimg">
    <c:if test = "${fname eq '' || fname eq null}">
        <div class="icon"><img src="https://buts.co.kr/thema/Buts/colorset/Basic/img/icon-butsicon-big-glay.png" /></div>
    </c:if>
    <c:if test = "${fname ne ''}">
            <c:set var="f" value="${fnames[1]}" />
            <c:set var="pos" value="${fn:indexOf(f, '.')}" />
            <c:set var="fname" value="${fn:substring(f, 0, pos)}" />
            <c:set var="fext" value="${fn:substring(f, pos+1, fn:length(f))}" />
            <div>
                <img src="${baseURL}${fname}${mc.uuid}.${fext}" class="img-fluid">
            </div>
    </c:if>
</div>

<div class="item-view-caution">
    <div class="text" id="contents">
        ${mc.contents}
    </div>
</div>

<form>

    <div class="item-view-check">
        <div class="input-check item-view-confirm">
            <input type="checkbox" id="chk_confirm" name="chk_confirm" />
            <label for="chk_confirm">파티 규칙에 대한 내용 확인 및 파티 알림 수신에 동의합니다.</label>
        </div>
    </div>
    <br>
    <div class="item-view-caution" style="border-color:#7e69fe; background-color: #ffffff;">
        <div class="text">
            <b>[툴팔이에서 알려 드립니다.]</b><br>
            개인 거래를 유도하여 피해가 생기는 경우가 발생되고 있습니다.<br>
            툴팔이를 통하지 않는 <span style="color:#7e69fe;">개인간의 거래에 대해서는 어떠한 경우에도 보상 및 책임지지 않습니다.</span><br>
            연락을 유도하여 개인거래를 진행하거나 타 사이트를 홍보하는 경우 '툴팔이'에 신고 부탁 드립니다.<br>
        </div>
    </div>

    <div class="button-align center">
        <a href="/music/list" class="button large">목록</a>

        <button type="button" class="button large button-purple" id="buyreqbtn">구매신청</button>
    </div>

</form>

<div class="sns-share-icon">
</div>

<div class="button-align right button-align-border">
    <a href="./item.php?it_id=1593077843&amp;ca_id=10" class="button small border button-purple">이전</a>
    <a href="./item.php?it_id=1593077843&amp;ca_id=10" class="button small border button-purple">다음</a>
    <div class="float-right">
    </div>
</div>