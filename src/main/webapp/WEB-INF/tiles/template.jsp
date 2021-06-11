<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!doctype html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

    <!-- Font Awesome -->
    <script src="https://kit.fontawesome.com/dd1a91c868.js" crossorigin="anonymous"></script>

    <!-- user define CSS -->


    <title>TooL82</title>

    <!-- junk -->

    <link rel="stylesheet" href="/css/buts/default_shop.css">
    <link rel="stylesheet" href="/css/buts/apms.css">
    <%--<link rel="stylesheet" href="/css/buts/bootstrap.css" type="text/css" class="thema-mode">--%>
    <link rel="stylesheet" href="/css/buts/magnific_popup.css" type="text/css">
    <link rel="stylesheet" href="/css/buts/buts.css" type="text/css" >
    <link rel="stylesheet" href="/css/buts/widget.css">
    <link rel="stylesheet" href="/css/buts/bagic.css">
</head>
<body>
<div class="main">
    <tiles:insertAttribute name="header" />

    <div class="container" style="margin-top: 150px">
    <tiles:insertAttribute name="main" />
    </div>
    <tiles:insertAttribute name="footer" />
</div>

<!-- jQuery and Bootstrap Bundle (includes Popper) -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

<!-- load js file -->


</body>
</html>