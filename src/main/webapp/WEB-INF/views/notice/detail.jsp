<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% pageContext.setAttribute("replaceChar", "\n"); %>

<fmt:parseNumber var="cp" value="${param.cp}" />
<fmt:parseNumber var="sp" value="${(cp - 1) / 10}" integerOnly="true" />
<fmt:parseNumber var="sp" value="${sp * 10 + 1}" />
<fmt:parseNumber var="ep" value="${sp + 9}" />

<%-- 총 게시물수를 페이지 당 게시물 수로 나눔 : 총 페이지수 --%>
<fmt:parseNumber var="tp" value="${ncnt / 10}" integerOnly="true" />
<c:if test="${ncnt % 10 gt 0}">
    <fmt:parseNumber var="tp" value="${tp + 1}" />
</c:if>

<div class="title-wrap title-wrap-border">
<div class="title">
    <a href="" class="text">공지사항</a>
</div>
</div>

<div class="table-row">
    <div class="subject">${nts.title}</div>
</div>

<div class="table-row">
    <span class="v-bar"><span class="sv_member">관리자</span></span>
    <span class="v-bar">조회수 <span class="text-purple">${nts.views}</span></span>
    <div class="right">${nts.regdate}</div>
</div>

<div class="table-view-article">
    ${fn:replace(nts.contents, replaceChar, "<br/>")}

</div>

<div class="button-align right button-align-border">
    <div class="float-left">
        <c:if test="${param.bno ne 1}">
        <button type="button" id="nprvbtn" class="button small border button-purple">이전</button>
        </c:if>
        <c:if test="${param.bno ne 26}">
        <button type="button" id="nnxtbtn" class="button small border button-purple">다음</button>
        </c:if>
    </div>
<input type="hidden" id="bno" value="${param.bno}">
</div>

<%--<a href="./board.php?bo_table=notice&amp;wr_id=36" class="button small border button-purple"></a>--%>
