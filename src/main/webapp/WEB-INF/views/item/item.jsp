<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file = "../common/header.jsp" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <meta charset="UTF-8">
    <title>상품 정보</title>
    <style>
    * {
        margin: 0;
        padding: 0;
        font-family: 'poppins', sans-serif;
        box-sizing: border-box;
    }

    li {
        list-style: none;
    }

    .container {
        width: 1240px;
        margin: 0 auto;
    }

    .product-detail-box {
        width: 100%;
        padding: 60px 0;
        overflow: hidden; 
    }

    .product-left-box {
        float: left;
        width: 580px;
    }

    .product-right-box {
        float: right;
        width: 580px;
    }

    .product-right-box h3 {
        font-size: 32px;
        font-weight: bold;
        padding-bottom: 20px;
    }

    .product-right-box p {
        font-size: 25px;
        font-weight: bold;
        padding-bottom: 35px;
    }

    img{
        width: 580px;
        height: 580px;
    }

    table{
        padding: 10px;
        width: 100%;
        
    }


    th{
        text-align: left;
        width: 20%;
        padding-bottom: 12px;
        padding-right: 20px;
    }
    
    td{
        padding-bottom: 12px;
    }

    tfoot .foot-br{
        border-top: 2px solid black;
        padding-top: 20px;
    }

    tfoot td .right1{
        float: right;
    }

    .d_total{
        font-size: 16px;
        font-weight: bold;
        display: inline-block;
    }

    .total {
        width: 150px;
        text-align: right;
        font-size: 20px;
        display: inline-block;
        line-height: 48px;
    }

    .button-container > .left-button {
        font-weight: bold;
        width: 22%;
        height: 50px;
        font-size: 15px;
        background-color: white;
        border: 1px solid #a1a1a1;
    }
    
    .button-container > button:hover, .buyBtn:hover, .review-container button:hover {
        cursor: pointer;
    }

    .buyBtn{
        color: white;
        background-color: black;
        border: 1px solid #000;
        height: 50px;
        font-size: 15px;
        font-weight: bold;
        width: 54%;
    }


    .item-info-bottom{
        padding-top: 120px;
        font-size: 12px;
    }

    .quantity-container {
    display: flex;
    align-items: center;
    font-weight: bold;
    }

    .quantity-button {
        width: 37px;
        height: 37px;
        cursor: pointer;
        color: white;
        background-color: black;
        border: 1px solid black;
        font-size: 20px;
    }

    .input-info {
        text-decoration: none;
        text-align: center;
        width: 45px;
        height: 37px;
        border: 1px solid black;
        font-size: 15px;
    }

    .img-container{
        width: 100%;
        text-align: center;
    }

    .img-container img{
        margin-bottom: 50px;
        width: 800px;
        height: 800px;
    }

    .review-btn-container{
        font-size: 0;
        text-align: center;
        width: 100%;
        padding: 30px 0;
    }

    .review-btn-container button{
        font-size: 14px;
        width: 25%;
        height: 50px;
        color: white;
        background-color: black;
        border-left: 1px 300 white;
    }

    .review-container-header{
        font-size: 20px;
        font-weight: bold;
        padding-bottom: 20px;
    }

    .review-container-header button{
        width: 120px;
        height: 50px;
        margin-left: 10px;
        background-color: white;
        border: 1px solid #e5e5e5;
        float: right;
    }

    .user-review-container{
        font-size: 20px;
        padding-bottom: 15px;
        margin-bottom: 35px;
        border-bottom: 1px solid #828c94;
    }

    .reviewer-name{
    }

    .review-rate{
    }

    .review-content{
        padding: 10px 0;
    }

    .helpful{
        font-size: 14px;
    }

    /* ... 기존 스타일 ... */
    .write-review-container {
        display: none;
        margin: 20px 0;
        padding-bottom: 20px;
    }
    .write-review-container textarea {
        width: 100%;
        height: 100px;
        padding: 5px;
        resize: none;
        margin-bottom: 5px;
    }

    .write-review-container button{
        font-size: 14;
        width: 120px;
        height: 40px;
        background-color: #e6e6e6;
        border: 1px solid black;
    }

    .rating{
        padding-bottom: 15px;
    }

    .rating h3{
        font-size: 18px;
    }

    .rating p{
        font-size: 14px;
    }

    .rating .star {
    font-size: 30px;
    cursor: pointer;
    color: #ccc;
    }

    .rating .star.selected {
        color: black;
    }

    .star, .total-rating-star{
    color: #ccc; /* 기본 색상 */
    }

    .star.filled, .total-rating-star .total-filled{
        color: black; /* 채워진 별의 색상 (금색) */
    }

    .rating-container{
        width: 100%;
        margin: 40px 0;
        padding: 20px 0;
        background-color: #e5e5e5;
        display: flex;
        justify-content: center;
        border-radius: 5px;
    }

    .rating-table{
        width: 80%;
        text-align: center;
    }

    .rating-container th{
        width: 50%;
        text-align: center;
        font-size: 26px;
    }

    .rating-container th{
        width: 50%;
        text-align: center;
        font-size: 32px;
    }

    .review-item-nm{
        color: #828c94;
        font-size: 14px;
    }

    .review-content{
        font-size: 16px;
    }

    .helpfulBtn{
        width: 110px;
        height: 35px;
        background-color: white;
        border: 1px solid #a1a1a1;
        font-size: 16px;
    }

    #delReviewBtn{
        width: 50px;
        height: 35px;
        background-color: white;
        border: 1px solid #a1a1a1;
        font-size: 16px;
    }

    .input-info::-webkit-outer-spin-button,
    .input-info::-webkit-inner-spin-button{
    -webkit-appearance: none;
    margin: 0; /* Safari and Chrome */
    }

    .rating-score{
        float: left;
        font-size: 12px;
        font-weight: bold;
        line-height: 20px;
        padding-right: 5px;
    }

    .rating-bar {
        width: 60%;
        height: 20px;
        background-color: lightgray;
        border-radius: 5px;
        overflow: hidden;
        margin-bottom: 5px;
    }
    
    .rating-bar .fill {
        height: 100%;
        background-color: black;
        width: 0;
        border-radius: 5px;
    }

    #refundSection {
        display: none;
        padding: 10px;
        background-color: #f0f0f070;
        border: 1px solid #e5e5e5;
        margin: 30px 0;
    }
    
</style>
</head>
<body>
    <c:set var="calculatedPrice" value="${itemDto.price  * 0.01}" />
    <c:set var="item_id" value="${param.item_id}" />

    <div class="container">
        <div class="product-detail-box">
            <div class="product-left-box">
                <img src="${pageContext.request.contextPath}${imagePaths[0]}" alt="BlueAccord"/></img>
            </div>
            <div class="product-right-box">
                <h3>${itemDto.item_nm}</h3>
                <p>${itemDto.price}원</p>
                <table>
                    <tbody>
                        <tr>
                            <th scope="row">적립금</th>
                            <td><fmt:formatNumber value="${calculatedPrice}" type="number" maxFractionDigits="0" />원 (1%)</td>
                        </tr>
                        <tr>
                            <th scope="row">배송비</th>
                            <td><span>3,000원 (5만원이상 구매시 무료)</span></td>
                        </tr>
                        <tr>
                            <th scope="row">상품설명</th>
                            <td>${itemDto.item_detail}</td>
                        </tr>
                        <tr>
                            <th scope="row">수량선택</th>
                            <td>
                                <div class="quantity-container">
                                    <button type="button" class="quantity-button" onclick="decreaseQuantity()">-</button>
                                    <input type="number" name="quantity" id="quantity" class="input-info" value="0" min="0">
                                    <button type="button" class="quantity-button" >+</button>
                                </div>            
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4"><div class="item-info-bottom">(최소주문수량 1개 이상 / 최대주문수량 998개 이하)</div></td>
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="4" class="foot-br" id="buylist"></td>
                        </tr>
                        <tr>
                            <td colspan="4" >
                                <div class="right1">
                                    <div class="d_total">총 상품금액</div>
                                    <span class="total">0원</span>
                                </div>
                            </td>
                        </tr>
                    </tfoot>
                </table>

                <div class="button-container">
                    <button type="button" class="wishBtn left-button">WISHLIST</button>
                    <button type="button" class="cartBtn left-button">CART</button>
                    
                    <form id="orderForm" method="post" action="/order" style="display:none;">
                        <input type="hidden" name="item_id" id="formItem_id" />
                        <input type="hidden" name="count" id="formCount" />
                    </form>
                    <button type="button" class="buyBtn">BUY IT</button>
                </div>
            </div>
        </div>
        <div class="img-container" id="img-container">
        <c:forEach var="imagePath" items="${imagePaths}">
                <img src="${pageContext.request.contextPath}${imagePath}" alt="BlueAccord"/></img>
        </c:forEach>
        <img src="/notice/itemDetail.png" alt="BlueAccord"/></img>
        </div>

        <div class="review-container">
            <div class="review-btn-container">
                <button type="button" id="detailBtn">상세정보</button>
                <button type="button" id="reviewBtn">상품리뷰</button>
                <a href="/cs/question/list"><button type="button" id="qnaBtn">상품문의</button></a>
                <button type="button" id="refundBtn">배송/환불 안내</button>
            </div>
            <div id="refundSection">
                <p>
                    <strong>배송 지역</strong> : 전국(일부 지역 제외)<br>
                    <strong>배송 방식</strong> : CJ대한통운 택배사<br>
                    <strong>배송비</strong> : 3,000원 (30,000원 이상 구매시 무료배송)<br>
                    * 도서 산간 지역은 별도의 추가 금액이 발생할 수도 있습니다.<br>
                    * 네이버페이 주문의 경우 제주 및 도서산간 추가배송비인 2,500원이 별도로 안내되며,<br>
                    미입금시 출고가 지연될 수 있는 점 참고하여 주시기 바랍니다.<br>
                    배송정보 : 오후 12시 이전 결제완료된 주문건에 한하여 당일 발송됩니다. (토요일, 일요일, 공휴일은 배송일에서 제외)<br>
                    *도서 산간 지역은 배송일이 추가적으로 소요될 수 있으며, 상품의 재고 상황에 따라 다소 지연될 수 있습니다.<br><br><br>
                </p>       
                <p>
                    <strong>교환/반품 기간</strong> : 고객님의 변심으로 인한 교환 반품은 제품 수령일로부터 7일 이내<br>
                    <strong>교환/반품 배송비</strong> : 고객님의 변심으로 인한 제품 교환/반품은 고객님께서 부담하셔야 합니다.<br>
                    * 단, 제품 불량, 하자가 있는 경우에 한하여 택배비 제외<br>
                    단순 변심으로 인한 단순 변심에 의한 교환 및 반품의 경우 왕복 배송비용 6,000원을 부담하셔야 합니다.<br>
                </p>       
            </div>
            <div class="review-container-header" id="review-container-header">
                <span>REVIEW</span>
                <button type="button" id="reviewWriteBtn">리뷰쓰기</button>            
            </div>
            <div>
                
            </div>
            <div class="write-review-container">
                <div class="rating">
                    <h3>이 상품의 품질에 대해 얼마나 만족하시나요?</h3>
                    <p>구매상품: (${itemDto.item_nm})</p>
                    <span class="star" data-value="1"><i class="fas fa-star"></i></span>
                    <span class="star" data-value="2"><i class="fas fa-star"></i></span>
                    <span class="star" data-value="3"><i class="fas fa-star"></i></span>
                    <span class="star" data-value="4"><i class="fas fa-star"></i></span>
                    <span class="star" data-value="5"><i class="fas fa-star"></i></span>
                </div>
                <input type="hidden" name="rating" id="rating" value="0">
                <textarea placeholder="이 상품을 상세히 평가해주세요."></textarea>
                <div>
                    <button id="submitReviewBtn">작성완료</button>
                    <button id="cancelReviewBtn">닫기</button>
                </div>
            </div>
            <div class="rating-container">
                <table class="rating-table">
                    <tr>
                        <th>
                            <span class="total-rating-star" data-value="1"><i class="fas fa-star"></i></span>
                            <span class="total-rating-star" data-value="2"><i class="fas fa-star"></i></span>
                            <span class="total-rating-star" data-value="3"><i class="fas fa-star"></i></span>
                            <span class="total-rating-star" data-value="4"><i class="fas fa-star"></i></span>
                            <span class="total-rating-star" data-value="5"><i class="fas fa-star"></i></span>
                            <span class="total-rating" data-value="${totalRating}">${totalRating}</span>
                        </th>
                        <td>
                            <div class="rating-score">5점</div>
                            <div class="rating-bar" data-rating="5"><div class="fill"></div></div>
                            <div class="rating-score">4점</div>
                            <div class="rating-bar" data-rating="4"><div class="fill"></div></div>
                            <div class="rating-score">3점</div>
                            <div class="rating-bar" data-rating="3"><div class="fill"></div></div>
                            <div class="rating-score">2점</div>
                            <div class="rating-bar" data-rating="2"><div class="fill"></div></div>
                            <div class="rating-score">1점</div>
                            <div class="rating-bar" data-rating="1"><div class="fill"></div></div>
                        </td>
                    </tr>
                </table>
            </div>
            <c:forEach var="review" items="${reviews}">
            <div class="user-review-container">
                <input type="hidden" class="review_id" value="${review.review_id}"/>
                <div class="reviewer-name">${review.reviewer}</div>
                <div class="stars">
                    <c:forEach begin="1" end="5" var="i">
                        <span class="star <c:if test="${i <= review.rating}">filled</c:if>" data-value="${i}">
                            <i class="fas fa-star"></i>
                        </span>
                    </c:forEach>
                    <span class="review-date">${review.review_date}</span>
                </div>
                <div class="review-item-nm">${itemDto.item_nm}</div>
                <div class="review-content">${review.review_content}</div>
                <div class="helpful">
                    <button class="helpfulBtn" data-review-id="${review.review_id}">도움이 돼요</button>
                    <c:if test="${id == review.reviewer}"><button id="delReviewBtn" data-review-id="${review.review_id}">삭제</button></c:if>
                    <span class="helpful-count">${review.helpful}</span>명에게 도움이 되었습니다.
                </div>
            </div>
            </c:forEach>
        </div>
    </div>
</body>
<%@ include file = "../common/footer.jsp" %>
<script>
    var itemPrice = <c:out value="${itemDto.price}" />;
    var item_id = <c:out value="${item_id}" />; // JSP에서 item_id 값을 가져옵니다

    $('#reviewWriteBtn').click(function() {
        $('.write-review-container').show();
    });

    $('#cancelReviewBtn').click(function() {
        $('.write-review-container').hide();
    });

    $('#submitReviewBtn').click(function(event){
          event.preventDefault();

        var rating = parseInt($('#rating').val());
        var reviewContent = $('textarea').val().trim();

        if (rating < 1 || rating > 5) {
            alert('평가 점수를 선택해주세요.');
            return;
        }
        if (reviewContent === '') {
            alert('리뷰 내용을 입력해주세요.');
            return;
        }

        // AJAX를 사용하여 서버에 데이터 전송
        var reviewDto = {
            rating: rating,
            review_content: reviewContent,
            item_id: item_id
        };

        $.ajax({
            url: '/review/insert',
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(reviewDto),
            success: function(response) {
                alert("리뷰가 등록되었습니다.");
                // 성공 처리 - 예를 들어, 페이지 새로고침 또는 DOM에서 삭제된 항목 제거
            },
            error: function(xhr, status, error) {
                // 오류 처리
                var errorMsg = xhr.responseText;
                alert("리뷰 등록 중 오류가 발생했습니다.\n오류 메시지: " + errorMsg);
            }
        });
    });

    $('.helpfulBtn').click(function() {

        var review_id = $(this).data("review-id");
        var helpfulCount = $(this).siblings('.helpful-count');

        $.ajax({
            url: '/review/helpful',
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(review_id),
            success: function(response) {
                // 성공 시 helpful count 증가
                var currentCount = parseInt(helpfulCount.text());

                if(response === "increase")
                    helpfulCount.text(currentCount + 1);

                else if(response === "decrease")
                    helpfulCount.text(currentCount - 1);
            },
            error: function(xhr, status, error) {
                alert('에러');
                console.log(error);
            } 
        });

    });

    $('#delReviewBtn').click(function() {
       var review_id = $(this).data("review-id");
       const reviewContainer = $(this).closest('.user-review-container');
       
       $.ajax({
            url: '/review/delete',
            method: 'DELETE',
            contentType: 'application/json',
            data: JSON.stringify(review_id),
            success: function(response) {
                alert('리뷰를 삭제했습니다.');        
                reviewContainer.remove(); 
            },
            error: function(xhr, status, error) {
                alert('에러');
                console.log(error);
            }
       })
    });

    $('.wishBtn').click(function() {
        var item_id = <c:out value="${item_id}" />; // JSP에서 item_id 값을 가져옵니다
        
        $.ajax({
              url: '/wish',
              method: 'POST',
              contentType: 'application/json',
              data: JSON.stringify(item_id),
              success: function(response) {
                  // 성공 처리 - 예를 들어, 페이지 새로고침 또는 DOM에서 삭제된 항목 제거
                  alert('관심상품이 등록되었습니다.');
                  $('input[type=checkbox]:checked').closest('tr').remove(); // DOM에서 삭제된 항목 제거
              },
              error: function(xhr, status, error) {
                var errorMsg = xhr.responseText; // 서버에서 받은 오류 메시지
                alert(errorMsg);
              }
          });
    });

    $('.buyBtn').click(function() {
        var item_id = <c:out value="${item_id}" />;
        var count = $('#quantity').val();

        console.log("item_id = " + item_id);
        console.log("count = " + count);

        if (count < 1) {
            alert("수량을 1개 이상 선택해주세요.");
            return;
        }

        $.post('/cart/add', { item_id: item_id, count: count })
            .done(function(response) {
                if (response.status === 'OK') {
                    alert('장바구니에 추가되었습니다.');
                    
                    var cartItemId = response.cartItemId;
                    console.log("cartItemId = " + cartItemId);

                    $('#orderForm').append('<input type="hidden" name="cart_item_id_list" value="' + cartItemId + '">');
                    alert(cartItemId);
                    $('#orderForm').submit();
                } else {
                    alert('추가 실패: ' + response.status);
                }
            })
            .fail(function(xhr, status, error) {
                alert('추가 실패: ' + status + ' - ' + error);
            });
    });
    

    $('.cartBtn').click(function() {
    // item_id와 count 값을 설정합니다.
    var item_id = <c:out value="${item_id}" />;
    var count = $('#quantity').val();  

    // count 값이 1일 경우 경고 메시지 표시
    if (count < 1) {
        alert("수량을 1개 이상 선택해주세요.");
    } else {
        // count 값이 1 이상일 경우에만 POST 요청을 보냅니다.
        $.post('/cart/add', { item_id: item_id, count: count })
            .done(function(response) {
                alert('장바구니에 추가되었습니다: ' + response);
            })
            .fail(function(xhr, status, error) {
                alert('추가 실패: ' + status + ' - ' + error);
            });
        }
    });

 

    function updateBuyList(quantity) {
        var totalPrice = itemPrice * quantity;
        var buyListHtml = '';

        if (totalPrice > 0) {
            buyListHtml = '<ul><li>상품명: ${itemDto.item_nm}</li><li>수량: ' + quantity + '</li><li>가격: ' + totalPrice.toLocaleString() + '원</li></ul>';
        }

        $('#buylist').html(buyListHtml);
        $('.total').text(totalPrice.toLocaleString() + '원');
    }

    $(document).ready(function() {

        // 전체 평균

        var totalRating = $('.total-rating').data('value');

        <c:forEach items="${ratingCounts}" var="ratingCount">
            var rating = ${ratingCount.rating};
            var count = ${ratingCount.count};  
            var maxCount = ${maxCount};

            var $ratingBar = $('.rating-bar[data-rating="' + rating + '"]');
            
            // rating-bar 안의 fill 요소에 count를 반영하여 너비 조정
                var fillWidth = (count / maxCount) * 100;
                $ratingBar.find('.fill').css('width', fillWidth + '%');
        </c:forEach>

        $('.total-rating-star').each(function() {
            var starValue = $(this).data('value');
            console.log(starValue);
            console.log(totalRating);
            if(starValue <= totalRating){
                $(this).find('i').addClass('total-filled');
                console.log("ok")
            }
        });


        $('.star').click(function() {
        var rating = $(this).data('value');
        $('#rating').val(rating);
        $('.star').removeClass('selected');
        $(this).addClass('selected');
        $(this).prevAll('.star').addClass('selected');
        });

        // 별 클릭 이벤트
        $('.star').click(function() {
            var rating = $(this).data('value');
            $('#rating').val(rating);
            $('.star').removeClass('selected');
            $(this).addClass('selected');
            $(this).prevAll('.star').addClass('selected');
        });

        // 별 호버 이벤트
        $('.star').hover(
            function() {
                $(this).addClass('hover');
                $(this).prevAll('.star').addClass('hover');
            }, function() {
                $('.star').removeClass('hover');
            }
        );

        // 별이 호버될 때의 스타일링 처리
        $('.star').on('mouseenter', function() {
            var currentStar = $(this);
            currentStar.addClass('hover');
            currentStar.prevAll('.star').addClass('hover');
            currentStar.nextAll('.star').removeClass('hover');
        });

        $('.rating').on('mouseleave', function() {
            $('.star').removeClass('hover');
        });

        $('#quantity').on('input', function() {
            var quantity = parseInt($(this).val());
            if (!isNaN(quantity) && quantity >= 0 && quantity <= 998) {
                updateBuyList(quantity);
            }
        });

        $('.quantity-button').on('click', function() {
            var quantityInput = $('#quantity');
            var currentQuantity = parseInt(quantityInput.val());
            if ($(this).text() === '-') {
                if (currentQuantity > 0) {
                    quantityInput.val(currentQuantity - 1).trigger('input');
                }
            } else {
                if (currentQuantity < 998) {
                    quantityInput.val(currentQuantity + 1).trigger('input');
                }
            }
        });

        // Initialize buy list with default quantity of 1
        updateBuyList(0);

        $('#detailBtn').click(function() {
            // detailSection 요소를 찾아서 scrollIntoView() 메서드를 사용하여 스크롤
            document.getElementById('img-container').scrollIntoView({ 
                behavior: 'smooth' // 부드럽게 스크롤
            });
        });

        $('#reviewBtn').click(function() {
            // detailSection 요소를 찾아서 scrollIntoView() 메서드를 사용하여 스크롤
            document.getElementById('review-container-header').scrollIntoView({ 
                behavior: 'smooth' // 부드럽게 스크롤
            });
        });

        $('#refundBtn').click(function() {
            // 상세 정보 섹션을 토글하여 보이거나 숨기도록 함
            $('#refundSection').slideToggle('fast');
        });


    });
</script>
</html>