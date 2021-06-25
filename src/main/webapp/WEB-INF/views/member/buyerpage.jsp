<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:parseNumber var="cp" value="${param.cp}" />
<fmt:parseNumber var="sp" value="${(cp - 1) / 10}" integerOnly="true" />
<fmt:parseNumber var="sp" value="${sp * 10 + 1}" />
<fmt:parseNumber var="ep" value="${sp + 9}" />

<%-- 총게시물 수를 페이지당 게시물수로 나눔 : 총 페이지수 --%>
<fmt:parseNumber var="tp" value="${bycnt / 10}" integerOnly="true" />
<c:if test="${(bycnt % 10) > 0}">
    <fmt:parseNumber var="tp" value="${tp + 1}" />
</c:if>

<c:set var="pglink" value="/member/buyerpage?mno=${sessionScope.MyInfo.mno}&cp=" />

<c:if test="${not empty param.findkey}">
    <c:set var="pglink"
           value="/member/buyfind?findtype=${param.findtype}&findkey=${param.findkey}&cp=" />
</c:if>

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
                <a href="/member/sellerpage?mno=${sessionScope.MyInfo.mno}"> 판매 목록</a>
            </li>
            <li >
                <a href="/member/buyerpage?mno=${sessionScope.MyInfo.mno}"> 구매 목록</a>
            </li>
        </ul>
    </div>

    <!-- body -->
    <div class="partner-body">

        <div id="page-wrapper">
            <div class="title">
                <span class="text-purple">구매</span> 정보
                <div style="float: right">
                    <select name="findtype1" id="findtype1" style="width: 150px;">
                        <option value="video">&nbsp;&nbsp;&nbsp;영상</option>
                        <option value="music">&nbsp;&nbsp;&nbsp;음악</option>
                        <option value="game">&nbsp;&nbsp;&nbsp;게임</option>
                        <option value="util">&nbsp;&nbsp;&nbsp;유틸</option>
                        <option value="buying">&nbsp;&nbsp;&nbsp;진행중</option>
                        <option value="buysuss">&nbsp;&nbsp;&nbsp;구매완료</option>
                        <option value="buyfail">&nbsp;&nbsp;&nbsp;구매실패</option>
                    </select>
                    <button type="button" class="button mini border button-purple" id="findbuybtn">검색</button>
                </div>
            </div>

            <div class="table-list scroll">
                <table >
                    <thead>
                    <tr>
                        <th scope="col">구매일</th>
                        <th scope="col">카테고리</th>
                        <th scope="col">제품명</th>
                        <th scope="col">상태</th>
                        <th scope="col">결제금액</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:if test="${bycnt eq 0}">
                        <td colspan="9">
                            <div class="empty">
                                <div class="icon"><img src="https://buts.co.kr/thema/Buts/colorset/Basic/img/icon-butsicon-big-glay.png" /></div>
                                <h5>판매 목록이 없습니다!</h5>
                                <h5>혹시 판매자가 아니신가요? 그렇다면 판매자 등록을 해주세요</h5>
                                <a href="/member/mypage">판매자 등록하러 가기</a>
                            </div>
                        </td>
                    </c:if>
                    <c:if test="${bycnt gt 0}">
                    <c:forEach var="by" items="${bys}">
                        <tr>
                            <td>${fn:substring(by.bdate, 0, 10)}</td>
                            <td>
                                <div class="pdcategory">
                                    <c:if test="${by.category eq 'v'}">
                                        <span>영상</span>
                                    </c:if>
                                    <c:if test="${by.category eq 'm'}">
                                        <span>음악</span>
                                    </c:if>
                                    <c:if test="${by.category eq 'u'}">
                                        <span>유틸</span>
                                    </c:if>
                                    <c:if test="${by.category eq 'g'}">
                                        <span>게임</span>
                                    </c:if>
                                </div>
                            </td>
                            <td>
                                <div class="subject" style="text-align: center">
                                    <c:if test="${by.category eq 'g'}">
                                        <a href="/game/detail?pno=${by.pno}">
                                                ${by.title}</a>
                                    </c:if>
                                    <c:if test="${by.category eq 'm'}">
                                        <a href="/music/detail?pno=${by.pno}">
                                                ${by.title}</a>
                                    </c:if>
                                    <c:if test="${by.category eq 'u'}">
                                        <a href="/util/detail?pno=${by.pno}">
                                                ${by.title}</a>
                                    </c:if>
                                    <c:if test="${by.category eq 'v'}">
                                        <a href="/video/detail?pno=${by.pno}">
                                                ${by.title}</a>
                                    </c:if>
                                </div>
                            </td>
                            <td>
                                <div>
                                    <c:if test="${by.buystat eq 0}">
                                        <span>진행중</span>
                                    </c:if>
                                    <c:if test="${by.buystat eq 1}">
                                        <span>구매완료</span>
                                    </c:if>
                                    <c:if test="${by.buystat eq 2}">
                                        <span>구매실패</span>
                                    </c:if>
                                </div>
                            </td>
                            <td class="pc-table" style="width: 10%">${by.sprice}</td>
                        </tr>
                    </c:forEach>
                    </c:if>
                    </tbody>
                </table>
            </div>

            <div class="row">
                <div class="col-12">
                    <ul class="pagination justify-content-center">

                        <%-- '이전'버튼이 작동되어야 할때는 sp가 11보다 클때 --%>
                        <li class="page-item <c:if test="${sp lt 11}">disabled</c:if>">
                            <a href="${pglink}${sp-10}" class="page-link">이전</a></li>

                        <%-- 반복문을 이용해서 페이지 링크 생성 --%>
                        <c:forEach var="i" begin="${sp}" end="${ep}" step="1">
                            <%-- 표시하는 페이지i가 총페이지수보다 작거나 같을 동안만 출력 --%>
                            <c:if test="${i le tp}">
                                <c:if test="${i eq cp}">
                                    <li class="page-item active">
                                        <a href="${pglink}${i}" class="page-link">${i}</a></li>
                                </c:if>

                                <c:if test="${i ne cp}">
                                    <li class="page-item">
                                        <a href="${pglink}${i}" class="page-link">${i}</a></li>
                                </c:if>
                            </c:if>
                        </c:forEach>
                        <%-- '다음'버튼이 작동되어야 할때는 ??? --%>
                        <li class="page-item <c:if test="${ep gt tp}">disabled</c:if>">
                            <a href="${pglink}${sp+10}" class="page-link">다음</a></li>
                    </ul>
                </div>

            </div>
            <input hidden name="mno" id="mno" value="${sessionScope.MyInfo.mno}"/>
            <input hidden name="findkey1" id="findkey1" value=""/>

        </div><!-- /#page-wrapper -->
    </div><!-- /#wrapper -->
</div>