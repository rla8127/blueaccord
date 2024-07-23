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

p, span {
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

.wish-container-header h2{
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

.wish__list__detail :nth-child(3) {
  vertical-align: top;
}

.wish__list__detail :nth-child(3) a {
  font-size: 12px;
}

.wish__list__detail :nth-child(3) p {
  margin-top: 6px;
  font-weight: bold;
}

.wish__list__smartstore {
  font-size: 12px;
  color: gray;
}

.wish__list__option {
  vertical-align: top;
  padding: 20px;
}

.wish__list__option p {
  margin-bottom: 25px;
}

.wish__list__option p::after {
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

.wish__list__detail :nth-child(4),
.wish__list__detail :nth-child(5),
.wish__list__detail :nth-child(6) {
  border-left: 2px solid whitesmoke;
}

.wish__list__detail :nth-child(5),
.wish__list__detail :nth-child(6) {
  text-align: center;
}

.cartSaveBtn {
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

.button-container {
  width: 420px;
  height: 200px;
  padding-top: 40px;
  display: block;
  margin: auto;
}

.button-container button {
  width: 200px;
  height: 50px;
  font-size: 16px;
  margin: auto;
  border-radius: 5px;
}

#shopBtn {
  background-color: white;
  border: 1px lightgray solid;
}

#cartBtn {
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

  /* Firefox */
  input[type=number] {
      -moz-appearance: textfield;
  }

</style>
<body>
    <div class="container">
        <div class="wish-container-header">
          <h2>관심상품</h2>
        </div>
        <table class="wish__list">
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
                    <c:forEach var="wishListDto" items="${list}">
                        <tr class="wish__list__detail">                           
                            <td><input type="checkbox" class="checkItem" data-wish_id="${wishListDto.wish_id}" data-item_id="${wishListDto.item_id}"></td>
                            <td><img src="${wishListDto.rep_img_url}" alt="magic keyboard"></td>
                            <td><a href="<c:url value='/item?item_id=${wishListDto.item_id}'/>">BLUEACCORD > 선택 상품 바로가기</a>
                                <p>${wishListDto.item_nm}</p>
                                <span class="price" data-price="${wishListDto.price}"><fmt:formatNumber value="${wishListDto.price}" type="number" pattern="#,##0"/>원</span>
                            </td>
                            <td class="wish__list__option">
                                <p>상품명 : ${wishListDto.item_nm} </p>
                            </td>
                            <td><span class="totalprice"><fmt:formatNumber value="${wishListDto.price}" type="number" pattern="#,##0"/>원</span><br>
                                <button class="cartSaveBtn" data-item_id="${wishListDto.item_id}">장바구니</button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="3"><button class="selectBtn delBtn">선택상품 삭제</button></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </tfoot>
            </form>
        </table>
        <div class="button-container">
            <a href="<c:url value='/category?category=ETC'/>"><button id="shopBtn">쇼핑 계속하기</button></a>
            <a href="<c:url value='/cart/list'/>"><button id="cartBtn">장바구니 이동</button></a>
        </div>
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

        // 체크된 항목의 data-wish-id 수집
        $('input.checkItem:checked').each(function() {
            var wish_id = $(this).data('wish_id');
            selectedItems.push(wish_id);
        });

        alert(selectedItems);

      // AJAX를 사용하여 서버에 데이터 전송
      $.ajax({
          url: '/wish/delete',
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

  $(".cartSaveBtn").click(function(event){
    event.preventDefault();

    var item_id = this.getAttribute('data-item_id');
    var count = 1;
        
    $.post("<c:url value='/cart/add'/>", { item_id: item_id, count: count })
        .done(function(response) {
            alert('장바구니에 추가되었습니다');
        })
        .fail(function(xhr, status, error) {
            alert('추가 실패:' + status + ' - ' + error);
        });
    });

  // 수량 조절 버튼 클릭 시 totalPrice 업데이트
  $('.quantity-button').click(function() {
          var quantityInput = $(this).siblings('.input-info');
          var currentQuantity = parseInt(quantityInput.val());
          var unitPrice = parseInt(quantityInput.closest('.wish__list__detail').find('.price').data('price'));
          var newQuantity = $(this).text() === '-' ? currentQuantity - 1 : currentQuantity + 1;

          if (newQuantity >= 0) {
              quantityInput.val(newQuantity);

              // Update totalPrice for this item
              var newTotalPrice = unitPrice * newQuantity;
              quantityInput.closest('.wish__list__detail').find('.totalprice').text(newTotalPrice.toLocaleString() + '원');
          }
      });
  });
</script>
</html>