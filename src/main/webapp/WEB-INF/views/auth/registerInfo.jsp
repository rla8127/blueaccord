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
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <style>
        .register-container{
            width: 960px;
            margin: 0 auto;
            margin-bottom: 100px;
        }

    </style>
</head>
<body>
    <div class="container">
        <div class="register-container">
        </div>
    </div>
<script>

</script>
</body>
<%@ include file = "../common/footer.jsp" %>
</html>