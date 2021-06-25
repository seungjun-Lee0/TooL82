<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
                    <select name="sca" id="sca">
                        <option value="">카테고리</option>
                        <option value="1010">&nbsp;&nbsp;&nbsp;영상</option>
                        <option value="1020">&nbsp;&nbsp;&nbsp;음악</option>
                        <option value="1030">&nbsp;&nbsp;&nbsp;게임</option>
                        <option value="1030">&nbsp;&nbsp;&nbsp;유틸</option>
                    </select>
                    <input type="text" name="searchbtn" id="searchbtn" required placeholder="검색하세요" size="70" maxlength="100">
                    <button type="submit" class="button mini border button-purple">검색</button>
                </div>

            </form>

            <div class="title"><span class="text-purple">구매</span> 정보</div>
            <div class="title"><span class="text-purple">총</span> 구매금액</div>

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
                    <c:forEach var="by" items="${bys}">
                        <tr>
                                <%--                            <c:if test="${by.pcnt eq 0}">--%>
                                <%--                                <td colspan="9">--%>
                                <%--                                    <div class="empty">--%>
                                <%--                                        <div class="icon"><img src="https://buts.co.kr/thema/Buts/colorset/Basic/img/icon-butsicon-big-glay.png" /></div>--%>
                                <%--                                        <h5>판매 목록이 없습니다!</h5>--%>
                                <%--                                        <h5>혹시 판매자가 아니신가요? 그렇다면 판매자 등록을 해주세요</h5>--%>
                                <%--                                        <a href="/member/mypage">판매자 등록하러 가기</a>--%>
                                <%--                                    </div>--%>
                                <%--                                </td>--%>
                                <%--                            </c:if>--%>
                                <%--                            <c:if test="${by.pcnt gt 1 }">--%>
                            <td>${by.bdate}</td>
                            <td>${by.category}</td>
                            <td>
                                <div class="subject">
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
                            <td class="pc-table" style="width: 10%">${by.buystat}</td>
                            <td class="pc-table" style="width: 10%">${by.sprice}</td>
                                <%--                            </c:if>--%>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div><!-- /#page-wrapper -->
    </div><!-- /#wrapper -->
</div>