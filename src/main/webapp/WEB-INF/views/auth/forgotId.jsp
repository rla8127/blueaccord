<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file = "../common/header.jsp" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
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
			<h5>가입에 사용한 이름과 이메일을 입력해주세요.</h5>
		</div>
		<div class="login-form">
			<form action="<c:url value='/find/id'/>" id="findIdForm" method="post" onsubmit="return formCheck(this);">
				<div class="login-input">
					<input type="text"  placeholder="이름" name="name"><br>
					<input type="email" placeholder="이메일" name="email">
					<input type="hidden" name="toURL" value="${param.toURL}">
				</div>
				<button type="submit" id="loginBtn" autofocus>아이디 조회</button>
				<div id="msg">
					<c:if test="${not empty param.msg}">
						<i class="fa fa-exclamation-circle">${param.msg}</i>
					</c:if>
				</div>
				<div class="find-container">
					<a href="<c:url value='/login'/>">로그인</a>
					<span style="font-size: 14px; padding: 0 10px;">|</span> 
					<a href="<c:url value='/find/password'/>">비밀번호 찾기</a>
				</div>
			</form>
		</div>
	</div>
</div>
	<script>
		function formCheck(findIdForm) {
			let msg ='';
			if(findIdForm.name.value.length==0) {
				setMessage('이름을 입력해주세요.', findIdForm.name);
				return false;
			}
			if(findIdForm.email.value.length==0) {
				setMessage('이메일을 입력해주세요.', findIdForm.email);
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