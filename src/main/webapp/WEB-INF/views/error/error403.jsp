<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<style>

    *{
        margin: 0;
        padding: 0;
    }

    .container {
        display: flex;
        align-items: center;
        justify-content: center;
        height: 100%;
    }

    .error-container {
        text-align: center;
    }

    .logo {
        font-size: 80px;
        font-weight: bold;
    }

    button {
        margin: 10px;
        padding: 5px;
        font-size: 15px;
        width: 100px;
    }

</style>
</head>
<body>
<div class="container">
    <div class="error-container">
        <p class="logo">403 Error</p>
        <p>해당 페이지는 관리자만 접근 가능합니다.</p>
        <p>관리자에게 문의해주시기 바랍니다.</p>
        <a href="<c:url value='/'/>"><button>Home</button></a>
    </div>
</div>
</body>
</html>