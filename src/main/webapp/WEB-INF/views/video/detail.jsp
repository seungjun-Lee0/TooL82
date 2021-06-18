<%@ page contentType="text/html;charset=UTF-8"%>

<div class="title-wrap title-wrap-border">
    <div class="title">
        <a href="./list.php?ca_id=10" class="text">영상</a>
    </div>
</div>

<div class="item-view-title">
    <div class="symbol">
        <img src="https://buts.co.kr/thema/Buts/colorset/category/1010.jpg" alt="" />
    </div>
    <div class="subject" id="title" name="title">제목️</div>
</div>

<div class="item-view-row">
	<span class="picture">
		<img src="https://buts.co.kr/thema/Buts/colorset/Basic/img/icon-butsicon-small.png" alt="" />
	</span>
    <span id="userid" name="userid">로얄넷플릭스</span>
    <span class="right pc-block">판매글 번호 : <span class="lightgrey">1623659333</span></span>
</div>

<div class="item-view-row">
		<span > 종료일 :
		<span class="fw300" id="enddate">
			2022.05.11
        </span>
		<span class="lightgrey">
		    (331일)
        </span>
	</span>

    <span class="v-bar left">판매가 : <span class="price Rajdhani text-purple">33,100</span><span class="lightgrey"> 원</span></span>
</div>

<div class="empty" id="detailimg">
    <div class="icon"><img src="https://buts.co.kr/thema/Buts/colorset/Basic/img/icon-butsicon-big-glay.png" /></div>
</div>

<div class="item-view-caution">
    <div class="text" id="contents">
        상세 내용 입력
    </div>
</div>

<form name="fitem" method="post" action="https://buts.co.kr/shop/cartupdate.php" role="form" onsubmit="return fitem_submit(this);">
    <input type="hidden" name="it_id[]" value="1623659333">
    <input type="hidden" name="it_msg1[]" value="">
    <input type="hidden" name="it_msg2[]" value="">
    <input type="hidden" name="it_msg3[]" value="">
    <input type="hidden" name="sw_direct">
    <input type="hidden" name="url">

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
        <a href="/video/list" class="button large">목록</a>

        <button type="submit" onclick="document.pressed=this.value;" class="button large button-purple" id="buyreqbtn">구매신청</button>
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