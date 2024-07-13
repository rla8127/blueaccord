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
	<title>패스워드 찾기</title>
</head>
<style>
	.login-container{
		width: 420px;
		margin: 0 auto;
		padding: 100px 0;
		text-align: center;
	}

	.login-header-container{
		padding-bottom: 30px;
		font-size: 20px;
		font-weight: 900;
	}

	.login-input input{
		width: 100%;
		height: 50px;
		padding: 10px;
		margin-bottom: 10px;
		border: 1px solid gray;
	}

	.save-id{
		text-align: right;
		padding-bottom: 10px;
	}

	#loginBtn{
		width: 100%;
		height: 50px;
		font-weight: 600;
		font-size: 18px;
		color: white;
		background-color: black;
		margin-bottom: 20px;
	}	

	#loginBtn:hover{
		cursor: pointer;
	}

	.find-container{
		margin-bottom: 20px;
	}

	.register-container{
		width: 100%;
		height: 200px;
		border: 1px solid black;
		padding: 20px;
	}

	.register-container p{
		color: gray;
	}

	#registerBtn{
		margin-top: 20px;
		font-size: 16px;
		font-weight: 900;
		padding: 5px;
		width: 35%;
		height: 50px;
		background-color: white;	
	}

	#registerBtn:hover{
		cursor: pointer;
	}

</style>
<body>
<div class="container">
	<div class="login-container">
		<div class="login-header-container">
			<h5>비밀번호를 찾고자하는 아이디를 입력해주세요.</h5>
		</div>
		<div class="login-form">
			<form action="/find/password" id="findForm" method="post" onsubmit="return formCheck(this);">
				<div class="login-input">
					<input type="text" placeholder="이름" name="name"><br>
					<input type="text" value="${cookie.id.value}" placeholder="아이디" name="id"><br>
					<input type="email" placeholder="이메일" name="email">
					<input type="hidden" name="toURL" value="${param.toURL}">
				</div>
				<button type="submit" id="loginBtn" autofocus>비밀번호 재설정</button>
				<div id="msg">
					<c:if test="${not empty param.msg}">
						<i class="fa fa-exclamation-circle">${param.msg}</i>
					</c:if>
				</div>
				<div class="find-container">
					<a href="/login">로그인</a>
					<span style="font-size: 14px; padding: 0 10px;">|</span> 
					<a href="/find/id">아이디 찾기</a>
				</div>
			</form>
		</div>
	</div>
</div>
	<script>
		function formCheck(findForm) {
			let msg ='';
			if(findForm.name.value.length==0) {
				setMessage('이름을 입력해주세요.', findForm.name);
				return false;
			}
			if(findForm.id.value.length==0) {
				setMessage('아이디(이메일)를 입력해주세요.', findForm.id);
				return false;
			}
			if(findForm.password.value.length==0) {
				setMessage('패스워드를 입력해주세요.', findForm.password);
				return false;
			}
			return true;
		}
		function setMessage(msg, element){
			document.getElementById("msg").innerHTML = ` ${'${msg}'}`;
			if(element) {
				element.select();
			}
		}
	</script>
</form>
</body>
<%@ include file = "../common/footer.jsp" %>
</html>