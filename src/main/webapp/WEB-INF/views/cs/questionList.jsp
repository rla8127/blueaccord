<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ include file = "../common/header.jsp" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
  <style>
    a {
      text-decoration: none;
      color: black;
    }

    button,
    input {
      border: none;
      outline: none;
    }

    .container {
			min-height: 100%;
		}

    .question-container {
      width: 60%;
      margin: 0 auto;
      /* border: 1px solid black; */
    }

    .question-header{
      font-weight: 900;
      font-size: 22px;
      margin: 30px 0;
      padding: 20px 0;
    }
    
    .question-search-container {
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

    table {
      border-collapse: collapse;
      width: 100%;
      border-top: 2px solid rgb(39, 39, 39);
    }

    tr:nth-child(even) {
      background-color: #f0f0f070;
    }

    th,
    td {
      width:300px;
      text-align: center;
      padding: 10px 12px;
      border-bottom: 1px solid #ddd;
    }

    td {
      color: rgb(53, 53, 53);
    }

    .no      { width:150px;}
    .title   { width:50%;  }

    td.title   { text-align: left;  }
    td.name  { text-align: center;  }
    td.viewcnt { text-align: right; }

    td.title:hover {
      text-decoration: underline;
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
      width:100%;
      height: 70px;
      display: flex;
      margin-top: 50px;
      margin : auto;
    }

    .btn-write {
      background-color: rgb(236, 236, 236); 
      border: none; 
      color: black; 
      padding: 6px 12px; 
      font-size: 16px; 
      cursor: pointer; 
      border-radius: 5px;
      margin-left: 30px;
    }

    .btn-write:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>
<script>
  let msg = "${msg}";
  if(msg=="LIST_ERR")  alert("게시물 목록을 가져오는데 실패했습니다. 다시 시도해 주세요.");
  if(msg=="READ_ERR")  alert("삭제되었거나 없는 게시물입니다.");
  if(msg=="DEL_ERR")   alert("삭제되었거나 없는 게시물입니다.");

  if(msg=="DEL_OK")    alert("성공적으로 삭제되었습니다.");
  if(msg=="WRT_OK")    alert("성공적으로 등록되었습니다.");
  if(msg=="MOD_OK")    alert("성공적으로 수정되었습니다.");
</script>

<div class="container">
  <div class="question-container" style="text-align:center">
    <div class="question-header">
      <h2>고객센터</h2>
    </div>
    <div class="question-search-container">
      <form action="<c:url value="/cs/question/list"/>" class="search-form" method="get">
        <select class="search-option" name="option">
          <option value="A" ${ph.sc.option=='A' || ph.sc.option=='' ? "selected" : ""}>제목+내용</option>
          <option value="T" ${ph.sc.option=='T' ? "selected" : ""}>제목만</option>
          <option value="W" ${ph.sc.option=='W' ? "selected" : ""}>작성자</option>
        </select>

        <input type="text" name="keyword" class="search-input" value="${ph.sc.keyword}" placeholder="검색어를 입력해주세요">
        <input type="submit" class="search-button" value="검색">
      </form>
      <button id="writeBtn" class="btn-write" onclick="location.href='<c:url value="/cs/question/write"/>'"><i class="fa fa-pencil"></i> 글쓰기</button>
    </div>

    <table>
      <tr>
        <th class="title">질문</th>
        <th class="answer">답변</th>
        <th class="name">작성자</th>
        <th class="regdate">등록일</th>
        <th class="viewcnt">조회수</th>
      </tr>
      <c:forEach var="questionDto" items="${list}">
        <tr>
          <td class="title">
            <a href="<c:url value="/cs/question/read${ph.sc.queryString}&question_id=${questionDto.question_id}"/>">${questionDto.title}</a>
          </td>
          <td class="answer">
            <c:if test="${questionDto.answer_yn eq 'y'}">
              완료
            </c:if>
            <c:if test="${questionDto.answer_yn eq 'n'}">
              미완료
            </c:if>
          </td>
          <td class="name">${questionDto.name}</td>
          <c:choose>
            <c:when test="${questionDto.reg_date.time >= startOfToday}">
              <td class="regdate"><fmt:formatDate value="${questionDto.reg_date}" pattern="HH:mm" type="time"/></td>
            </c:when>
            <c:otherwise>
              <td class="regdate"><fmt:formatDate value="${questionDto.reg_date}" pattern="yyyy-MM-dd" type="date"/></td>
            </c:otherwise>
          </c:choose>
          <td class="viewcnt">${questionDto.view_cnt}</td>
        </tr>
      </c:forEach>
    </table>
    <br>
    <div class="paging-container">
      <div class="paging">
        <c:if test="${totalCnt==null || totalCnt==0}">
          <div> 게시물이 없습니다. </div>
        </c:if>
        <c:if test="${totalCnt!=null && totalCnt!=0}">
          <c:if test="${ph.showPrev}">
            <a class="page" href="<c:url value="/cs/question/list${ph.sc.getQueryString(ph.beginPage-1)}"/>">&lt;</a>
          </c:if>
          <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
            <a class="page ${i==ph.sc.page? "paging-active" : ""}" href="<c:url value="/cs/question/list${ph.sc.getQueryString(i)}"/>">${i}</a>
          </c:forEach>
          <c:if test="${ph.showNext}">
            <a class="page" href="<c:url value="/cs/question/list${ph.sc.getQueryString(ph.endPage+1)}"/>">&gt;</a>
          </c:if>
        </c:if>
      </div>
    </div>
  </div>
  <%@ include file = "../common/footer.jsp" %>
</div>
</body>
</html>