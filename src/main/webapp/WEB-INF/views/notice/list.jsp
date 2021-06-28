<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:parseNumber var="cp" value="${param.cp}" />
<fmt:parseNumber var="sp" value="${(cp - 1) / 10}" integerOnly="true" />
<fmt:parseNumber var="sp" value="${sp * 10 + 1}" />
<fmt:parseNumber var="ep" value="${sp + 9}" />

<%-- 총 게시물수를 페이지 당 게시물 수로 나눔 : 총 페이지수 --%>
<fmt:parseNumber var="tp" value="${ncnt / 10}" integerOnly="true" />
<c:if test="${ncnt % 10 gt 0}">
    <fmt:parseNumber var="tp" value="${tp + 1}" />
</c:if>

<%-- 글번호 --%>
<fmt:parseNumber var="snum" value="${ncnt - (cp-1) * 10}" />

<%-- 페이지링크 : 검색기능 x --%>
<c:set var="pglink" value="/notice/list?cp=" />

<%-- 페이지링크 : 검색기능 o --%>
<c:if test="${not empty param.findkey}">
    <c:set var="pglink" value="/notice/find?findtype=${param.findtype}&findkey=${param.findkey}&cp=" />
</c:if>


<div class="title-wrap title-wrap-borderborder">
    <div class="title">
        <a href="" class="text">공지사항</a>
    </div>
    <div class="title-right">
        <div class="search-bar">
            <form name="nseacrh" method="get" role="form">
                <input type="hidden" name="bo_table" value="notice">
                <input type="hidden" name="sca" value="">
                <input type="hidden" name="sop" value="and">
                <select name="findtype3" id="findtype3">
                    <option value="title">제목</option>
                    <option value="contents">내용</option>
                    <option value="titcont">제목+내용</option>
                </select>
                <input type="text" name="findkey" value="" required id="findkey" maxlength="20" placeholder="검색어를 입력해 주세요">
                <button type="button" class="submit" id="findbtn">
                    <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABMAAAATCAIAAAD9MqGbAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAZtJREFUeNqUk78vQ1Ecxc/tj4mIpqqlJiEhDZI+lfjRsEmsEouhu4U/xYJZwmAxCmMr7aA/EpHGQLr49Sgh6Nb2Orev+l6pas/wXt6953O/997veUJKiW8960gn5FUWb3n16fJgKABtRvT48FvCIEtFnBzKZBSWdb4dAloYi8vC6fxFEtvfkblL2B0IzWNME54+NZd/wEVaLUfD4AhW1wQNdeTRgTyLosul5rz+nzUf77C/Ld9fMbWApRVRG7fldaROVbWGGMVBTjkcSMVAs0lmErJcxmQYDbEazKPSRrNJ8iap8ZBAUxkGw1wlXysN8A00B+GtGAxzlURrKpfU0263kGw3pd/+Q7JDVLfbQg4H1It9a04ahsFRCxmcFjYbUlHVt7/0dK8MtDGJJsm4sCXFomp3Q5iDe1uSBm0ORrb+TN9ESLgrEX/RcZ6spo/q9SOyLjo620l8cBY3ObVnKyysfxnDlY7L66zqG+vzJnklPBs3WfjE7qa0wnVkc5lwPyIbotUkUKxDgBjhTBw8WHsqfMjYsXx/k18CDACJhvJ23Xt3WQAAAABJRU5ErkJggg==" alt="" />
                </button>
            </form>
        </div>
    </div>
</div>

    <div class="table-list list-wrap">
        <table>
            <thead>
            <tr>
                <th class="pc-table">번호</th>
                <th>제목</th>
                <th>등록일</th>
                <th class="pc-table">조회</th>
            </tr>
            </thead>
            <tbody>

            <c:forEach var="n" items="${ns}">
            <tr class="">
                <td class="pc-table" style="width: 10%">${snum}</td>
                <td>
                    <div class="subject">
                        <a href="/notice/detail?bno=${n.bno}">
                            ${n.title}																													</a>
                    </div>
                </td>
                <td>${fn:substring(n.regdate,0,10)}</td>
                <td class="pc-table" style="width: 10%">${n.views}</td>
                <c:set var="snum" value="${snum-1}" />
            </tr>
            </c:forEach>

            </tbody>
        </table>
    </div>

<%-- pagination --%>

    <div class="page-number">
        <ul>
            <li class="disabled"><c:if test="${cp gt sp}"><a href="${pglink}${1}"></c:if><i class="fa fa-angle-double-left"></i></a></li>
            <li class="<c:if test="${sp lt 11}">disabled</c:if>"><c:if test="${cp-1 ge sp}"><a href="${pglink}${cp-1}"></c:if><i class="fa fa-angle-left"></i></a></li>

            <c:forEach var="i" begin="${sp}" end="${ep}" step="1">
                <%-- 표시하는 페이지i가 총 페이지 수보다 작거나 같을 동안만 출력 --%>
                <c:if test="${i le tp}">
                    <c:if test="${i eq cp}">
                        <li class="active"><a href="${pglink}${i}">${i}</a></li>
                    </c:if>
                    <c:if test="${i ne cp}">
                        <li class=""><a href="${pglink}${i}">${i}</a></li>
                    </c:if>
                </c:if>
            </c:forEach>

            <li class="disabled"><c:if test="${cp+1 le tp}"><a href="${pglink}${cp+1}"></c:if><i class="fa fa-angle-right"></i></a></li>
            <li class="disabled"><c:if test="${cp ne tp}"><a href="${pglink}${tp}"></c:if><i class="fa fa-angle-double-right"></i></a></li>
        </ul>
    </div>

    <div class="button-align right mg-top-0">
    </div>

<%--</form>--%>

