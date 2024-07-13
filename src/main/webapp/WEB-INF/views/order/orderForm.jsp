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

img {
  width: 80px;
  height: 80px;
}

.container {
    width: 1240px;
    margin: 0 auto;
}

.order-container {
    padding: 50px 0;
    
}

.order-header {
    font-size: 18px;
    padding: 20px 5px;
    border-bottom: 1px solid black;
}

.order-info-container {
    padding: 20px 0;
    overflow: hidden;
}

.order-left-box {
    padding: 10px 15px;
    margin-bottom: 20px;
    border: 1px solid rgb(204, 204, 204);
    box-shadow: 15px 15px 15px whitesmoke;
}

.order_item_header, .order_info_header {
    padding: 10px 5px;
}

.order_item_name {
    font-size: 18px;
    padding-bottom: 5px;
    margin-top: 0;
}

.order_item_name, .order_item_price {
    font-weight: bold;
}

.order_info_table input, .order_info_table select  {
    width: 150px;
    height: 30px;
    text-align: center;
}

.order_info_table input[type="radio"]{
    width: 15px;
    height: 15px;
    padding-right: 100px;
}

.order_info_table #addressBtn {
    width: 75px;
    height: 30px;
    text-align: center;
    background-color: white;
    display: inline-block;
    border: 1px solid black;
}

.order_info_table #addressBtn:hover {
    cursor: pointer;
}

.order_info_table .address {
    text-align: left;
    padding-left: 10px;
    margin-top: 5px;
    width: 100%;
}

.message-option {
    width: 100%;
    height: 40px;
    padding-left: 20px;
    text-align: left;
}

.radio-option {
    padding-right: 10px;
    font-weight: bold;
}

.border {
    padding-top: 10px;
    border-top: 1px solid rgb(170, 170, 170);
}

.order-info-left {
    float: left;
    text-align: left;
    width: 62%;
}

.order-info-right {
    float: right;
    background-color: rgb(240, 240, 240);
}

.item-name {
    font-size: 20px;
}

.item-detail {
   font-size: 14px;
   color: rgb(75, 75, 75);
}

th, td{
    padding-bottom: 10px;
}

th {
    width: 110px;
}

.consumer-info {
    font-size: 20px;
    padding-top: 20px;
}

.consumer-info-input > input {
    text-align: center;
    width: 100px;
    height: 30px;
}

.order-info-right {
    padding-top: 40px;
    width: 35%;
}

.order-info-right table {
    width: 80%;
    margin: 0 auto;
}

.order-info-right th {
    text-align: left;
}

.order-info-right td {
    text-align: right;
}

.finalPrice td {
    color: red;
    font-size: 20px;
}

tbody .foot-br {
    border-bottom: 1px solid lightgray;
}

.benefit {
    padding: 20px 5px;
}

.benefit td {
    border-top: 1px solid lightgray;
    border-bottom: 1px solid lightgray;
    padding: 10px 0;
    text-align: center;
    font-size: 13px;
}

.button-container {
    display: flex;
    justify-content: center;
    padding: 20px 0;
}

.orderBtn {
    background-color: black;
    color: white;
    width: 100px;
    height: 35px;
    cursor: pointer; 
}

.star {
    color: rgb(85, 85, 255);
    font-size: 18px;
}

.custom-message-container {
            display: none;
            margin-top: 10px;
            width: 100%;
}

.custom-message-container  textarea {
            width: 100%;
            height: 50px;
            padding: 3px;
            resize: none;
            outline: none;
}

</style>
<body>
    <div class="container">
        <div class="order-container">
            <div class="order-header">
                <h2>주문/결제</h2>
            </div>
            <div class="order-info-container">
                <div class="order-info-left">

                    <div class="order-left-box order_item">
                    <form id="orderForm" method="post" action="/order/new">
                        <table class="order_item_table">
                            <tr>
                                <th><h3 class="order_item_header">주문상품</h3></th>
                            </tr>
                            <c:forEach var="cartListDto" items="${list}">
                                <tr>
                                    <td><img src="${cartListDto.rep_img_url}" alt="이미지"></td>
                                    <td style="vertical-align: top;">
                                        <p class="order_item_name">${cartListDto.item_nm}</p>
                                        <p class="order_item_count">수량: ${cartListDto.count}개</p>
                                        <p class="order_item_price"><fmt:formatNumber value="${cartListDto.price}" type="number" pattern="#,##0"/>원</p>
                                        <input type="hidden" value="${cartListDto.cart_item_id}" class="cart_item_id" name="cart_item_id">
                                    </td>
                                </tr>
                            </c:forEach>
                            <input type="hidden" id="cartItemIds" name="cartItemIds">
                        </table> 
                        <div>
                            <span>마일리지</span>
                            <span id="mileage" style="float: right;"></span>
                        </div>
                        <div>
                            <span>배송비</span>
                            <span class="shipping-fee" style="float: right;">원</span>
                        </div>
                    </div>

                    <div class="order-left-box order_info">
                        <table class="order_info_table">
                            <tr>
                                <th><h3 class="order_info_header">주문 정보</h3></th>
                            </tr>
                            <tr>
                                <th scope="row">주문자<span class="star">*</span></th>
                                <td><input type="text" id="order_name" name="orderer_name" placeholder="이름 입력"></td>
                            </tr>
                            <tr>
                                <th scope="row">이메일</th>
                                <td><input type="text" id="email_prefix"> @ 
                                    <select class="email-option" id="email_domain">
                                        <option value="naver.com">naver.com</option>
                                        <option value="gmail.com">gmail.com</option>
                                        <option value="daum.net">daum.net</option>
                                        <option value="nate.com">nate.com</option>
                                    </select>
                                    <input type="hidden" id="orderer_email" name="orderer_email">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">휴대전화<span class="star">*</span></th>
                                <td>
                                    <select class="phone-option" id="order_phone_prefix">
                                        <option value="010">010</option>
                                        <option value="011">011</option>
                                        <option value="016">016</option>
                                        <option value="019">019</option>
                                    </select>
                                    <input type="hidden" id="orderer_phone" name="orderer_phone">
                                    - <input type="text" id="order_phone1" name="order_phone1"> - <input type="text" id="order_phone2" name="order_phone2"></td>
                            </tr>
                        </table>
                    </div>

                    <div class="order-left-box order_info">
                        <table class="order_info_table">
                            <tr>
                                <th><h3 class="order_info_header">배송지</h3></th>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <label class="radio-option"><input type="radio" name="option" id="insert" value="1"> 주문자 정보와 동일 </label>
                                    <label class="radio-option"><input type="radio" name="option" id="new-insert" value="2"> 새로입력 </label>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">받는사람<span class="star">*</span></th>
                                <td><input type="text" name="recipient_name" id="recipient_name" placeholder="이름 입력"></td>
                            </tr>
                            <tr>
                                <th style="vertical-align: top;" scope="row">주소<span class="star">*</span></th>
                                <td>
                                    <input type="text" id="postcode" name="postcode" placeholder="우편번호" readonly>
                                    <button id="addressBtn" type="button" onclick="execDaumPostcode()" value="우편번호 찾기">주소검색</button>
                                    <input type="text" class="address" id="address" placeholder="기본 주소"><br>
                                    <input type="text" class="address" id="detailAddress" name="detailAddress" placeholder="나머지 주소"><br>
                                    <input type="text" class="address" id="extraAddress" placeholder="참고항목">
                                    <input type="hidden" id="recipient_address" name="recipient_address">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">휴대전화<span class="star">*</span></th>
                                <td>
                                    <select class="phone-option" id="recipient_phone_prefix">
                                        <option value="010">010</option>
                                        <option value="011">011</option>
                                        <option value="016">016</option>
                                        <option value="019">019</option>
                                    </select>
                                    <input type="hidden" id="recipient_phone" name="recipient_phone">
                                    - <input type="text" id="recipient_phone1"> - <input type="text" id="recipient_phone2"></td>
                            </tr>
                            </table>
                            <div class="border">
                                <select class="message-option" name="order_message" onchange="selectChange()">
                                    <option value="none" disabled selected> 메시지 선택 (선택사항) </option>
                                    <option value="배송 전에 미리 연락바랍니다.">배송 전에 미리 연락바랍니다.</option>
                                    <option value="부재 시 경비실에 맡겨주세요.">부재 시 경비실에 맡겨주세요.</option>
                                    <option value="부재 시 문 앞에 놓아주세요.">부재 시 문 앞에 놓아주세요.</option>
                                    <option value="택배함에 보관 부탁드립니다.">택배함에 보관 부탁드립니다.</option>
                                    <option value="" id="custom-message">사용자 직접입력</option>
                                </select>

                                <div class="custom-message-container">
                                    <textarea id="custom-message-textarea" oninput="customMessageChange()" placeholder="요청사항을 기재해주시기 바랍니다."></textarea>
                                </div>
                            </div>
                        </div>
                    </div>

                <div class="order-info-right">
                    <table>
                            <tr>
                                <th scope="row">상품금액</th>
                                <td id="totalPrice">원</td>
                            </tr>
                            <tr>
                                <th scope="row">할인금액</th>
                                <td>-0원</td>
                            </tr>
                            <tr>
                                <th scope="row">마일리지 사용</th>
                                <td>-0원</td>
                            </tr>
                            <tr>
                                <th scope="row">배송비</th>
                                <td class="shipping-fee"></td>
                            </tr>
                            <tr class="finalPrice">
                                <th scope="row">최종결제금액</th>
                                <td id="finalTotalPrice"></td>
                                <input type="hidden" value="" id="total_price" name="total_price">
                            </tr>
                            <tr>
                                <td colspan="4" class="foot-br"></td>
                            </tr>
                    </table>
                    <table class="benefit">
                        <tr>
                            <th>구매혜택</th>
                        </tr>
                        <tr>
                            <td>마일리지 <span class="mileage"></span>원이 구매완료 후 적립됩니다.</td>
                        </tr>
                    </table>
                    <div class="button-container">
                        <button class="orderBtn" id="orderBtn">구매하기</button>
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
<%@ include file = "../common/footer.jsp" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

    function selectChange() {
        var select = document.querySelector('.message-option');
        var customMessageContainer = document.querySelector('.custom-message-container');
        
        if (select.value === "") {
            customMessageContainer.style.display = 'block';
        } else {
            customMessageContainer.style.display = 'none';
        }
    }

    function customMessageChange() {
        var textarea = document.getElementById('custom-message-textarea');
        var customMessage = document.getElementById('custom-message');
        customMessage.value = textarea.value;
    }

    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }

    $(document).ready(function() {

        // 입력값 유효성 검사

        let formCheck = function() {
        let form = document.getElementById("orderForm");
        

        if(form.orderer_name.value=="") {
            alert("주문자 이름을 입력해 주세요.");
            form.orderer_name.focus();
            return false;
        }

        if(form.order_phone1.value=="" || form.order_phone2.value=="") {
            alert("전화번호를 입력해 주세요.");
            form.order_phone1.focus();
            return false;
        }

        if(form.recipient_name.value=="") {
            alert("수취인명을 입력해 주세요.");
            form.recipient_name.focus();
            return false;
        }

        if(form.postcode.value=="") {
            alert("주소를 입력해 주세요.");
            form.postcode.focus();
            return false;
        }

        if(form.detailAddress.value=="") {
            alert("상세주소를 입력해 주세요.");
            form.detailAddress.focus();
            return false;
        }

        if(form.recipient_phone1.value=="" || form.recipient_phone2.value=="") {
            alert("전화번호를 입력해 주세요.");
            form.recipient_phone1.focus();
            return false;
        }

        return true;
    }

        var total = 0;
        var mileage = 0;
        var finalTotalPrice = 0;

        var cartItemIds = [];

        $('.cart_item_id').each(function(index) {
            var cartId = parseInt($(this).val(), 10); // 문자열을 정수형으로 변환
            cartItemIds.push(cartId); // 정수형 값을 리스트에 추가
        });

        document.getElementById('cartItemIds').value = cartItemIds.join(','); // 리스트를 문자열로 변환하여 저장


        // 각각의 상품에 대해 수량과 가격을 곱해서 총 가격 계산
        $('.order_item_count').each(function(index) {
            var countText = $(this).text().match(/\d+/); // "수량: X개"에서 숫자만 추출
            var count = parseInt(countText, 10);

            var priceText = $(this).siblings('.order_item_price').text().replace(/[^0-9]/g, ''); // 가격에서 숫자만 추출
            console.log(priceText);
            var price = parseInt(priceText, 10);

            total += count * price;
        });

        $('#totalPrice').text(total.toLocaleString() + '원');

        mileage = total * 0.01;
        $('#mileage').text(mileage.toLocaleString() + '원 적립');
        $('.mileage').text(mileage.toLocaleString());

        if(total < 50000){
            $('.shipping-fee').text("3,000원");
            finalTotalPrice = total + 3000;
        }
        else{
            $('.shipping-fee').text("무료 (5만원 이상 결제)");
            finalTotalPrice = total;
        }

        $('#finalTotalPrice').text(finalTotalPrice.toLocaleString() + '원');
        document.getElementById('total_price').value = finalTotalPrice;

        // 구매하기 버튼 클릭 시
        $('#orderBtn').click(function() {

        if (!formCheck()) {
            event.preventDefault(); // 폼 제출을 막음
            return;
        }

            var emailPrefix = document.getElementById('email_prefix').value;
            var emailDomain = document.getElementById('email_domain').value;
            var orderer_email = emailPrefix + '@' + emailDomain;

            var orderPhonePrefix = document.getElementById('order_phone_prefix').value;
            var orderPhone1 = document.getElementById('order_phone1').value;
            var orderPhone2 = document.getElementById('order_phone2').value;
            var orderer_phone = orderPhonePrefix + orderPhone1 + orderPhone2;

            var recipientPhonePrefix = document.getElementById('recipient_phone_prefix').value;
            var recipientPhone1 = document.getElementById('recipient_phone1').value;
            var recipientPhone2 = document.getElementById('recipient_phone2').value;
            var recipient_phone = orderPhonePrefix + orderPhone1 + orderPhone2;

            var postcode = document.getElementById('postcode').value;
            var address = document.getElementById('address').value;
            var detailAddress = document.getElementById('detailAddress').value;
            var extraAddress = document.getElementById('extraAddress').value;
            var recipient_address = "("+ postcode + ") " + address + ' ' + detailAddress + extraAddress;

            document.getElementById('orderer_email').value = orderer_email;
            document.getElementById('orderer_phone').value = orderer_phone;
            document.getElementById('recipient_phone').value = recipient_phone;
            document.getElementById('recipient_address').value = recipient_address;

            form.submit();
        });


        $('#insert').click(function() {
            var orderName = document.getElementById("order_name").value;
            var orderPhonePrefix = document.getElementById('order_phone_prefix').value;
            var orderPhone1 = document.getElementById('order_phone1').value;
            var orderPhone2 = document.getElementById('order_phone2').value;

            $('.order_info_table input[placeholder="이름 입력"]').last().val(orderName);
            
            // 배송지 아래의 휴대전화 번호 설정하기
            $('.order_info_table select.phone-option').last().val(orderPhonePrefix);
            document.getElementById('recipient_phone1').value = orderPhone1;
            document.getElementById('recipient_phone2').value = orderPhone2;
        });

        $('#new-insert').click(function() {
            // 새로운 배송지 옵션 선택 시 입력 필드 초기화
            document.getElementById("recipient_name").value = '';
            document.getElementById('recipient_phone_prefix').value = '010';
            document.getElementById('recipient_phone1').value = '';
            document.getElementById('recipient_phone2').value = '';
        });

    });
</script>
</html>