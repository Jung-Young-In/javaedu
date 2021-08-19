<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src='<%=request.getContextPath() %>/HW_main/js/jquery.js'></script>
<script type="text/javascript" src="https://yourwebsite.com/script.js"></script>
<script type="text/javascript" src="https://codepen.io/username/pen/aBcDef"></script>
<%-- <script src='<%=request.getContextPath() %>/HW_main/js/login.js'></script> --%>
<style type="text/css">

@import url('https://fonts.googleapis.com/css?family=Montserrat:400,800');

* {
	box-sizing: border-box;
}

body {
	background: #f6f5f7;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	font-family: 'Montserrat', sans-serif;
	height: 100vh;
	margin: -20px 0 50px;
}

h1 {
	font-weight: bold;
	margin: 0;
}

h2 {
	text-align: center;
}

p {
	font-size: 14px;
	font-weight: 100;
	line-height: 20px;
	letter-spacing: 0.5px;
	margin: 20px 0 30px;
}

span {
	font-size: 12px;
}

a {
	color: #333;
	font-size: 14px;
	text-decoration: none;
	margin: 15px 0;
}

button {
	border-radius: 20px;
	border: 1px solid black;
	background-color: #FF4B2B;
	color: #FFFFFF;
	font-size: 12px;
	font-weight: bold;
	padding: 12px 45px;
	letter-spacing: 1px;
	text-transform: uppercase;
	transition: transform 80ms ease-in;
}

button:active {
	transform: scale(0.95);
}

button:focus {
	outline: none;
}

button.ghost {
	background-color: transparent;
	border-color: #FFFFFF;
}

form {
	background-color: #FFFFFF;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	padding: 0 50px;
	height: 100%;
	text-align: center;
}

input {
	background-color: #eee;
	border: none;
	padding: 12px 15px;
	margin: 8px 0;
	width: 100%;
}

.container {
	background-color: #fff;
	border-radius: 10px;
  	box-shadow: 0 14px 28px rgba(0,0,0,0.25), 
			0 10px 10px rgba(0,0,0,0.22);
	position: relative;
	overflow: hidden;
	width: 768px;
	max-width: 100%;
	min-height: 480px;
}

.form-container {
	position: absolute;
	top: 0;
	height: 100%;
	transition: all 0.6s ease-in-out;
}

.sign-in-container {
	left: 0;
	width: 50%;
	z-index: 2;
}

.container.right-panel-active .sign-in-container {
	transform: translateX(100%);
}

.sign-up-container {
	left: 0;
	width: 50%;
	opacity: 0;
	z-index: 1;
}

.container.right-panel-active .sign-up-container {
	transform: translateX(100%);
	opacity: 1;
	z-index: 5;
	animation: show 0.6s;
}

@keyframes show {
	0%, 49.99% {
		opacity: 0;
		z-index: 1;
	}
	
	50%, 100% {
		opacity: 1;
		z-index: 5;
	}
}

.overlay-container {
	position: absolute;
	top: 0;
	left: 50%;
	width: 50%;
	height: 100%;
	overflow: hidden;
	transition: transform 0.6s ease-in-out;
	z-index: 100;
}

.container.right-panel-active .overlay-container{
	transform: translateX(-100%);
}

.overlay {
	background: #FF416C;
	background: -webkit-linear-gradient(to right, #FF4B2B, #FF416C);
	background: linear-gradient(to right, black, black); /* 움직일때 색 통일 */
	background-repeat: no-repeat;
	background-size: cover;
	background-position: 0 0;
	color: #FFFFFF;
	position: relative;
	left: -100%;
	height: 100%;
	width: 200%;
  	transform: translateX(0);
	transition: transform 0.6s ease-in-out;
}

.container.right-panel-active .overlay {
  	transform: translateX(50%);
}

.overlay-panel {
	position: absolute;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	padding: 0 40px;
	text-align: center;
	top: 0;
	height: 100%;
	width: 50%;
	transform: translateX(0);
	transition: transform 0.6s ease-in-out;
}

.overlay-left {
	transform: translateX(-20%);
}

.container.right-panel-active .overlay-left {
	transform: translateX(0);
}

.overlay-right {
	right: 0;
	transform: translateX(0);
}

.container.right-panel-active .overlay-right {
	transform: translateX(20%);
}

.social-container {
	margin: 20px 0;
}

.social-container a {
	border: 1px solid #DDDDDD;
	border-radius: 50%;
	display: inline-flex;
	justify-content: center;
	align-items: center;
	margin: 0 5px;
	height: 40px;
	width: 40px;
}

footer {
    background-color: #222;
    color: #fff;
    font-size: 14px;
    bottom: 0;
    position: fixed;
    left: 0;
    right: 0;
    text-align: center;
    z-index: 999;
}

footer p {
    margin: 10px 0;
}

footer i {
    color: red;
}

footer a {
    color: #3c97bf;
    text-decoration: none;
}
</style>

</head>
<body>
<h2><a href="<%=request.getContextPath() %>/HW/main/main.do"><img alt="안나와.." src="<%=request.getContextPath() %>/HW_main/IMG/logo.jpg"></a>Member</h2>
<div class="container" id="container">
	<div class="form-container sign-up-container">
		<form action="/HW_BHK/user2" method="post">
			<h1>비밀번호 찾기</h1>
			<br>
			<span>당신의 이메일을 입력하시오</span>
			<br>
			<input type="text" placeholder="사용자의 이메일 입력" id="userEmail2" name="memEmail"/>
			<input type="text" placeholder="사용자의 이름 입력" id="userName2" name="memName"/>
			<a href="#"></a>
			<button type="button" style="background-color: black;" onclick="emailCheck2()">발송</button>
			<!-- <input type="submit" value="로그인"> -->
		</form>
	</div>
	<div class="form-container sign-in-container">
		<form action="/HW_BHK/user2" method="post">
			<h1>아이디 찾기</h1>
			<br>
			<span>당신의 이메일을 입력하시오</span>
			<br>
			<input type="text" placeholder="사용자의 이메일 입력" id="userEmail1" name="memEmail"/>
			<input type="text" placeholder="사용자의 이름 입력" id="userName1" name="memName"/>
			<a href="#"></a>
			<button type="button" style="background-color: black;" onclick="emailCheck1()">발송</button>
			<!-- <input type="submit" value="로그인"> -->
		</form>
	</div>
	<div class="overlay-container">
		<div class="overlay">
			<div class="overlay-panel overlay-left" style="background-color: black;">
				<h1>이메일을 입력해주세요</h1>
				<p>이메일로 비밀번호를 발송해 드립니다<br>
					발송된 비밀번호로 로그인해주세요</p>
				<button class="ghost" id="signIn">아이디 찾기</button>
			</div>
			<div class="overlay-panel overlay-right"  style="background-color: black;">
				<h1>이메일을 입력해주세요</h1>
				<p>이메일로 아이디를 발송해 드립니다<br>
					발송된 아이디로 로그인해주세요</p>
			 <button class="ghost" id="signUp">비밀번호 찾기</button> 
			</div>
		</div>
	</div>
</div>
</div>
</body>
<script type="text/javascript">
const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const container = document.getElementById('container');

signUpButton.addEventListener('click',() => {
	container.classList.add("right-panel-active");
});

signInButton.addEventListener('click',() => {
	container.classList.remove("right-panel-active");
});



 function emailCheck1() {
	var email1 = jQuery("#userEmail1").val();
	var name = jQuery("#userName1").val();
	
	alert(email1+"에 이메일을 보냅니다.확인을 누르시면 진행합니다.");
	alert("잠시만 기다려주세요");
	
	
	
	var param = {
			'email' : email1
			,'name' : name
			,'flag' : 'IDFIND'
	};
	
	jQuery.ajax({
		url : "/HW_realmain2/user3"
		,type : "post"
		,data : param
		,dataType : "json"
		,success : function(data){
			console.log(data);
			if(data.resultCnt == 1){
				alert("이메일 인증을 보냈습니다 확인해주세요");
				changePage();
			}
		}
		,error : function(xhr){
			console.log(xhr);
			alert("이메일인증을 실패하였습니다.다시 이메일을 입력해주세요");
		}
	});
	
}

function emailCheck2() {
	var email1 = jQuery("#userEmail2").val();
	var name = jQuery("#userName2").val();
	alert(email1+"에 이메일을 보냅니다.확인을 누르시면 진행합니다.");
	alert("잠시만 기다려주세요");
	var param = {
			'email' : email1
			,'name' : name
			,'flag' : 'PASSFIND'
	};
	
	jQuery.ajax({
		url : "/HW_realmain2/user3"
		,type : "post"
		,data : param
		,dataType : "json"
		,success : function(data){
			console.log(data);
			if(data.resultCnt == 1){
				alert("이메일 인증을 보냈습니다 확인해주세요");
				changePage();
			}
		}
		,error : function(xhr){
			console.log(xhr);
			alert("이메일인증을 실패하였습니다.다시 이메일을 입력해주세요");
		}
	});
	
} 



function changePage() {
	window.location.href = "login.do";
}
</script>
</html>