<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


    <!-- topper -->
    <div class="topper">
        <div class="width-container">
            <div class="topper-menu">
                <c:if test="${empty sessionScope.MyInfo}">
                <a href="/register/regAgree" class="v-bar">회원가입</a>
                </c:if>
                <c:if test="${not empty sessionScope.MyInfo}">
                <a href="/member/mypage" class="v-bar">마이페이지</a>
                </c:if>
                <a href="/notice/list?cp=1">공지사항</a>
            </div>
        </div>
    </div>

    <!-- header -->
    <div class="header">
        <div class="width-container">
            <div class="header-logo" style="margin-top: -35px;">
                <a href="/"><img src="/banner/tool82_logo.jpeg" height="90" width="100" alt="logo"/></a>
            </div>
            <div class="header-right">
                <c:if test="${not empty sessionScope.MyInfo}">
                    <c:if test="${sessionScope.MyInfo.selleryn eq 0}">
                <a href="/seller/write" class="header-button">판매 등록</a>
                    </c:if>
                </c:if>
                <c:if test="${empty sessionScope.MyInfo}">
                <a class="header-button" href="/member/login">로그인</a>
                </c:if>
                <c:if test="${not empty sessionScope.MyInfo}">
                <a class="header-button" href="/member/logout" id="logoutbtn">로그아웃</a>
                </c:if>
            </div>
        </div>

        <div class="header-menu pc">
            <ul>
                <li class="menu-li off">
                    <a id="movie" href="/video/list" class="menu-a">영상<span class="menu_new"></span></a>
                    <div class="sub-menu" style="display: none">
                        <div class="sub-width">
                            <div class="sub-tip">
                                <span class="text-purple">영상</span> 인기 카테고리
                                <a href="javascript:" class="ttip">
                                    <img src="https://buts.co.kr/thema/Buts/colorset/Basic/img/tip.png" alt="" />
                                    <span class="ttip-text" style="left: 0; width: 166px"> 많이 생성된 파티방 및 인기 검색어 기준으로 노출됩니다. </span>
                                </a>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="menu-li off">
                    <a href="/music/list" class="menu-a">음악</a>
                    <div class="sub-menu" style="display: none">
                        <div class="sub-width">
                            <div class="sub-tip">
                                <span class="text-purple">도서/음악</span> 인기 카테고리
                                <a href="javascript:" class="ttip">
                                    <img src="https://buts.co.kr/thema/Buts/colorset/Basic/img/tip.png" alt="" />
                                    <span class="ttip-text" style="left: 0; width: 166px"> 많이 생성된 파티방 및 인기 검색어 기준으로 노출됩니다. </span>
                                </a>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="menu-li off">
                    <a href="/game/list" class="menu-a">게임</a>
                    <div class="sub-menu" style="display: none">
                        <div class="sub-width">
                            <div class="sub-tip">
                                <span class="text-purple">게임</span> 인기 카테고리
                                <a href="javascript:" class="ttip">
                                    <img src="https://buts.co.kr/thema/Buts/colorset/Basic/img/tip.png" alt="" />
                                    <span class="ttip-text" style="left: 0; width: 166px"> 많이 생성된 파티방 및 인기 검색어 기준으로 노출됩니다. </span>
                                </a>
                            </div>
                        </div>
                    </div>
                </li>

                <li class="menu-li off">
                    <a href="/util/list" class="menu-a">유틸</a>
                    <div class="sub-menu" style="display: none">
                        <div class="sub-width">
                            <div class="sub-tip">
                                <span class="text-purple">유틸</span> 인기 카테고리
                                <a href="javascript:;" class="ttip">
                                    <img src="https://buts.co.kr/thema/Buts/colorset/Basic/img/tip.png" alt="" />
                                    <span class="ttip-text" style="left: 0; width: 166px"> 많이 생성된 파티방 및 인기 검색어 기준으로 노출됩니다. </span>
                                </a>
                            </div>
                        </div>
                    </div>
                </li>

            </ul>
        </div>
    </div>