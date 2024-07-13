<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file = "../common/header.jsp" %>

<c:set var="loginId" value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? 'Login' : 'ID='+=loginId}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>BLUEACCORD</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<style>
* {
    margin: 0;
    padding: 0;
    font-family: 'poppins', sans-serif;
    box-sizing: border-box;
}

.order-item-table img {
    width: 80px;
    height: 80px;
    border: 1px solid gray;
}

.container {
    width: 1240px;
    margin: 0 auto;
    padding-bottom: 100px;
}

.order-info-container{
    padding: 10px 20px;
    margin: 20px 0;
    border: 1px solid rgb(204, 204, 204);
    box-shadow: 15px 15px 15px whitesmoke;
}

.fa-gifts {
    padding: 20px;
}

.order-info-header{
    text-align: center;
    font-size: 20px;
    font-weight: bold;
    padding: 10px 0;
}

.order-info-table table{
    border-bottom: 1px solid lightgray;
    padding-top: 10px;
    width: 100%;
}

.order-info-table th{
    text-align: left;
    padding-bottom: 10px;
}

.order-info-table td{
    text-align: right;
}

.order-info h3{
    padding: 10px 0;
    border-bottom: 1px solid lightgray;
}

.order-detail-table table{
    padding-top: 10px;
    text-align: left;
}

.order-detail-table th, .order-detail-table td{
    padding-right: 50px;
    padding-bottom: 30px;
}

.order-item-table{
    padding-top: 10px;
}

.order-item-table td{
    padding-bottom: 10px;
    padding-right: 10px;
}

#orderItem_item_nm{
    font-size: 18px;
    font-weight: bold;
    padding-bottom: 10px;
}

.button-container{
    text-align: center;
}

.button-container button{
    width: 30%;
    height: 50px;
    font-size: 18px;
    font-weight: bold;
}

.button-container button:hover{
    cursor: pointer;
}

#orderBtn{
    background-color: white;
    border: 1px solid #a1a1a1;
}

#shopBtn{
    border: 0px;
    background-color: black;
    color: white;
}



</style>
<body>
    <div class="container">
        <div class="order-info-container">
            <div class="order-info order-info-header">
                <i class="fas fa-gifts fa-4x"></i>
                <p>고객님의 주문이<br>정상적으로 완료되었습니다.</p>
            </div>
            <div class="order-info-table">
                <table>
                    <tr>
                        <th scope="row">주문번호</th>
                        <td>${orderDto.order_id}</td>
                    </tr>
                        <th scope="row">결제금액</th>
                        <td><fmt:formatNumber value="${orderDto.total_price}" type="number" pattern="#,##0"/>원</td>
                    </tr>
                </table>
            </div>
        </div>

        <div class="order-info-container">
            <div class="order-info order-info-payment">
                <h3>결제수단</h3>
            </div>
            <div class="order-detail-table">
                <table>
                    <tr>
                        <th style="vertical-align: top;" scope="row">결제수단</th>
                        <td>무통장 입금<br>입금자: 김동현 / 계좌번호: 우리은행 1002-054-894087 (김동현)</td>
                    <tr>
                </table>
            </div>
        </div>

        <div class="order-info-container">
            <div class="order-info order-info-recipient">
                <h3>배송지</h3>
            </div>
            <div class="order-detail-table">
                <table>
                    <tr>
                        <th scope="row">받는사람</th>
                        <td>${orderDto.recipient_name}</td>
                    </tr>
                    <tr>
                        <th scope="row">주소</th>
                        <td>${orderDto.recipient_address}</td>
                    </tr>
                    <tr>
                        <th scope="row">연락처</th>
                        <td>${orderDto.recipient_phone}</td>
                    </tr>
                    <tr>
                        <th scope="row">배송요청</th>
                        <td>${orderDto.order_message}</td>
                    </tr>
                </table>
            </div>
        </div>

        <div class="order-info-container">
            <div class="order-info order-info-item">
                <h3>주문상품</h3>
            </div>
            <div class="order-item-table">
                <c:forEach var="orderItem" items="${list}">
                    <table>
                        <tr>
                            <td><img src="${orderItem.rep_img_url}" alt="이미지"></td>
                            <td style="vertical-align: top;">
                                <p id="orderItem_item_nm">${orderItem.item_nm}</p>
                                <p id="orderItem_count">수량 ${orderItem.count}개</p>
                                <p id="orderItem_order_price"><fmt:formatNumber value="${orderItem.order_price}" type="number" pattern="#,##0"/>원</p>
                            </td>
                        </tr>
                    </table>
                </c:forEach>
            </div>
        </div>

        <div class="button-container">
            <button type="button" id="orderBtn">주문확인하기</button>
            <a href="/category?category=CAP"><button type="button" id="shopBtn">쇼핑계속하기</button></a>
        </div>


    </div>
</body>
<%@ include file = "../common/footer.jsp" %>
<script>

</script>
</html>