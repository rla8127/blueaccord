<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file = "../common/header.jsp" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Login</title>
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
			<h2>로그인</h2>
		</div>
		<div class="login-form">
			<form action="<c:url value='/login'/>" id="loginForm" method="post" onsubmit="return formCheck(this);">
				<div class="login-input">
					<input type="text" value="${cookie.id.value}" placeholder="아이디" name="id"><br>
					<input type="password" placeholder="비밀번호" name="password">
					<input type="hidden" name="toURL" value="${param.toURL}">
				</div>
				<div class="save-id">
					<label><input type="checkbox" name="rememberId" value="on" ${empty cookie.id.value ? "" : "checked"}> 아이디 저장</label>
				</div>
				<button type="submit" id="loginBtn" autofocus>로그인</button>
				<div id="msg">
					<c:if test="${not empty param.msg}">
						<i class="fa fa-exclamation-circle">${param.msg}</i>
					</c:if>
				</div>
				<div class="find-container">
					<a href="/find/id">아이디 찾기</a>
					<span style="font-size: 14px; padding: 0 10px;">|</span> 
					<a href="/find/password">비밀번호 찾기</a>
				</div>
			</form>
			<div class="register-container">
				<h3>아직 회원이 아니신가요?</h3><br>
				<p>지금 회원가입을 하시면<br>다양하고 특별한 혜택이 준비되어 있습니다.</p>
				<a href="<c:url value='/register/add'/>"><button id="registerBtn">회원가입</button></a>
			</div>
		</div>
	</div>
</div>
	<script>
		function formCheck(loginForm) {
			let msg ='';
			if(loginForm.id.value.length==0) {
				setMessage('아이디(이메일)를 입력해주세요.', loginForm.id);
				return false;
			}
			if(loginForm.password.value.length==0) {
				setMessage('패스워드를 입력해주세요.', loginForm.password);
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