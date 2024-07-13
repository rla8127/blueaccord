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

</style>
<body>
<div class="container">
    <div class="delete-container">
        <h3>회원탈퇴되었습니다.</h3>
        <h3>그 동안 BLUEACCORD를 이용해주셔서 감사합니다.</h3>
        </form> 
    </div>
</div>
</body>
<%@ include file = "../common/footer.jsp" %>
</html>