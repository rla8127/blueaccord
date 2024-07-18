<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file = "../common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <meta charset="UTF-8">
    <title>상품 정보</title>
    <style>

        .container {
            padding: 20px 400px;
            min-height: 100%;
        }
        
        .container-header {
            padding-bottom: 20px;
            text-align: left;
        }

        .item-container {
            width: 100%;
            padding: 10px;
        }

        .star {
            color: red;
            font-size: 22px;
        }

        .item-info {
            background-color: #f8f8f8;
            padding: 10px;
            margin-bottom: 20px;
        }

        .input-header{
            display: inline-block;
            width: 15%;
            vertical-align: middle;
        }

        .input-container{
            margin: 10px 0;
        }

        .input-info, .input-container > input{
            width: 60%;
        }

        select, input{
            height: 30px;
        }

        textarea {
            width: 80%;
            background: #ffffff;
            margin: 5px 0px 10px 0px;
            border: 1px solid #7a7a7a;
            resize: none;
            padding: 8px;
            outline-color: #8d8d8d;
        }

        button, #submitBtn {
        background-color: rgb(236, 236, 236); /* Blue background */
        border: none; /* Remove borders */
        color: black; /* White text */
        padding: 6px 12px; /* Some padding */
        font-size: 16px; /* Set a font size */
        cursor: pointer; /* Mouse pointer on hover */
        border-radius: 5px;
        }

        button:hover {
        text-decoration: underline;
        }

    </style>
</head>
<body>
    <div class="container">
        
        <div class="container-header">
            <h2 class="header"> 상품 등록</h2>
            <p>블루어코드 상품 상세정보 조회 및 등록을 위한 관리자 페이지입니다.</p>
        </div>
        
        <div class="item-container">
            <form id="form" action="<c:url value='/admin/item/write'/>" method="post" enctype="multipart/form-data">
            <div class="item-info">
                <h4>상품유형<span class="star">*</span></h4>   
                <div class="input-container">
                    <p class="input-header">카테고리</p>
                    <select name="category" class="input-info" value="${itemDto.category}">
                        <option value="none" disabled selected>카테고리 선택</option>
                        <option value="CAP" ${itemDto.category =="CAP" ? "selected" : ""}>CAP</option>
                        <option value="HAT" ${itemDto.category =="HAT" ? "selected" : ""}>HAT</option>
                        <option value="BEANIE" ${itemDto.category =="BEANIE" ? "selected" : ""}>BEANIE</option>
                        <option value="BIGCAP" ${itemDto.category =="BIGCAP" ? "selected" : ""}>BIGCAP</option>
                        <option value="ETC" ${itemDto.category =="ETC" ? "selected" : ""}>ETC</option>
                    </select> 
                </div>
            </div>

            <div class="item-info">
                <h4>상품 기본 정보<span class="star">*</span></h4>

                <div class="input-container">
                    <p class="input-header">No</p> ${itemDto.item_id}
                    <c:if test="${mode ne 'new'}">
                        <input type="text" name="item_id" value="${itemDto.item_id}" hidden>
                    </c:if>
                </div>

                <div class="input-container">
                    <p class="input-header">상품명</p>
                    <input type="text" name="item_nm" value="${itemDto.item_nm}" placeholder="상품명을 입력해주세요." ${mode=="new" ? "" : "readonly='readonly'"}>
                </div>

                <div class="input-container">
                    <p class="input-header">가격</p>
                    <input type="text" name="price" value="${itemDto.price}" placeholder="가격을 입력해주세요." ${mode=="new" ? "" : "readonly='readonly'"}>
                </div>

                <div class="input-container">
                    <p class="input-header">재고수량</p>
                    <input type="text" name="stock" value="${itemDto.stock}" placeholder="재고 수량" ${mode=="new" ? "" : "readonly='readonly'"}>
                </div>

                <div class="input-container">
                    <p class="input-header">판매여부</p>
                    <select name="sell_status" class="input-info" value="${itemDto.sell_status}">
                        <option value="none" disabled selected>판매 여부(필수)</option>
                        <option value="SELL" ${itemDto.sell_status =="SELL" ? "selected" : ""}>판매중</option>
                        <option value="SOLD_OUT" ${itemDto.sell_status =="SOLD_OUT" ? "selected" : ""}>품절</option>
                        <option value="NOT_AVAILABLE" ${itemDto.sell_status =="NOT_AVAILABLE" ? "selected" : ""}>구매불가</option>
                    </select> 
                </div>
            </div>

            <div class="item-info">
                <h4>상품 이미지<span class="star">*</span></h4>   

                <div class="input-container">
                     <!-- 기존 이미지 파일 -->
                    <input type="file" name="itemImgFile" id="itemImgFile" multiple> <br>
                        <c:forEach var="itemImgDto" items="${itemImgDtoList}">
                        <!-- <img src="${imagePath}" alt="상품 이미지" class="thumbnail"> -->
                         <ul>
                            <li>
                                <span>${itemImgDto.oriImgName}</span>
                                <button type="button" class="delImgBtn" data-image-id="${itemImgDto.item_img_no}">삭제</button>
                            </li>
                        </ul>
                    </c:forEach>
                    <!-- 추가되는 이미지 파일  -->
                    <div id="preview"></div>
                </div>
            </div>

            <div class="item-info">
                <h4>상품 상세정보<span class="star">*</span></h4>   
                <textarea name="item_detail" rows="20" placeholder="내용을 입력해주세요." ${mode=="new" ? "" : "readonly='readonly'"}>${itemDto.item_detail}</textarea>
            </div>

                <button type="button" id="itemListBtn"><i class="fa fa-bars"></i> 목록</button>
                <c:if test="${mode eq 'new'}">
                    <input type="submit" id="submitBtn" value="작성"/>
                </c:if>
                <c:if test="${mode ne 'new'}">
                    <button type="button" id="modifyBtn" class="btn btn-modify"><i class="fa fa-edit"></i> 수정</button>
                    <button type="button" id="delBtn" class="btn btn-remove"><i class="fa fa-trash"></i> 삭제</button>
                </c:if>
                </ul>
            </div>
        </form>
    </div>
</div>

<script>
    $(document).ready(function(){

        let formCheck = function() {
        let form = document.getElementById("form");
        

        if(form.item_nm.value=="") {
            alert("제목을 입력해 주세요.");
            form.item_nm.focus();
            return false;
        }

        if(form.item_detail.value=="") {
            alert("내용을 입력해 주세요.");
            form.item_detail.focus();
            return false;
        }
    return true;
    }

    const fileInput = document.getElementById('itemImgFile');
    const preview = document.getElementById('preview');

    $('#itemImgFile').on('change', function() {
        // $('#preview').empty();  // 기존 미리보기 내용을 초기화

        const files = $(this)[0].files;
        if (files.length > 0) {
            const list = $('<ul></ul>');
            
            for (let i = 0; i < files.length; i++) {
                const listItem = $('<li></li>');
                const fileName = $('<span></span>').text(files[i].name);
                
                const deleteButton = $('<button></button>').text('삭제');
                deleteButton.on('click', function() {
                    $(this).closest('li').remove();
                });

                listItem.append(fileName);
                listItem.append(deleteButton);
                list.append(listItem);
            }

            $('#preview').append(list);
        }
    });

    // 클래스로 지정하면, 각 요소를 개별적으로 지정 가능
    $(document).on("click", '.delImgBtn', function() {

        let itemImgNo = $(this).data("image-id");
        let $clickedButton = $(this);

        console.log("Item Image No: " + itemImgNo);

        $.ajax({
                    type:'DELETE',       // 요청 메서드
                    url: '/admin/item/image/'+itemImgNo,  // 요청 URI
                    success : function(result){ 
                        alert("received="+result); 
                         // 부모 li 요소를 찾아서 삭제
                         $clickedButton.closest('li').remove();
                    },
                    error   : function(){ alert("error") } 
                }); // $.ajax()
        alert("the request is sent")
    });


        $("#modifyBtn").on("click", function(){
            let form = $("#form");
            let isReadonly = $("input[name=item_nm]").attr('readonly');
            let item_nm = $("input[name=item_nm]").val();
            let price = $("input[name=price]").val();
            let stock = $("input[name=stock]").val();
            let item_detail = $("textarea").html();
            let sell_status = $("input[name=sell_status]").val();

            // 수정버튼 클릭 시, readonly 해제,  읽기 -> 수정기능
            if(isReadonly=='readonly') {
                // $(".header").html("상품 수정");
                $("input[name=item_nm]").removeAttr('readonly');
                $("input[name=price]").removeAttr('readonly');
                $("input[name=stock]").removeAttr('readonly');
                $("textarea").removeAttr('readonly');
                $("input[name=sell_status]").removeAttr('disabled');
                $("#modifyBtn").html("<i class='fa fa-pencil'></i> 등록");
                return;
            }

            form.attr("action", "<c:url value='/admin/item/modify'/>?page=${page}&pageSize=${pageSize}");
            form.attr("method",  "post");

            form.submit();

        });


        $("#delBtn").on("click", function(){
            let form = $("#form");

            form.attr("action", "<c:url value='/admin/item/delete'/>?page=${page}&pageSize=${pageSize}");
            form.attr("method", "post");

            form.submit();
        });

        $("#itemListBtn").on("click", function(){
                location.href="<c:url value='/admin/item/list'/>";
        });
        
    });
    </script>
</body>
<%@ include file = "../common/footer.jsp" %>
</html>