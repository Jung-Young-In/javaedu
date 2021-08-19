<%@page import="kr.or.ddit.video.vo.VideoVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PTYoutube</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/HW_video/css/bmi.css"/>
<script src='<%=request.getContextPath() %>/HW_video/js/jquery-3.6.0.js'></script>
<script src='<%=request.getContextPath() %>/HW_video/js/jquery.js'></script>
<script src='<%=request.getContextPath() %>/HW_video/js/bmi.js'></script>
<link rel='stylesheet' href='<%=request.getContextPath() %>/HW_video/css/woocommerce-layout.css' type='text/css' media='all'/>
<link rel='stylesheet' href='<%=request.getContextPath() %>/HW_video/css/woocommerce-smallscreen.css' type='text/css' media='only screen and (max-width: 768px)'/>
<link rel='stylesheet' href='<%=request.getContextPath() %>/HW_video/css/woocommerce.css' type='text/css' media='all'/>
<link rel='stylesheet' href='<%=request.getContextPath() %>/HW_video/css/font-awesome.min.css' type='text/css' media='all'/>
<link rel='stylesheet' href='<%=request.getContextPath() %>/HW_video/css/style2.css' type='text/css' media='all'/>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700' type='text/css' media='all'/>
<link rel='stylesheet' href='<%=request.getContextPath() %>/HW_video/css/easy-responsive-shortcodes.css' type='text/css' media='all'/>
<script type="text/javascript">
jQuery(document).ready( function($) {
	$(window).resize(function(){
		change();
	});
	  function change(){
		  var windowWidth = $(window).width();
		  if(windowWidth < 980) {
			  $('#byun').hide();
			} else {
				$('#byun').show();
			}
	  }
} );

function openNav() {
    document.getElementById("bmiSideMenu").style.width = "250px";
}

function closeNav() {
    document.getElementById("bmiSideMenu").style.width = "0";
}

</script>
<style type="text/css">
.aa {
	font-size: x-large;
	padding: 40px;
}

.sideNav {
   height: 300px;
   width: 227px;
   position: relative;
   z-index: 1;
   top: 0;
   left: 0;
   background-color: #111;
   overflow-x: hidden;
   transition: 0.5s;
   padding-top: 60px;
   border-radius: 5px;
}

.sideNav a {
    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 20px;
    color: #818181;
    display: block;
    transition: 0.3s;
    font-family: "Lato", sans-serif;
    margin-top: 5px;
}

.sideNav a:hover {
    color: #f1f1f1;
}

.sideNav .closebtn {
    position: absolute;
    top: 0;
    right: 25px;
    font-size: 36px;
    margin-left: 50px;
}

@media screen and (max-height: 450px) {
  .sideNav {padding-top: 15px;}
  .sideNav a {font-size: 18px;}
}

#bmiTable{
	height: 400px;
	width: 870px;
	text-align: center;
	font-family: sans-serif;
	font-size: large;
}

#bmicall{
	width: 207px;
}

#bmiInput1{
	height: 400px;
	width: 434px;
	display: inline-block;
	border-radius: 7px;
}

#bmiInput11{
	margin-top: 70px;
}

#bmiInput2{
	height: 400px;
	width: 434px;
	text-align: center;
	border-radius: 7px;
}

#bmiResult1{
	margin-top:70px;
	display: inline-block;
}

#bmiInput input{
	margin-top: 35px;
	margin-left: 50px;
}

</style>
</head>
<body class="home page page-template page-template-template-portfolio page-template-template-portfolio-php">
  
  <div class="container-fluid">
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="<%=request.getContextPath() %>/HW/main/login.do"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
    </div>
  </div>
  
<div id="page">
	<div class="container">
		<header id="masthead" class="site-header">
		<div class="site-branding">
			<h1 class="site-title"><a href="index.html" rel="home"></a></h1>
			<h2 class="site-description"></h2>
		</div>
		<nav id="site-navigation" class="main-navigation">
		<button class="menu-toggle"><img alt="안나와.." src="<%=request.getContextPath() %>/HW_video/IMG/logo.jpg"></button>
		<a class="skip-link screen-reader-text" href="#content">Skip to content</a>
		<div class="menu-menu-1-container" onchange="dis()">
				<ul id="menu-menu-1" class="menu">
				<li>
				<a href="<%=request.getContextPath() %>/HW/video/pt.do" class="aa">PT</a>
				<ul class="sub-menu">
					<li><a href="<%=request.getContextPath() %>/HW/video/bmi.do">BMI 계산기</a></li>
					<li><a href="#">운동 게시판</a></li>
					<li><a href="<%=request.getContextPath() %>/HW/video/video.do">운동 동영상</a></li>
					<li><a href="<%=request.getContextPath() %>/HW/video/exerfood.do">운동/식단</a></li>
				</ul>
				</li>
				<li>
				<a href="<%=request.getContextPath() %>/HW/prod/list.do" class="aa">쇼핑몰</a>
				<ul class="sub-menu">
					<li><a href="#">운동 기구</a></li>
					<li><a href="#">보조 식품</a></li>
					<li><a href="#">배송 문의</a></li>
					<li><a href="#">상품 문의</a></li>
				</ul>
				</li>
				<li id="byun"><a href="#"><img alt="안나와.." src="<%=request.getContextPath() %>/HW_main/IMG/logo.jpg" width="150" height="150"></a></li>
				<li>
				<a href="<%=request.getContextPath() %>/HW/board/list.do" class="aa">게시판</a>
				<ul class="sub-menu">
					<li><a href="#l">공지 사항</a></li>
					<li><a href="#">Q & A</a></li>
				</ul>
				</li>
				<li>
				<a href="#" class="aa">멤버쉽</a>
				<ul class="sub-menu">
					<li><a href="#">멤버쉽 소개</a></li>
					<li><a href="#">멤버쉽 결제</a></li>
				</ul>
				</li>
			</ul>
		</div>
		</nav>
		</header>
		<!-- #masthead -->
		<nav id="bmiNav">
			<a href="<%=request.getContextPath() %>/HW/video/bmi.do"><img alt="PTLogo" style="margin-left: -200px; margin-top: 15px;" src="<%=request.getContextPath() %>/HW_video/IMG/bmi.png"></a>
<!-- 			<input style="width: 600px; color:black;" type="text" id="result"> -->
		</nav>
				<span style="font-size: 30px; cursor: pointer; font-family: sans-serif; float: left;" onclick="openNav()">&#9776; open</span>
			
				<div id="bmiSideMenu" class="sideNav" style="max-width: 200px; margin-top: 50px; margin-left: -120px; height: 350px; margin-bottom: 50px;">
					<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
					<a href="<%=request.getContextPath() %>/HW/video/bmi.do">BMI 계산기</a>
					<a href="#">운동 게시판</a>
					<a href="<%=request.getContextPath() %>/HW/video/video.do">운동 동영상</a>
					<a href="<%=request.getContextPath() %>/HW/video/exerfood.do">운동/식단</a>
				</div>

			<div id="bmiTable" style="float: left;">
				<div id="bmiInput1" style="border: 1px solid gray; float: left;">
					<div id="bmiInput11">
						<label style="margin-right: 10px;">성별</label>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input style="color:black;" type="radio" id="M" name="gender">
						<label for="M" style="margin-right: 10px;">남자</label>
						&nbsp;&nbsp;&nbsp;
						<input style="color:black;" type="radio" id="F" name="gender">
						<label for="F">여자</label>
						<br><br>
						<label>키(cm)</label>&nbsp;
						<input style="color:black;" type="text" id="ke">
						<br><br>
						<label>몸무게(kg)</label>
			 			<input style="color:black;" type="text" id="mo">
						<br><br>
						<label>나이(세)</label>
		 				<input style="color:black;" type="text" id="age">
		 				<br><br>
		 				<button style="background-color: white;" type="reset">초기화</button>
		 				<button type="button" id="bmicall" style="margin-left: 30px; background-color: #D8D8D8;">계산하기</button>
		 			</div>	
				</div>
				<div id="bmiInput2" style="border:1px solid gray; float: left;">
					<div id="bmiResult1">
						<label>BMI(신체질량지수)</label>
						<br><br>
		 				<span id="bmiResult" style="font-size: xx-large;"></span>
		 				<br>
		 				<img alt="bmiResult" src="<%=request.getContextPath() %>/HW_video/IMG/bmiResult.png">
					</div>				
				</div>
			</div>
				
			</div>	
		<!-- #main -->
	</div>
	<!-- #primary -->
		<!-- #content -->
	<!-- .container -->
<!-- 	<footer id="colophon" class="site-footer"> -->
<!-- 	<div class="container"> -->
<!-- 		<div class="site-info"> -->
<!-- 			<h1 style="font-family: 'Herr Von Muellerhoff';color: #ccc;font-weight:300;text-align: center;margin-bottom:0;margin-top:0;line-height:1.4;font-size: 46px;">밑에</h1> -->
<!-- 			밑에<i class="fa fa-love"></i> -->
<!-- 		</div> -->
<!-- 	</div>	 -->
<!-- 	</footer> -->
<!-- 	<a href="#top" class="smoothup" title="Back to top"><span class="genericon genericon-collapse"></span></a> -->
</body>
<!-- #page -->
<script src='<%=request.getContextPath() %>/HW_video/js/plugins.js'></script>
<script src='<%=request.getContextPath() %>/HW_video/js/scripts.js'></script>
<script src='<%=request.getContextPath() %>/HW_video/js/masonry.pkgd.min.js'></script>

 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</html>