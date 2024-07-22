<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<c:set var="loginOutLink" value="${sessionScope.id==null ? '/login' : '/logout'}"/>
<c:set var="cartLink" value="${sessionScope.id==null ? '/login?toURL=/cart/list' : '/cart/list'}"/>
<c:set var="myPageLink" value="${sessionScope.id==null ? '/login?toURL=/mypage' : '/mypage'}"/>
<c:set var="wishLink" value="${sessionScope.id==null ? '/login?toURL=/wish/list' : '/wish/list'}"/>
<c:set var="orderLink" value="${sessionScope.id==null ? '/login?toURL=/mypage/order' : '/mypage/order'}"/>
<c:set var="loginOut" value="${sessionScope.id==null ? '로그인' : '로그아웃'}"/>
<c:set var="loginOut" value="${sessionScope.id==null ? '로그인' : '로그아웃'}"/>
<c:set var="wishCount" value="${sessionScope.id==null ? '로그인' : '로그아웃'}"/>
<html lang="en">
<!doctype html>
<style>

</style>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <script src="https://kit.fontawesome.com/083a6aeaa6.js" crossorigin="anonymous"></script>

    <link rel="preconnect" href="https://fonts.googleapis.com">

    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="apple-touch-icon" sizes="180x180" href="/favicon/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/favicon/favicon-16x16.png">

    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@100..900&display=swap" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="/css/header.css">
</head>
<header class="header">
    <div class="header-container">
        <div class="first-header">
            <div class="first-header-left">
                <a href="${wishLink}"><li>관심상품</li></a>
            </div>
            <div class="first-header-right">
                <ul>
                    <c:if test="${sessionScope.id == null}">
                        <a href="/register/add"><li>회원가입</li></a>
                    </c:if>
                    <li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>
                    <a href="${orderLink}"><li>주문조회</li></a>
                    <a href="/cs/question/list"><li>고객센터</li></a>
                    <a href="<c:url value='/admin/item/list'/>"><li>관리자페이지</li></a>
                </ul>
            </div>
        </div>
        <div>
            <div class="logo-header">
                <a href="/"><div class="logo-header-center">BLUEACCORD</div></a>
            <div>
                <div class="logo-header-right">
                    <a href="#" id="toggleButton"><i class="fas fa-search fa-lg"></i></a>
                    <a href="${myPageLink}"><i class="fas fa-user-alt fa-lg"></i></a>
                    <a href="${cartLink}"><i class="fas fa-shopping-cart fa-lg"></i></a>
                </div>
            </div>
            </div>
            <div class="menu-header">
                <ul>
                    <a href="<c:url value='/category?category=BEST'/>"><li>BEST</li></a>
                    <a href="<c:url value='/category?category=NEW'/>"><li>NEW</li></a>
                    <a href="<c:url value='/category?category=CAP'/>"><li>CAP</li></a>
                    <a href="<c:url value='/category?category=HAT'/>"><li>HAT</li></a>
                    <a href="<c:url value='/category?category=BEANIE'/>"><li>BEANIE</li></a>
                    <a href="<c:url value='/category?category=BIGCAP'/>"><li>BIGCAP</li></a>
                    <a href="<c:url value='/category?category=ETC'/>"><li>ALLCAP</li></a>
                </ul>
            </div>
        </div>
    </div>
    <div class="search-container" id="searchContainer">
        <div class="search-item-container">
            <i class="fas fa-search fa-lg"></i>
            <form action="/item/search" method="GET" id="searchForm">
                <input type="text" id="searchInput" name="keyword" placeholder="검색어를 입력해주세요.">
            </form>
        </div>
    </div>
</header>
<script>
    $(document).ready(function() {
        $('#toggleButton').on('click', function(event) {
            event.preventDefault();
            var $searchContainer = $('#searchContainer');
            var $searchInput = $('#searchInput');
            if ($searchContainer.hasClass('show')) {
                $searchContainer.removeClass('show');
            } else {
                $searchContainer.addClass('show');
                $searchInput.focus();
            }
        });

        $(document).on('click', function(event) {
            var $target = $(event.target);
            var $searchContainer = $('#searchContainer');
            if (!$target.closest('.search-container, #toggleButton').length) {
                if ($searchContainer.hasClass('show')) {
                    $searchContainer.removeClass('show');
                }
            }
        });

        $('#searchInput').on('keydown', function(event) {
            if (event.which === 13) { // 엔터 키의 keyCode는 13입니다.
                event.preventDefault(); // 폼이 제출되는 기본 동작을 막습니다.
                var searchText = $(this).val().trim();
                if (searchText !== '') {
                    $('#searchForm').submit(); // 폼을 수동으로 제출합니다.
                }
            }
        });
    });
</script>