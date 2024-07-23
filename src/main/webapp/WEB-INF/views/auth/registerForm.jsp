<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ include file = "../common/header.jsp" %>
<%@ page import="java.net.URLDecoder"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="<c:url value='/js/address.js'/>"></script>
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
            border-bottom: 1px solid black;
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
        }

        .basic-table{
            width: 100%;
            border-collapse: collapse;
        }

        .basic-table tr{
            border-bottom: 1px solid rgb(161, 161, 161);
        }

        .basic-table th{
            text-align: left;
            padding-left: 20px;
            background-color: rgb(218, 218, 218);
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
        }

        #phone{
            padding: 0;
            width: 25%;
            height: 50px;
            font-size: 16px;
            text-align: center;
        }

        #postcode{
            width: 20%;
            background-color: azure;
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

        #registerBtn{
            background-color: black;
            color: white;
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
                <h2>회원가입</h2>
            </div>
            <div class="basic-info-container">
            <form:form action="/register/save" method="POST" onsubmit="return formCheck(this);" modelAttribute="memberDto">
                <div class="basic-header">
                    <h3>기본정보</h3>
                    <p><span class="star">*</span>필수입력사항</p>
                </div>
                <table class="basic-table">
                    <tr>
                        <th scope="row">아이디<span class="star">*</span></th>
                        <td>
                            <form:input path="id" type="text" placeholder="아이디" name="id" id="idInput" onblur="validateId()"/>
                            <span id="idError" class="error-message">아이디는 4자 이상, 12자 이하이어야 합니다.</span>
                        </td>                  
                    </tr>
                    <tr>
                        <th scope="row">비밀번호<span class="star">*</span></th>
                        <td>
                            <form:input path="password" type="password" minlength="6" id="pwdInput" placeholder="비밀번호" name="password" onblur="validatePwd()"/>
                            <span id="pwdError" class="error-message">비밀번호는 최소 6자 이상입니다.</span>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">비밀번호 확인<span class="star">*</span></th>
                        <td>
                            <input type="password" minlength="8" id="pwdCheck" placeholder="비밀번호 확인" onblur="validatePwdCheck()"/>
                            <span id="pwdCheckError" class="error-message">비밀번호가 일치하지 않습니다.</span>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">이름<span class="star">*</span></th>
                        <td>
                            <form:input path="name" type="text" placeholder="이름" name="name" id="name"/>
                            <span id="nameError" class="error-message">이름을 입력하세요.</span>
                        </td>
                    </tr>
                    <tr>
                        <th style="vertical-align: top;" scope="row">주소<span class="star">*</span></th>
                        <td>
                            <input type="text" id="postcode" name="postcode" placeholder="우편번호" readonly>
                            <button id="addressBtn" type="button" onclick="execDaumPostcode()" value="우편번호 찾기">주소검색</button>
                            <input type="text" class="address" id="address" placeholder="기본 주소"><br>
                            <input type="text" class="address" id="detailAddress" name="detailAddress" placeholder="나머지 주소"><br>
                            <input type="text" class="address" id="extraAddress" placeholder="참고항목">
                            <input type="hidden" id="member-address" name="address" value="">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">전화번호<span class="star">*</span></th>
                        <td>
                            <form:input path="phone" type="text" placeholder="전화번호" name="phone" id="phone" maxlength="11"/>
                            <form:errors path="phone"></form:errors>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">이메일<span class="star">*</span></th>
                        <td>
                            <form:input path="email" type="text" placeholder="이메일" name="email" id="email"/>
                            <form:errors path="email"></form:errors>
                        </td>
                    </tr>
                </table>
                <div class="button-container">
                    <a href="/"><button type="button" id="cancelBtn">취소</button></a>
                    <button type="submit" id="registerBtn">가입하기</button>
                </div>
            </form:form>
            </div>
        </div>
    </div>
<script>
    function validateId() {
        const idInput = document.getElementById('idInput').value;
        const idError = document.getElementById('idError');

        if (idInput.length >= 4 && idInput.length <= 12) {
            idError.style.display = 'none';
        } else {
            idError.style.display = 'block';
        }
    }

    function validatePwd() {
        const pwdInput = document.getElementById('pwdInput').value;
        const pwdError = document.getElementById('pwdError');
        if(pwdInput.length >= 6 && pwdInput.length <= 50) {
            pwdError.style.display = 'none';
        } else {
            pwdError.style.display = 'block';
        }
    }

    function validatePwdCheck() {
        const pwdInput = document.getElementById('pwdInput').value;
        const pwdCheck = document.getElementById('pwdCheck').value;
        const pwdCheckError = document.getElementById('pwdCheckError');
        if(pwdInput == pwdCheck) {
            pwdCheckError.style.display = 'none';
        } else {
            pwdCheckError.style.display = 'block';
        }
    }

    function formCheck(frm) {
        let isValid = true;
        
        // 이름 검사
        if (frm.name.value.trim() === '') {
            document.getElementById('nameError').style.display = 'block';
            isValid = false;
        } else {
            document.getElementById('nameError').style.display = 'none';
        }

        // 전화번호 검사
        if (phone === '') {
            document.getElementById('phoneError').style.display = 'block';
            isValid = false;
        } else {
            document.getElementById('phoneError').style.display = 'none';
        }

        // 아이디 검사
        const idInput = document.getElementById('idInput').value;
        const idError = document.getElementById('idError');
        if (idInput.length < 4 || idInput.length > 12) {
            idError.style.display = 'block';
            isValid = false;
        } else {
            idError.style.display = 'none';
        }

        // 비밀번호 검사
        const pwdInput = document.getElementById('pwdInput').value;
        const pwdError = document.getElementById('pwdError');
        if (pwdInput.length < 8 || pwdInput.length > 50) {
            pwdError.style.display = 'block';
            isValid = false;
        } else {
            pwdError.style.display = 'none';
        }

        // 비밀번호 확인 검사
        const pwdCheck = document.getElementById('pwdCheck').value;
        const pwdCheckError = document.getElementById('pwdCheckError');
        if (pwdInput !== pwdCheck) {
            pwdCheckError.style.display = 'block';
            isValid = false;
        } else {
            pwdCheckError.style.display = 'none';
        }

        return isValid;
    }

    document.getElementById('registerBtn').addEventListener('click', function() {

        var postcode = document.getElementById('postcode').value;
        var address = document.getElementById('address').value;
        var detailAddress = document.getElementById('detailAddress').value;
        var extraAddress = document.getElementById('extraAddress').value;
        var memberAddress = "(" + postcode + ") " + address + ' ' + detailAddress + extraAddress;

        document.getElementById('member-address').value = memberAddress;

        console.log("Member Address: " + memberAddress);
    });
</script>
</body>
<%@ include file = "../common/footer.jsp" %>
</html>
