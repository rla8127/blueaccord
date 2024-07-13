<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ include file = "../common/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>상품 목록</title>
</head>
<style>
    .board-container {
      width: 60%;
      height: 1200px;
      margin: 0 auto;
      padding-bottom: 300px;
      /* border: 1px solid black; */
    }
    
    .container {
        padding: 20px 200px;
        min-height: 100%;
    }

    .container-header {
        padding-bottom: 20px;
        text-align: left;
    }

    .container-header h2{
      padding-bottom: 5px;
    }

    .table-container {
        text-align: center;
    }

    .admin-search-container {
      background-color: rgb(253, 253, 250);
      width: 100%;
      height: 110px;
      border: 1px solid #ddd;
      margin-top : 10px;
      margin-bottom: 30px;
      display: flex;
      justify-content: center;
      align-items: center;
    }
    .search-form {
      height: 37px;
      display: flex;
    }
    .search-option {
      width: 100px;
      height: 100%;
      outline: none;
      margin-right: 5px;
      border: 1px solid #ccc;
      color: gray;
    }

    .search-option > option {
      text-align: center;
    }

    .search-input {
      color: gray;
      background-color: white;
      border: 1px solid #ccc;
      height: 100%;
      width: 300px;
      font-size: 15px;
      padding: 5px 7px;
    }
    .search-input::placeholder {
      color: gray;
    }

    .search-button {
      /* 메뉴바의 검색 버튼 아이콘  */
      width: 20%;
      height: 100%;
      background-color: rgb(22, 22, 22);
      color: rgb(209, 209, 209);
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 15px;
    }
    .search-button:hover {
      color: rgb(165, 165, 165);
    }

    .btn-write {
      background-color: rgb(236, 236, 236); /* Blue background */
      border: none; /* Remove borders */
      color: black; /* White text */
      padding: 6px 12px; /* Some padding */
      font-size: 16px; /* Set a font size */
      cursor: pointer; /* Mouse pointer on hover */
      border-radius: 5px;
      margin-left: 30px;
    }

    .btn-write:hover {
      text-decoration: underline;
    }

    table {
        margin: auto;
        width: 100%;
        border-top: 3px solid black;
        border-collapse: collapse;
    }

    th {
        font-size: 20px;
        border-bottom: 1px solid black;
        background-color: rgba(255, 255, 255, 0.767);
        padding: 5px;
    }

    td {
        font-size: 16px;
        padding: 8px;
        border-bottom: 1px  solid rgba(160, 160, 160, 0.3);
    }

    .paging {
      color: black;
      width: 100%;
      align-items: center;
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
      text-align: center;
      width:100%;
      height: 70px;
      display: flex;
      margin-top: 50px;
    }

    img {
        width: 100px;
        height: 120px;
    }

</style>
<body>
    <div class="container">
        <div class="container-header">
          <h2>관리자 페이지</h2>  
          <h4>상품 > 상품 목록</h4>
        </div>
        <div class="admin-search-container">
            <form action="<c:url value="/admin/item/list"/>" class="search-form" method="get">
              <select class="search-option" name="option">
                <option value="A" ${ph.sc.option=='A' || ph.sc.option=='' ? "selected" : ""}>제목+내용</option>
                <option value="T" ${ph.sc.option=='T' ? "selected" : ""}>제목만</option>
                <option value="W" ${ph.sc.option=='W' ? "selected" : ""}>작성자</option>
              </select>
      
              <input type="text" name="keyword" class="search-input" value="${ph.sc.keyword}" placeholder="검색어를 입력해주세요">
              <input type="submit" class="search-button" value="검색">
            </form>
            <button id="writeBtn" class="btn-write" onclick="location.href='<c:url value="/admin/item/write"/>'"><i class="fa fa-pencil"></i> 글쓰기</button>
        </div>
        <div class="table-container">
            <table>
                    <th>No</th>
                    <th>상품명</th>
                    <th>재고수량</th>
                    <th>카테고리</th>
                    <th>판매상태</th>
                    <th>등록일</th>
                    <th>수정일</th>
            <c:forEach var="itemDto" items="${list}">
                <tr>
                    <td>${itemDto.ino}</td>
                    <td><a href="<c:url value="/admin/item/read${ph.sc.queryString}&ino=${itemDto.ino}"/>">${itemDto.item_nm}</a></td>
                    <td>${itemDto.stock}</td>
                    <td>${itemDto.category}</td>
                    <td>${itemDto.sell_status}</td>
                    <td><fmt:formatDate value="${itemDto.reg_date}" pattern="yyyy-MM-dd" type="date"/></td>
                    <td><fmt:formatDate value="${itemDto.up_date}" pattern="yyyy-MM-dd" type="date"/></td>
                </tr>
            </c:forEach>
            </table>
        </div>
        <div class="paging-container">
            <div class="paging">
              <c:if test="${totalCnt==null || totalCnt==0}">
                <div> 게시물이 없습니다. </div>
              </c:if>
              <c:if test="${totalCnt!=null && totalCnt!=0}">
                <c:if test="${ph.showPrev}">
                  <a class="page" href="<c:url value="/admin/item/list${ph.sc.getQueryString(ph.beginPage-1)}"/>">&lt;</a>
                </c:if>
                <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                  <a class="page ${i==ph.sc.page? "paging-active" : ""}" href="<c:url value="/admin/item/list${ph.sc.getQueryString(i)}"/>">${i}</a>
                </c:forEach>
                <c:if test="${ph.showNext}">
                  <a class="page" href="<c:url value="/admin/item/list${ph.sc.getQueryString(ph.endPage+1)}"/>">&gt;</a>
                </c:if>
              </c:if>
            </div>
        </div>
    </div>
    <script>
        $("#wrtBtn").on("click", function(){
            location.href="<c:url value='/item/write'/>";
        });
    </script>
</body>
<%@ include file = "../common/footer.jsp" %>
</html>