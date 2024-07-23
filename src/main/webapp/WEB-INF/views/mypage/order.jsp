<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ include file = "../common/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>BLUEACCORD</title>
</head>
<style>
    a{
        text-decoration: none;
        color: black;
    }

    li{
        list-style: none;
    }

    .my-container{
        width: 1240px;
        margin: 0 auto;
        padding: 100px 0;
    }

    .my-header-container{
        text-align: center;
    }

    .my-table-container{
        text-align: center;
        padding: 50px 0;
    }

    .my-table{
        width: 100%;
        height: 200px;
        border-collapse: collapse;
    }

    .my-table th{
        width: 34%;
        border: 1px solid black;
    }

    .my-table td{
        width: 22%;
        border: 1px solid black;
    }

    .my-left-container{
        float: left;
        width: 15%;
    }

    .my-right-container{
        float: right;
        width: 75%;
    }

    .my-left-container ul{
        margin-bottom: 50px;
    }

    .my-left-container .li-header{
        font-size: 18px;
        font-weight: 900;
        padding-bottom: 15px;
    }

    .my-left-container li{
        padding-bottom: 10px;
    }

    #qnaBtn{
        background-color: white;
        width: 110px;
        height: 40px;
        padding: 5px;
        border: 1px solid gray;
    }

    .order-table-header{
        padding-bottom: 20px;
    }

    .order-item-table{
        width: 100%;
        border-top: 3px solid black;
        border-bottom: 1px solid #f6f6f6;
        border-collapse: collapse;
    }

    .order-item-table th{
        padding: 10px;
        text-align: left;
        width: 35%;
    }

    .order-item-table td{
        text-align: right;
        padding-right: 10px;
    }

    .item-info-left{
        float: left;
        width: 100px;
        height: 100px;
        margin-right: 15px;
    }

    .item-info-left img{
        width: 100%;
        height: 100%;
    }

    .button-container{
        height: 20px;
        padding: 10px 0;
        font-size: 20px;
    }

    .button-table{
        width: 100%;
    }

    .button-table button, #reviewBtn{
        background-color: white;
        width: 120px;
        height: 35px;
        font-size: 16px;
        border: 1px solid gray;
        font-weight: 900;
    }

    button:hover{
        cursor: pointer;
    }

    .button-table th{
        text-align: left;
    }

    .button-table td{
        text-align: right;
        padding-bottom: 10px;
    }

    .total_price{
        padding-bottom: 10px;
    }

    .clearfix::after {
    content: "";
    display: table;
    clear: both;
    }


</style>
<body>
    <div class="container clearfix">
        <div class="my-container clearfix"> 
            <div class="my-detail-container">
                <div class="my-left-container">
                    <ul>
                        <li class="li-header">나의 정보</li>
                        <a href="<c:url value='/mypage'/>"><li>마이 페이지</li></a>
                        <a href="<c:url value='/wish/list'/>"><li>위시리스트</li></a>
                        <a href="<c:url value='/cart/list'/>"><li>장바구니</li></a>
                        <a href="<c:url value='/mypage/order'/>"><li>주문내역 조회</li></a>
                        <a href="<c:url value='/mypage/member/modify'/>"><li>회원정보 수정</li></a>
                        <a href="<c:url value='/member/delete'/>"><li>회원 탈퇴</li></a>
                        <a href="<c:url value='/logout'/>"><li>로그아웃</li></a>     
                    </ul>
                    <a href="<c:url value='/cs/question/list'/>"><button id="qnaBtn">1:1 문의하기</button></a>
                </div>
                
                <div class="my-right-container">
                    <div class="order-status-container">
                        <div class="order-table-header">
                            <h3>주문조회</h3>
                        </div>
                        <div class="order-item-container">
                            <c:if test="${orderMap.isEmpty()}">
                                <div class="none-order">
                                    <p>현재 고객님의 주문내역이 없습니다.</p>
                                </div>
                            </c:if>
                            <c:forEach var="entry" items="${orderMap}">
                                <c:set var="order" value="${entry.key}" />
                                <c:set var="orderItems" value="${entry.value}" />
                                <table class="order-item-table">
                                    <tr style="background-color: #f6f6f6;">
                                        <th><fmt:formatDate value="${order.order_date}" pattern="yyyy-MM-dd" /> (주문번호: ${order.order_id})</th>
                                        <td><a href="<c:url value='/mypage/order/detail?orderId=${order.order_id}'/>">상세보기 ></a></td>
                                    </tr>
                                    <c:forEach var="item" items="${orderItems}">
                                        <tr>
                                            <th>
                                                <div class="item-info-left">
                                                    <a href="<c:url value='/item/product?item_id=${item.item_id}'/>"><img src="${item.rep_img_url}" alt="이미지"></a>
                                                </div>
                                                <div class="item-info-right">
                                                    <a href="<c:url value='/item/product?item_id=${item.item_id}'/>"><p>${item.item_nm}</p></a>
                                                    <p>수량: ${item.count}개</p>
                                                    <p><fmt:formatNumber value="${item.order_price}" type="number" pattern="#,##0"/>원</p>
                                                </div>
                                            </th>
                                        </tr>
                                    </c:forEach>
                                    <tr>
                                        <th>${order.order_status}</th>
                                        <td>
                                            <button id="reviewBtn">구매후기</button><br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th></th>
                                        <td><p class="total_price">총 결제 금액: <fmt:formatNumber value="${order.total_price}" type="number" pattern="#,##0"/>원</p></td>
                                    </tr>
                                </table>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<%@ include file = "../common/footer.jsp" %>
</html>