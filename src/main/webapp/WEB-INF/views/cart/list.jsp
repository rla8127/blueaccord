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
</head>
<style>
body {
  margin: 0;
}

* {
  box-sizing: border-box;
}

p,
span {
  margin: 0;
}

a {
  color: black;
}

img {
  display: block;
  width: 80px;
  height: 80px;
  margin: auto;
}

.container {
  width: 80%;
  margin: auto;
  padding: 30px;
}

.cart-container-header h2{
  color: black;
  padding-top: 30px;
  padding-bottom: 50px;
  font-size: 20px;
}


table {
  border-top: solid 1.5px black;
  border-collapse: collapse;
  width: 100%;
  font-size: 14px;
}

thead {
  text-align: center;
  font-weight: bold;
}

tbody {
  font-size: 12px;
}

td {
  padding: 15px 0px;
  border-bottom: 1px solid lightgrey;
}

.cart__list__detail :nth-child(3) {
  vertical-align: top;
}

.cart__list__detail :nth-child(3) a {
  font-size: 12px;
}

.cart__list__detail :nth-child(3) p {
  margin-top: 6px;
  font-weight: bold;
}

.cart__list__smartstore {
  font-size: 12px;
  color: gray;
}

.cart__list__option {
  vertical-align: top;
  padding: 20px;
}

.cart__list__option p {
  margin-bottom: 25px;
}

.cart__list__option p::after {
  content: "";
  width: 90%;
  height: 1px;
  
  left: 0px;
  top: 25px;
  position: absolute;
}

.selectBtn {
  background-color: white;
  font-size: 10px;
  border: lightgrey solid 1px;
  padding: 7px;
}

button:hover {
  cursor: pointer;
}

.cart__list__detail :nth-child(4),
.cart__list__detail :nth-child(5),
.cart__list__detail :nth-child(6) {
  border-left: 2px solid whitesmoke;
}

.cart__list__detail :nth-child(5),
.cart__list__detail :nth-child(6) {
  text-align: center;
}

.cart__list__detail :nth-child(5) button {
  background-color: rgb(0, 0, 0);
  color: white;
  border: none;
  border-radius: 5px;
  padding: 4px 8px;
  font-size: 12px;
  margin-top: 5px;
}

.quantity-change-button {
  background-color: rgb(0, 0, 0);
  color: white;
  border: none;
  border-radius: 5px;
  padding: 4px 8px;
  font-size: 12px;
}

.price {
  font-weight: bold;
}

.cart__mainbtns {
  width: 420px;
  height: 200px;
  padding-top: 40px;
  display: block;
  margin: auto;
}

.shoppingBtn, .bigorderbtn {
  width: 200px;
  height: 50px;
  font-size: 16px;
  margin: auto;
  border-radius: 5px;
}

.shoppingBtn {
  background-color: white;
  border: 1px lightgray solid;
}

.bigorderbtn {
  background-color: rgb(0, 0, 0);
  color: white;
  border: none;
}

.quantity-container {
    display: flex;
    align-items: center;
    font-weight: bold;
    }

    .quantity-button {
        width: 35px;
        height: 35px;
        cursor: pointer;
        color: white;
        background-color: black;
        border: 1px solid black;
        font-size: 20px;
    }

    .input-info {
        text-decoration: none;
        text-align: center;
        width: 40px;
        height: 35px;
        border: 1px solid black;
        font-size: 13px;
    }

    .quantity-change-button {
      display: inline-block;
      height: 35px;
      width: 70px;
      margin-left: 10px;
    }

    /* Chrome, Safari, Edge, Opera */
  input[type=number]::-webkit-inner-spin-button, 
  input[type=number]::-webkit-outer-spin-button { 
      -webkit-appearance: none; 
      margin: 0; 
  }

</style>
<body>
    <div class="container">
      <div class="cart-container-header">
        <h2>장바구니</h2>
      </div>
        <table class="cart__list">
            <form>
                <thead>
                    <tr>
                        <td><input type="checkbox" class="allCheckBox"></td>
                        <td colspan="2">상품정보</td>
                        <td>옵션</td>
                        <td>상품금액</td>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="cartListDto" items="${list}">
                    <c:set var="totalPrice" value="${cartListDto.price * cartListDto.count}" />
                    <c:set var="grandTotal" value="${grandTotal + totalPrice}" />
                        <tr class="cart__list__detail">
                            
                            <td><input type="checkbox" class="checkItem" data-cart_item_id="${cartListDto.cart_item_id}" data-item_id="${cartListDto.item_id}"></td>
                            <td><img src="${cartListDto.rep_img_url}" alt="magic keyboard"></td>
                            <td><a href="<c:url value='/item?item_id=${cartListDto.item_id}'/>">BLUEACCORD > 선택 상품 바로가기</a>
                                <p>${cartListDto.item_nm}</p>
                                <span class="price" data-price="${cartListDto.price}"><fmt:formatNumber value="${cartListDto.price}" type="number" pattern="#,##0"/>원</span>
                            </td>
                            <td class="cart__list__option">
                                <p>상품명 : ${cartListDto.item_nm} </p>
                                <div class="quantity-container">
                                  <button type="button" class="quantity-button" onclick="decreaseQuantity()">-</button>
                                  <input type="number" name="quantity" id="quantity" class="input-info" value="${cartListDto.count}" min="0">
                                  <button type="button" class="quantity-button" onclick="increaseQuantity()">+</button>
                                  <button class="quantity-change-button">수량 변경</button>
                              </div>
                            </td>
                            <td><span class="totalprice"><fmt:formatNumber value="${totalPrice}" type="number" pattern="#,##0"/>원</span><br>
                                <button class="cart__list__orderbtn">주문하기</button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="3"><button class="selectBtn delBtn">선택상품 삭제</button></td>
                        <td></td>
                        <td></td>
                    </tr>
                </tfoot>
            </form>
        </table>
        <form id="orderForm" action="/order" method="POST">
          <div class="cart__mainbtns">
              <a href="<c:url value='/category?category=CAP'/>"><button type="button" class="shoppingBtn">쇼핑 계속하기</button></a>
              <button type="submit" class="bigorderbtn">주문하기</button>
          </div>
      </form>
    </div>
</body>
<%@ include file = "../common/footer.jsp" %>
<script>
  $(document).ready(function(){

      // 전체 선택 체크박스 클릭 시 모든 체크박스 선택/해제
      $('.allCheckBox').click(function(){
          $('.checkItem').prop('checked', $(this).prop('checked'));
      });

      $('.delBtn').click(function(event){
          event.preventDefault();
          var selectedItems = [];

            // 체크된 항목의 data-cart-id 수집
            $('input.checkItem:checked').each(function() {
                var cart_item_id = $(this).data('cart_item_id');
                selectedItems.push(cart_item_id);
            });

          // AJAX를 사용하여 서버에 데이터 전송
          $.ajax({
              url: '/cart/delete',
              method: 'DELETE',
              contentType: 'application/json',
              data: JSON.stringify(selectedItems),
              success: function(response) {
                  // 성공 처리 - 예를 들어, 페이지 새로고침 또는 DOM에서 삭제된 항목 제거
                  alert('선택한 상품이 삭제되었습니다.');
                  $('input[type=checkbox]:checked').closest('tr').remove(); // DOM에서 삭제된 항목 제거
              },
              error: function(xhr, status, error) {
                  // 오류 처리
                  alert('상품 삭제 중 오류가 발생했습니다. ');
                  console.log(error);
              }
          });
      });

      // 주문하기 버튼 클릭 시 선택된 항목을 orderForm에 추가
      $('.bigorderbtn').click(function(event) {
          event.preventDefault(); // 기본 폼 제출 동작 방지

          var selectedItems = [];

          // 체크된 항목의 data-cart_item_id 수집
          $('input.checkItem:checked').each(function() {
              var cart_item_id = $(this).data('cart_item_id');
              selectedItems.push(cart_item_id);
          });

          if (selectedItems.length > 0) {
              // 선택된 항목을 hidden input으로 orderForm에 추가
              selectedItems.forEach(function(cart_item_id) {
                  $('#orderForm').append('<input type="hidden" name="cart_item_id_list" value="' + cart_item_id + '">');
              });

              // 폼 제출
              $('#orderForm').submit();
          } else {
              alert('주문할 상품을 선택해주세요.');
          }
      });

  // 수량 조절 버튼 클릭 시 totalPrice 업데이트
  $('.quantity-button').click(function() {
          var quantityInput = $(this).siblings('.input-info');
          var currentQuantity = parseInt(quantityInput.val());
          var unitPrice = parseInt(quantityInput.closest('.cart__list__detail').find('.price').data('price'));
          var newQuantity = $(this).text() === '-' ? currentQuantity - 1 : currentQuantity + 1;

          if (newQuantity >= 0) {
              quantityInput.val(newQuantity);

              // Update totalPrice for this item
              var newTotalPrice = unitPrice * newQuantity;
              quantityInput.closest('.cart__list__detail').find('.totalprice').text(newTotalPrice.toLocaleString() + '원');
          }
      });

      // 수량 직접 입력 시 totalPrice 업데이트
      $('.input-info').on('input', function() {
          var newQuantity = parseInt($(this).val());
          if (!isNaN(newQuantity) && newQuantity >= 0) {
              var unitPrice = parseInt($(this).closest('.cart__list__detail').find('.price').data('price'));

              var newTotalPrice = unitPrice * newQuantity;
              $(this).closest('.cart__list__detail').find('.totalprice').text(newTotalPrice.toLocaleString() + '원');
          }
      });

      // 수량 변경 버튼 클릭 시 AJAX로 업데이트 요청
      $('.quantity-change-button').click(function(event) {
        event.preventDefault();

          var quantityInput = $(this).siblings('.input-info');
          var count = parseInt(quantityInput.val());
          var item_id = $(this).closest('.cart__list__detail').find('.checkItem').data('item_id');

          if (!isNaN(count) && count >= 0) {
              $.ajax({
                  url: '/cart/update',
                  method: 'PATCH',
                  contentType: 'application/json',
                  data: JSON.stringify({ item_id: item_id, count: count }),
                  success: function(response) {
                      // 성공 처리
                      alert('수량이 업데이트되었습니다.');
                  },
                  error: function(xhr, status, error) {
                      // 오류 처리
                      alert('수량 업데이트 중 오류가 발생했습니다.');
                      console.log(error);
                  }
              });
          } else {
              alert('유효한 수량을 입력해주세요.');
          }
      });
  });
</script>
</html>