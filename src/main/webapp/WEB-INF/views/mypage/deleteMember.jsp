<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ include file = "../common/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>BLUEACCORD</title>
</head>
<style>
    .container {
        height: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .delete-container {
        text-align: center;
    }

    table {
        border-collapse: collapse;
        margin: 10px 0;
        width: 100%;
    }

    th, td {
        border: 1px solid #a3a3a3;
        padding: 8px;
        text-align: left;
    }

    th {
        background-color: #e6e6e6;
    }

    input {
        font-size: 16px;
        width: 60%;
        height: 30px;
        padding-left: 5px;
    }

    #delBtn {
        width: 120px;
        height: 35px;
        border: 1px solid #e6e6e6;
    }

    #delBtn:hover{
        cursor: pointer;
    }

    .error {
        color: red;
    }

</style>
<body>
<div class="container">
    <div class="delete-container">
        <h3>회원탈퇴를 진행하시기 위해 비밀번호를 입력해주세요.</h3>
        <form action="<c:url value='/member/delete'/>" method="post" id="delForm">
            <table>
                <tr>
                    <th colspan="row">아이디</th>
                    <td>${member.id}</td>
                    <input type="hidden" value="${member.member_id}" name="member_id"/>
                </tr>
                <tr>
                    <th colspan="row">패스워드</th>
                    <td><input type="password" value="" name="rawPassword" id="pwdCheck"></td>
                    <span class="error">${errorMessage}</span> 
                </tr>
            </table>
            <button type="submit" id="delBtn">회원탈퇴</button>
        </form>
        
    </div>
</div>
</body>
<%@ include file = "../common/footer.jsp" %>
</html>