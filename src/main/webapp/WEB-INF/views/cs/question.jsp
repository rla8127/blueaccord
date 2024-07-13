<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file = "../common/header.jsp" %>
<c:set var="memberId" value="${sessionScope.memberId}"/>
<c:set var="role" value="${sessionScope.role}"/>
  <style>
    .container {
      display: flex;
      justify-content: center;
      min-height: calc(100vh - 300px);
      margin : auto;
    }

     .question-container {
      width : 50%;
     }

     .question-table{
      width: 100%;
      border-top: 1px solid black;
      border-collapse: collapse;
      margin: 20px 0;
     }

     .question-table tr{
      border-bottom: 1px solid #e5e5e5;
     }

     .question-table th{
      background-color: #f6f6f6;
      width: 15%;
     }

     .question-table td{
      text-align: left;
      padding: 10px;
     }

    .writing-header {
      text-align: center;
      font-weight: 900;
      font-size: 22px;
      margin: 30px 0;
      padding: 20px 0;
    }

    input {
      width: 90%;
      height: 35px;
      margin: 5px 0px 10px 0px;
      border: 1px solid #e9e8e8;
      padding: 8px;
      outline-color: #e6e6e6;
    }

    textarea {
      width: 90%;
      margin: 5px 0px 10px 0px;
      border: 1px solid #e9e8e8;
      resize: none;
      padding: 8px;
      outline-color: #e6e6e6;
    }

    .question-frm {
      width:100%;
      margin-bottom: 80px;
    }
    .btn {
      background-color: rgb(236, 236, 236); /* Blue background */
      border: none; /* delete borders */
      color: black; /* White text */
      padding: 6px 12px; /* Some padding */
      font-size: 16px; /* Set a font size */
      cursor: pointer; /* Mouse pointer on hover */
      border-radius: 5px;
    }

    .btn:hover {
      text-decoration: underline;
    }

    .button-container{
      padding: 50px 0;
      text-align: center;
    }

    .button-container button{
      width: 180px;
      height: 40px;
    }


  </style>
</head>
<body>
<script>
  let msg = "${msg}";
  if(msg=="WRT_ERR") alert("게시물 등록에 실패하였습니다. 다시 시도해 주세요.");
  if(msg=="MOD_ERR") alert("게시물 수정에 실패하였습니다. 다시 시도해 주세요.");
</script>
<div class="container">
  <div class="question-container">
  <div class="writing-header">
    <h2>고객센터</h2>
  </div>
  <form id="form" class="question-frm" action="" method="post">

    <input type="hidden" name="question_id" value="${questionDto.question_id}">
    <h4>고객문의</h4>
    <table class="question-table">
      <tr>
        <th>작성자</th>
        <td>
          ${questionDto.name}
          <input type="hidden" value="${memberId}" name="member_id"/>
        </td>
      </tr>
      <tr>
        <th>제목</th>
        <td><input name="title" type="text" value="${questionDto.title}" placeholder="  제목을 입력해 주세요." ${mode=="new" ? "" : "readonly='readonly'"}><br></td>
      </tr>
      <tr>
        <th>내용</th>
        <td><textarea name="content" id="question-content" rows="20" placeholder=" 내용을 입력해 주세요." ${mode=="new" ? "" : "readonly='readonly'"}>${questionDto.content}</textarea><br></td>
      </tr>
    </table>
    <c:if test="${mode eq 'new'}">
      <button type="button" id="writeBtn" class="btn btn-question-write"><i class="fa fa-pencil"></i> 등록</button>
    </c:if>
    <c:if test="${memberId eq questionDto.member_id}">
      <button type="button" id="modifyBtn" class="btn btn-question-modify"><i class="fa fa-edit"></i> 수정</button>
      <button type="button" id="deleteBtn" class="btn btn-question-delete"><i class="fa fa-trash"></i> 삭제</button>
    </c:if>
  </form>

  <form id="answer-form" class="answer-frm" action="" method="post">
    <c:if test="${questionDto.answer_yn == 'y'}">
      <input type="hidden" name="answer_id" value="${answerDto.answer_id}">
    </c:if>
    <input type="hidden" name="question_id" value="${questionDto.question_id}">
    <h4>답변</h4>
    <table class="question-table">
      <tr>
        <th>작성자</th>
        <td>
          관리자
          <input type="hidden" value="${memberId}" name="member_id"/>
        </td>
      </tr>
      <tr>
        <th>내용</th>
        <td>
          <textarea name="content" id="answer-content" rows="20" placeholder="" ${questionDto.answer_yn == 'n' ? "" : "readonly='readonly'"}>${answerDto.content}</textarea>
          <br>
        </td>
      </tr>
    </table>
    <c:if test="${role eq 'ADMIN' && questionDto.answer_yn == 'n'}">
      <button type="button" id="writeAnswerBtn" class="btn btn-write"><i class="fa fa-pencil"></i> 등록</button>
    </c:if>
    <c:if test="${role eq 'ADMIN' && questionDto.answer_yn == 'y'}">
      <button type="button" id="modifyAnswerBtn" class="btn btn-modify"><i class="fa fa-edit"></i> 수정</button>
      <button type="button" id="deleteAnswerBtn" class="btn btn-delete"><i class="fa fa-trash"></i> 삭제</button>
    </c:if>
  </form>
  <div class="button-container">
    <button type="button" id="listBtn" class="btn btn-list">목록</button>
  </div>
  </div>
  <%@ include file = "../common/footer.jsp" %>
</div>
<script>
  $(document).ready(function(){
    let formCheck = function() {
      let form = document.getElementById("form");
      if(form.title.value=="") {
        alert("제목을 입력해 주세요.");
        form.title.focus();
        return false;
      }

      if(form.content.value=="") {
        alert("내용을 입력해 주세요.");
        form.content.focus();
        return false;
      }
      return true;
    }

    $("#writeNewBtn").on("click", function(){
      location.href="<c:url value='/cs/question/write'/>";
    });

    $("#writeBtn").on("click", function(){
      let form = $("#form");
      form.attr("action", "<c:url value='/cs/question/write'/>");
      form.attr("method", "post");

      if(formCheck())
        form.submit();
    });

    $("#modifyBtn").on("click", function(){
      let form = $("#form");
      let isReadonly = $("input[name=title]").attr('readonly');

      // 1. 읽기 상태이면, 수정 상태로 변경
      if(isReadonly=='readonly') {
        $("input[name=title]").attr('readonly', false);
        $("#question-content").attr('readonly', false);
        $("#modifyBtn").html("<i class='fa fa-pencil'></i> 등록");
        return;
      }

      // 2. 수정 상태이면, 수정된 내용을 서버로 전송
      form.attr("action", "<c:url value='/cs/question/modify${searchCondition.queryString}'/>");
      form.attr("method", "post");
      if(formCheck())
        form.submit();
    });

    $("#deleteBtn").on("click", function(){
      if(!confirm("정말로 삭제하시겠습니까?")) return;

      let form = $("#form");
      form.attr("action", "<c:url value='/cs/question/delete${searchCondition.queryString}'/>");
      form.attr("method", "post");
      form.submit();
    });

    $("#listBtn").on("click", function(){
      location.href="<c:url value='/cs/question/list${searchCondition.queryString}'/>";
    });

    //------------------------ 관리자 답변 관련 스크립트 --------------------------------
    $("#writeAnswerBtn").on("click", function(){
      let answerForm = $("#answer-form");
      answerForm.attr("action", "<c:url value='/cs/answer/write'/>");
      answerForm.attr("method", "post");

      if(formCheck())
        answerForm.submit();
    });

    $("#modifyAnswerBtn").on("click", function(){
      let form = $("#answer-form");
      let isReadonly = $("#answer-content").attr('readonly');

      // 1. 읽기 상태이면, 수정 상태로 변경
      if(isReadonly=='readonly') {
        $("#answer-content").attr('readonly', false);
        $("#modifyAnswerBtn").html("<i class='fa fa-pencil'></i> 등록");
        return;
      }

      // 2. 수정 상태이면, 수정된 내용을 서버로 전송
      form.attr("action", "<c:url value='/cs/answer/modify${searchCondition.queryString}'/>");
      form.attr("method", "post");
      if(formCheck())
        form.submit();
    });

    $("#deleteAnswerBtn").on("click", function(){
      let answerForm = $("#answer-form");
      answerForm.attr("action", "<c:url value='/cs/answer/delete'/>");
      answerForm.attr("method", "post");

      if(formCheck())
        answerForm.submit();
    });

  });
</script>
</body>
</html>