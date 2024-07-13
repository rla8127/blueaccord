<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file = "../common/header.jsp" %>
<c:set var="loginId" value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? 'Login' : 'ID='+=loginId}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>아이디 찾기</title>
</head>
<style>
	.result-container{
		width: 420px;
		margin: 0 auto;
		padding: 100px 0;
		text-align: center;
	}

	.result-header-container{
		padding-bottom: 30px;
		font-size: 20px;
		font-weight: 900;
	}

	.result-header-container h2{
		padding-bottom: 20px;
	}

</style>
<body>
<div class="container">
	<div class="result-container">
		<div class="result-header-container">
			<h2>아이디 검색 결과</h2>
			<c:if test="${id eq null}">
				<p>${name}님의 아이디가 존재하지 않습니다.</p>
			</c:if>
			<c:if test="${id ne null}">
				<p>${name}님의 아이디는 ${id}입니다.</p>
			</c:if>
			${tempPwd}
		</div>
		<div class="find-container">
			<a href="/login">로그인</a>
			<span style="font-size: 14px; padding: 0 10px;">|</span> 
			<a href="/find/password">비밀번호 찾기</a>
		</div>
	</div>
</div>
</body>
<%@ include file = "../common/footer.jsp" %>
</html>