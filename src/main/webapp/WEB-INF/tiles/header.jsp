<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


    <!-- topper -->
    <div class="topper">
        <div class="width-container">
            <div class="topper-menu">
                <a href="/register/regAgree" class="v-bar">회원가입</a>
                <a href="/member/mypage" class="v-bar">마이페이지</a>
                <a href="/notice/list">공지사항</a>
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
                <a href="/seller/write" class="header-button">판매 등록</a>
                <a href="/member/login" class="header-login">로그인</a>
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
                            <ul>
                                <li class="sub-li off">
                                    <a href="https://buts.co.kr/shop/list.php?ca_id=1010" class="sub-a">
                                        #넷플릭스															</a>
                                </li>
                                <li class="sub-li off">
                                    <a href="https://buts.co.kr/shop/list.php?ca_id=1020" class="sub-a">
                                        #왓챠															</a>
                                </li>
                                <li class="sub-li off">
                                    <a href="https://buts.co.kr/shop/list.php?ca_id=1030" class="sub-a">
                                        #유튜브															</a>
                                </li>
                                <li class="sub-li off">
                                    <a href="https://buts.co.kr/shop/list.php?ca_id=1040" class="sub-a">
                                        #웨이브															</a>
                                </li>
                                <li class="sub-li off">
                                    <a href="https://buts.co.kr/shop/list.php?ca_id=1050" class="sub-a">
                                        #티빙																	<span class="sub-1new2"></span>
                                    </a>
                                </li>
                                <li class="sub-li off">
                                    <a href="https://buts.co.kr/shop/list.php?ca_id=1070" class="sub-a">
                                        #프라임비디오															</a>
                                </li>
                                <li class="sub-li off">
                                    <a href="https://buts.co.kr/shop/list.php?ca_id=1080" class="sub-a">
                                        #디즈니															</a>
                                </li>
                                <li class="sub-li off">
                                    <a href="https://buts.co.kr/shop/list.php?ca_id=1060" class="sub-a">
                                        기타(영상)															</a>
                                </li>
                            </ul>
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
                            <ul>
                                <li class="sub-li off">
                                    <a href="https://buts.co.kr/shop/list.php?ca_id=2010" class="sub-a">
                                        #리디북스															</a>
                                </li>
                                <li class="sub-li off">
                                    <a href="https://buts.co.kr/shop/list.php?ca_id=2020" class="sub-a">
                                        #밀리의서재															</a>
                                </li>
                                <li class="sub-li off">
                                    <a href="https://buts.co.kr/shop/list.php?ca_id=2030" class="sub-a">
                                        #YES24															</a>
                                </li>
                                <li class="sub-li off">
                                    <a href="https://buts.co.kr/shop/list.php?ca_id=2040" class="sub-a">
                                        #스포티파이															</a>
                                </li>
                                <li class="sub-li off">
                                    <a href="https://buts.co.kr/shop/list.php?ca_id=2060" class="sub-a">
                                        #애플뮤직															</a>
                                </li>
                                <li class="sub-li off">
                                    <a href="https://buts.co.kr/shop/list.php?ca_id=2070" class="sub-a">
                                        #조인스프라임															</a>
                                </li>
                                <li class="sub-li off">
                                    <a href="https://buts.co.kr/shop/list.php?ca_id=2050" class="sub-a">
                                        기타(도서/음악)															</a>
                                </li>
                            </ul>
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
                            <ul>
                                <li class="sub-li off">
                                    <a href="https://buts.co.kr/shop/list.php?ca_id=3010" class="sub-a">
                                        #닌텐도온라인															</a>
                                </li>
                                <li class="sub-li off">
                                    <a href="https://buts.co.kr/shop/list.php?ca_id=3030" class="sub-a">
                                        #스팀															</a>
                                </li>
                                <li class="sub-li off">
                                    <a href="https://buts.co.kr/shop/list.php?ca_id=3040" class="sub-a">
                                        #PS4/PS5															</a>
                                </li>
                                <li class="sub-li off">
                                    <a href="https://buts.co.kr/shop/list.php?ca_id=3050" class="sub-a">
                                        #XBOX															</a>
                                </li>
                                <li class="sub-li off">
                                    <a href="https://buts.co.kr/shop/list.php?ca_id=3020" class="sub-a">
                                        기타															</a>
                                </li>
                            </ul>
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
                            <ul>
                                <li class="sub-li off">
                                    <a href="https://buts.co.kr/shop/list.php?ca_id=6010" class="sub-a">
                                        #MS Office															</a>
                                </li>
                                <li class="sub-li off">
                                    <a href="https://buts.co.kr/shop/list.php?ca_id=6020" class="sub-a">
                                        #그래픽															</a>
                                </li>
                                <li class="sub-li off">
                                    <a href="https://buts.co.kr/shop/list.php?ca_id=6030" class="sub-a">
                                        #운영체제															</a>
                                </li>
                                <li class="sub-li off">
                                    <a href="https://buts.co.kr/shop/list.php?ca_id=6040" class="sub-a">
                                        기타															</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>

            </ul>
        </div>
    </div>