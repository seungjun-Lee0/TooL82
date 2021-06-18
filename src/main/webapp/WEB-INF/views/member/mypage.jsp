<%--
  Created by IntelliJ IDEA.
  User: seungjunlee
  Date: 2021/06/18
  Time: 12:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
                <span class="normal">아이디</span>
            </li>
            <li>
                <div class="subject">ㆍ 이메일</div>
                <span class="normal">이메일</span>
            </li>
            <li>
                <div class="subject">ㆍ 가입일</div>
                <span class="normal">회원가입일</span>
            </li>

        </ul>
    </div>
    <div class="text-right">
        <a href="/member/modifyInfo" class="button round button-purple">정보수정</a>
        <a href="https://buts.co.kr/bbs/member_confirm.php?url=member_leave.php" class="button round border button-purple leave-me">탈퇴하기</a>
    </div>
</div>
</div>