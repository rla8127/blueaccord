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
        padding-top: 100px;
    }

    .clearfix::after {
        content: "";
        display: table;
        clear: both;
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

    .title h2{
        font-size: 14px;
        margin: 20px 0;
    }

    .order-detail-table{
        width: 100%;
        border-top: 2px solid black;
        text-align: left;
        border-collapse: collapse;
        margin-bottom: 60px;
    }

    .order-detail-table th{
        background-color: #f6f6f6;
        padding: 20px 0;
        padding-left: 10px;
        width: 20%;
    }

    .order-detail-table td{
        padding: 20px 0;
        padding-left: 10px;
    }

    .order-detail-table tr{
        border-bottom: 1px solid #e5e5e5;
    }

    .order-detail-table button{
        width: 120px;
        height: 35px;
        background-color: black;
        color: white;
        float: right;
    }

    button:hover{
        cursor: pointer;
    }





</style>
<body>
    <div class="container clearfix">
        <div class="my-container clearfix"> 
            <div class="my-detail-container">
                <div class="my-left-container">
                    <ul>
                        <li class="li-header">나의 정보</li>
                        <a href="/mypage"><li>마이 페이지</li></a>
                        <a href="/wish/list"><li>위시리스트</li></a>
                        <a href="/cart/list"><li>장바구니</li></a>
                        <a href="/mypage/order"><li>주문내역 조회</li></a>
                        <a href="/mypage/member/modify"><li>회원 정보 수정</li></a>
                        <a href="/member/delete"><li>회원 탈퇴</li></a>
                        <a href="/logout"><li>로그아웃</li></a>
                    </ul>
                    <a href="/cs/question/list"><button id="qnaBtn">1:1 문의하기</button></a>
                </div>
                
                <div class="my-right-container">
                    <div class="order-status-container">
                        <div class="order-table-header">
                            <h3>주문상세조회</h3>
                        </div>
                        <div class="order-item-container">
                            <div class="order-detail-table-container">
                                <div class="title">
                                    <h2>주문정보</h2>
                                </div>
                                <table class="order-detail-table">
                                    <tr>
                                        <th>주문정보</th>
                                        <td>${order.order_id}</td>
                                    </tr>
                                    <tr>
                                        <th>주문일자</th>
                                        <td><fmt:formatDate value="${order.order_date}" pattern="yyyy-MM-dd hh시 mm분" /></td>
                                    </tr>
                                    <tr>
                                        <th>주문자</th>
                                        <td>${order.orderer_name}</td>
                                    </tr>
                                    <tr>
                                        <th>주문처리상태</th>
                                        <td>${order.order_status}</td>
                                    </tr>
                                </table>
                            </div>

                            <div class="order-detail-table-container">
                                <div class="title">
                                    <h2>결제정보</h2>
                                </div>
                                <table class="order-detail-table">
                                    <tr>
                                        <th>총 결제금액</th>
                                        <td><p><fmt:formatNumber value="${order.total_price}" type="number" pattern="#,##0"/>원</p></td>
                                    </tr>
                                    <tr>
                                        <th>결제수단</th>
                                        <td>무통장 입금</td>
                                    </tr>
                                </table>
                            </div>

                            <div class="order-detail-table-container">
                                <div class="title">
                                    <h2>주문 상품 정보</h2>
                                </div>
                                <table class="order-detail-table">
                                <c:forEach var="item" items="${orderItems}">
                                    <tr>
                                        <th>
                                            <div class="item-info-left">
                                                <a href="<c:url value='/item?ino=${item.ino}'/>"><img src="${item.rep_img_url}" alt="이미지"></a>
                                            </div>
                                            <div>
                                                <a href="<c:url value='/item?ino=${item.ino}'/>"><p>${item.item_nm}</p></a>
                                                <p>수량: ${item.count}개</p>
                                                <p><fmt:formatNumber value="${item.order_price}" type="number" pattern="#,##0"/>원</p>
                                            </div>
                                        </th>
                                    </tr>
                                </c:forEach>
                                </table>

                                <div class="order-detail-table-container">
                                    <div class="title">
                                        <h2>배송지 정보</h2>
                                    </div>
                                    <table class="order-detail-table">
                                        <tr>
                                            <th>받으시는분</th>
                                            <td>${order.recipient_name}</td>
                                        </tr>
                                        <tr>
                                            <th>주소</th>
                                            <td>${order.recipient_address}</td>
                                        </tr>
                                        <tr>
                                            <th>휴대전화</th>
                                            <td>${order.recipient_phone}</td>
                                        </tr>
                                        <tr>
                                            <th>배송메시지</th>
                                            <td>${order.order_message}</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2"><a href="/mypage/order"><button>주문목록보기</button></a></td>
                                        </tr>
                                    </table>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<%@ include file = "../common/footer.jsp" %>
</html>