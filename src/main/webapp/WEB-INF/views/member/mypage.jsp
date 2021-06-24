<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



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
                <a href="/member/sellerpage"> 판매 목록</a>
            </li>
            <li >
                <a href="/member/buyerpage"> 구매 목록</a>
            </li>
        </ul>
    </div>

<div class="form-pannel form-half" style="margin-left: 300px">
    <div class="title">회원 정보</div>
    <div class="form-list form-list-clear">
        <ul>
            <li>
                <div class="subject">ㆍ 아이디</div>
                <span class="normal">${sessionScope.MyInfo.userid}</span>
            </li>


                <li>
                    <div class="subject">ㆍ 이메일</div>
                    <span class="normal">${sessionScope.MyInfo.email}</span>
                </li>
                <li>
                    <div class="subject">ㆍ 권한</div>
                    <c:if test="${sessionScope.MyInfo.selleryn eq 0}">
                    <span class="normal">판매자</span>
                    </c:if>
                    <c:if test="${sessionScope.MyInfo.selleryn eq 1}">
                    <span class="normal">구매자</span>
                    </c:if>
                </li>
                <li>
                    <div class="subject">ㆍ 가입일</div>
                    <span class="normal">${sessionScope.MyInfo.regdate}</span>
                </li>


        </ul>
    </div>
    <div class="text-right" style="margin-top: 50px">
        <button type="button" id="modbtn" class="button round button-purple">정보수정</button>
        <button type="button" id="delbtn" class="button round border button-purple leave-me">탈퇴하기</button>
    </div>
</div>
</div>