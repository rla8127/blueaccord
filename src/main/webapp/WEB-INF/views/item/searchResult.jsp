<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ include file = "../common/header.jsp" %>
<%@ page session="false" %>
<html lang="en">
<head>
    <title>BLUEACCORD</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Archivo+Black&family=Noto+Serif:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
</head>
<style>
    .container {
    
    }

    .category-container {
        width: 1240px;
        margin: 0 auto;
    }

    .category-header {
        padding: 50px 0;
        text-align: left;
    }

    .category-header h2{
        font-size: 20px;
        font-weight: bold;
        font-style: normal;
    }
  
    .item-card {
        width: 100%;
        display: flex;
        justify-content: flex-start;
        flex-wrap: wrap;
    }

    .item {
        display: inline-block;
        padding: 5px;
    }

    img { 
        width: 300px;
        height: 300px;
    }

    .item:nth-child(-n+3) {
        margin-top: 0;
    }

    .item:nth-child(3n-2) {
        margin-left: 0;
    }

    .item p {
        font-size: 13px;
        letter-spacing: -1px;;
    }
    
    .item-info .item_name{
        font-size: 16px;
    }

    .item-info {
        padding: 10px 0;
    }

    .item_price{
        padding-top: 5px;
    }

    .review_count{
        font-size: 14px;
        font-weight: bold;
    }

    .sort-container{
        text-align: right;
        padding-bottom: 10px;
        font-size: 14px;
        color: #494949;
        border-bottom: 1px solid #e5e5e5;
    }
    
    input[type=radio]{
        display: none;
    }
    
    .sort_label{
        padding-right: 10px;
    }

    .sort_label:hover{
        cursor: pointer;
    }

    .paging {
      color: black;
      width: 100%;
      display: flex;
      justify-content: center;
    }

    .page {
      color: black;
      padding: 6px;
      margin-right: 10px;
    }
    .paging-active {
      background-color: rgb(216, 216, 216);
      border-radius: 5px;
      color: rgb(24, 24, 24);
    }

    .paging-container {
      width:100%;
      display: flex;
      margin : 50 auto;
      text-align: center;
    }

</style>

<body>
<div class="container">
    <div class="category-container">
        <div class="category-header">
            <h2>검색결과</h2>
            <p>총 ${totalCnt}개의 상품이 있습니다.</p>
        </div>
        <div class="sort-container">
            <form id="sort-form" action="<c:url value="/item/search"/>" class="sort-form" method="get">
                <div>
                    <input type="hidden" class="keyword" name="keyword" value="${sc.keyword}"/>
                    <label class="sort_label">
                        <input type="radio" name="sort_option" value="N" ${sc.sort_option == 'N' ? 'checked' : ''}/>
                        최신순
                    </label>
                    <label class="sort_label">
                        <input type="radio" name="sort_option" value="R" ${sc.sort_option == 'R' ? 'checked' : ''}/>
                        리뷰순
                    </label>
                    <label class="sort_label">
                        <input type="radio" name="sort_option" value="PL" ${sc.sort_option == 'PL' ? 'checked' : ''}/>
                        가격 낮은순
                    </label>
                    <label class="sort_label">
                        <input type="radio" name="sort_option" value="PH" ${sc.sort_option == 'PH' ? 'checked' : ''}/>
                        가격 높은순
                    </label>
                    <i class="fas fa-sort"></i>
                </div>
            </form>
        </div>
        <div class="item-container">
            <ul class="item-card">
                <c:forEach var="categoryItem" items="${categoryItems}">
                    <li class="item">
                        <a href="<c:url value='/item?item_id=${categoryItem.item_id}'/>">
                            <img src="${pageContext.request.contextPath}${categoryItem.repImgUrl}" alt="BlueAccord"/></img>
                        </a>
                        <div class="item-info">
                            <span class="item_name"><strong>${categoryItem.item_nm}</strong></span>
                            <div class="item_detail"></div>
                            <div class="item_price"><fmt:formatNumber value="${categoryItem.price}" type="number" pattern="#,##0"/>원</div>
                            <div class="review_count">REVIEW ${categoryItem.review_count}</div>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
    <div class="paging-container">
        <div class="paging">
          <c:if test="${totalCnt==null || totalCnt==0}">
            <div></div>
          </c:if>
          <c:if test="${totalCnt!=null && totalCnt!=0}">
            <c:if test="${ph.showPrev}">
              <a class="page" href="<c:url value="/item/search/${ph.sc.getQueryString(ph.beginPage-1)}"/>">&lt;</a>
            </c:if>
            <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
              <a class="page ${i==ph.sc.page? "paging-active" : ""}" href="<c:url value="/item/search/${ph.sc.getQueryString(i)}"/>">${i}</a>
            </c:forEach>
            <c:if test="${ph.showNext}">
              <a class="page" href="<c:url value="/item/search/${ph.sc.getQueryString(ph.endPage+1)}"/>">&gt;</a>
            </c:if>
          </c:if>
        </div>
      </div>
</div>
<%@ include file = "../common/footer.jsp" %>
<script>
    $('.sort_label').click(function(){
        var radio = $(this).find('input[type="radio"]');
        radio.prop('checked', true);
        $('#sort-form').submit();
    });

    $('#sort-form').submit(function(event){
        var selectedOption = $('input[type="radio"]:checked').val();
        $('#sortOption').val(selectedOption);
    });
</script>
</body>
</html>