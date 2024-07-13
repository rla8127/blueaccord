<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ include file = "../common/header.jsp" %>
<%@ page import="java.net.URLDecoder"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <style>
        .register-container{
            width: 780px;
            margin: 0 auto;
            margin-bottom: 100px;
        }

        .register-header-container{
            text-align: center;
            margin: 100px 0;
            font-weight: bold;
            font-size: 20px;
        }

        .register-header-container ul li{
            list-style: none;
            display: inline-block;
            padding-right: 20px;
            padding-top: 30px;
            font-size: 16px;
        }

        .basic-header{
            width: 100%;
            height: 50px;
            border-bottom: 3px solid black;
        }

        .basic-header h3{
            float: left;
        }

        .basic-header p{
            float: right;
            text-align: right;
        }

        .star{
            color: red;
            font-size: 16px;
            padding: 0 3px;
        }

        .basic-table{
            width: 100%;
            border-collapse: collapse;
        }

        .basic-table tr{
            border-bottom: 1px solid #e5e5e5;
        }

        .basic-table th{
            text-align: left;
            padding-left: 20px;
            background-color: #f6f6f6;
        }

        .basic-table td{
            padding: 15px 0;
            padding-left: 20px;
        }

        .basic-table input{
            width: 80%;
            height: 50px;
            padding-left: 15px;
            font-size: 16px;
            border: 1px solid #e0e0e0;
        }

        .basic-table .phone{
            width: 15%;
            height: 50px;
            font-size: 16px;
            text-align: center;
            padding: 0;
            border: 1px solid #e0e0e0;
        }

        #postcode{
            width: 20%;
        }

        #addressBtn{
            width: 15%;
            background-color: white;
            height: 50px;
        }
        
        .address{
            margin-top: 5px;
        }

        .button-container{
            text-align: center;
        }

        .button-container button{
            margin: 50px 0;
            width: 40%;
            height: 70px;
            font-size: 20px;
            font-weight: 900;
        }

        .button-container button:hover, #addressBtn:hover{
            cursor: pointer;
        }

        #cancelBtn{
            background-color: white;
        }

        #modifyBtn{
            background-color: black;
            color: white;
        }

        input[readonly] {
            background: #f9f9f9;
        }

        .error-message {
            color: red;
            display: none;
        }

    </style>
</head>
<body>
    <div class="container">
        <div class="register-container">
            <div class="register-header-container">
                <h2>회원 정보 수정</h2>
            </div>
            <div class="basic-info-container">
            <form action="<c:url value="/member/modify"/>" method="POST" onsubmit="return formCheck(this);">
                <div class="basic-header">
                    <h3>기본정보</h3>
                    <p><span class="star">*</span>필수입력사항</p>
                </div>
                <table class="basic-table">
                    <tr>
                        <th scope="row">아이디<span class="star">*</span></th>
                        <td><input type="text" value="${member.id}" name="id" readonly></td>
                    </tr>
                    <tr>
                        <th scope="row">비밀번호<span class="star">*</span></th>
                        <td><input type="password" value="password" name="password"></td>
                    </tr>
                    <tr>
                        <th scope="row">이름<span class="star">*</span></th>
                        <td><input type="text" value="${member.name}" name="name" readonly></td>
                    </tr>
                    <tr>
                        <th style="vertical-align: top;" scope="row">주소<span class="star">*</span></th>
                        <td>
                            <input type="text" id="postcode" name="postcode" placeholder="우편번호" readonly>
                            <button id="addressBtn" type="button" onclick="execDaumPostcode()" value="우편번호 찾기">주소검색</button>
                            <input type="text" class="address" id="address" placeholder="기본 주소" readonly><br>
                            <input type="text" class="address" id="detailAddress" name="detailAddress" placeholder="나머지 주소"><br>
                            <input type="text" class="address" id="extraAddress" placeholder="참고항목">
                            <input type="hidden" id="member-address" name="address" value="">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">휴대전화<span class="star">*</span></th>
                        <td>
                            <input type="text" name="phone" id="phone" value="${member.phone}">
                            <span id="phoneError" class="error-message">번호를 다음과 같은 형식으로 기입해주세요. (ex: 01012345678)</span>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">이메일<span class="star">*</span></th>
                        <td><input type="text" value="${member.email}" name="email"></td>
                    </tr>
                </table>
                <div class="button-container">
                    <a href="/mypage"><button type="button" id="cancelBtn">취소</button></a>
                    <button id="modifyBtn">수정하기</button>
                </div>
            </form>
            </div>
        </div>
    </div>
<script>

    function formCheck(frm) {
        let isValid = true;

        // 전화번호 검사
        const phone = document.getElementById('phone').value;
        const phoneError = document.getElementById('phoneError');
        if (phone.length !== 11) {
            phoneError.style.display = 'block';
            isValid = false;
        } else {
            phoneError.style.display = 'none';
        }

        return isValid;
    }


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

    function setMessage(msg, element){
        document.getElementById("msg").innerHTML = `<i class="fa fa-exclamation-circle"> ${'${msg}'}</i>`;

        if(element) {
            element.select();
        }

    }

    // 가입하기 버튼 클릭 시
    $('#modifyBtn').click(function(){

        var postcode = document.getElementById('postcode').value;
        var address = document.getElementById('address').value;
        var detailAddress = document.getElementById('detailAddress').value;
        var extraAddress = document.getElementById('extraAddress').value;
        var memberAddress = "("+ postcode + ") " + address + ' ' + detailAddress + extraAddress;

        document.getElementById('member-address').value = memberAddress;

    // Log values to the console for debugging
    console.log("Member Address: " + memberAddress);
    });
});
</script>
</body>
<%@ include file = "../common/footer.jsp" %>
</html>