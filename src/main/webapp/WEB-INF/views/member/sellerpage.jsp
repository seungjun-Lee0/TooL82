<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:parseNumber var="cp" value="${param.cp}" />
<fmt:parseNumber var="sp" value="${(cp - 1) / 10}" integerOnly="true" />
<fmt:parseNumber var="sp" value="${sp * 10 + 1}" />
<fmt:parseNumber var="ep" value="${sp + 9}" />

<%-- 총게시물 수를 페이지당 게시물수로 나눔 : 총 페이지수 --%>
<fmt:parseNumber var="tp" value="${slcnt / 10}" integerOnly="true" />
<c:if test="${(slcnt % 10) > 0}">
    <fmt:parseNumber var="tp" value="${tp + 1}" />
</c:if>

<c:set var="pglink" value="/member/sellerpage?mno=${sessionScope.MyInfo.mno}&cp=" />

<c:if test="${not empty param.findkey}">
    <c:set var="pglink"
           value="/member/sellfind?findtype=${param.findtype}&findkey=${param.findkey}&cp=" />
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

            <!-- [[ 파트너 참여정보 ]] -->

            <form class="form" role="form" name="frm_saleitem" method="get">
                <input type="hidden" name="ap" value="saleitem">

                <div class="partner-well">
                    <select name="findtype" id="findtype">
                        <option value="video">&nbsp;&nbsp;&nbsp;영상</option>
                        <option value="music">&nbsp;&nbsp;&nbsp;음악</option>
                        <option value="game">&nbsp;&nbsp;&nbsp;게임</option>
                        <option value="util">&nbsp;&nbsp;&nbsp;유틸</option>
                        <option value="buying">&nbsp;&nbsp;&nbsp;구매중</option>
                        <option value="buysuss">&nbsp;&nbsp;&nbsp;구매완료</option>
                        <option value="buyfail">&nbsp;&nbsp;&nbsp;구매실패</option>
                    </select>
                    <input type="text" name="findkey" id="findkey" value="${param.findkey}"
                           placeholder="빈 칸 가능합니다." size="70" maxlength="100">
                    <button type="button" class="button mini border button-purple" id="findsellbtn">검색</button>
                </div>

            </form>

            <div class="title"><span class="text-purple">판매</span> 정보</div>
            <div class="title"><span class="text-purple">총</span> 판매 수 </div>

            <div class="table-list scroll">
                <table >
                    <thead>
                    <tr>
                        <th scope="col">공구 종료일</th>
                        <th scope="col">카테고리</th>
                        <th scope="col">제품명</th>
                        <th scope="col">상태</th>
                        <th scope="col">결제금액</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="sl" items="${sls}">
                        <tr>
<%--                            <c:if test="${slcnt eq 0}">--%>
<%--                                <td colspan="9">--%>
<%--                                    <div class="empty">--%>
<%--                                        <div class="icon"><img src="https://buts.co.kr/thema/Buts/colorset/Basic/img/icon-butsicon-big-glay.png" /></div>--%>
<%--                                        <h5>판매 목록이 없습니다!</h5>--%>
<%--                                        <h5>혹시 판매자가 아니신가요? 그렇다면 판매자 등록을 해주세요</h5>--%>
<%--                                        <a href="/member/mypage">판매자 등록하러 가기</a>--%>
<%--                                    </div>--%>
<%--                                </td>--%>
<%--                            </c:if>--%>
<%--                            <c:if test="${slcnt gt 1}">--%>
                                <td>${sl.edate}</td>
                                <td>
                                    <div class="pdcategory">
                                        <c:if test="${sl.category eq 'v'}">
                                            <span>영상</span>
                                        </c:if>
                                        <c:if test="${sl.category eq 'm'}">
                                            <span>음악</span>
                                        </c:if>
                                        <c:if test="${sl.category eq 'u'}">
                                            <span>유틸</span>
                                        </c:if>
                                        <c:if test="${sl.category eq 'g'}">
                                            <span>게임</span>
                                        </c:if>
                                    </div>
                                </td>
                                <td>
                                    <div class="subject" style="text-align: center">
                                        <c:if test="${sl.category eq 'g'}">
                                            <a href="/game/detail?pno=${sl.pno}">
                                                    ${sl.title}</a>
                                        </c:if>
                                        <c:if test="${sl.category eq 'm'}">
                                            <a href="/music/detail?pno=${sl.pno}">
                                                    ${sl.title}</a>
                                        </c:if>
                                        <c:if test="${sl.category eq 'u'}">
                                            <a href="/util/detail?pno=${sl.pno}">
                                                    ${sl.title}</a>
                                        </c:if>
                                        <c:if test="${sl.category eq 'v'}">
                                            <a href="/video/detail?pno=${sl.pno}">
                                                    ${sl.title}</a>
                                        </c:if>
                                    </div>
                                </td>
                                <td>
                                    <div class="buystat">
                                        <c:if test="${sl.sellstat eq '0'}">
                                            <span>구매중</span>
                                        </c:if>
                                        <c:if test="${sl.sellstat eq '1'}">
                                            <span>구매완료</span>
                                        </c:if>
                                        <c:if test="${sl.sellstat eq '2'}">
                                            <span>구매실패</span>
                                        </c:if>
                                    </div>
                                </td>
                                <td class="pc-table" style="width: 10%">${sl.sprice}</td>
<%--                            </c:if>--%>
                        </tr>
                    </c:forEach>
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

        </div><!-- /#page-wrapper -->
    </div><!-- /#wrapper -->
</div>