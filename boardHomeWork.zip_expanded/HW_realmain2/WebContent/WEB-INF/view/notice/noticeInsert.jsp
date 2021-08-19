<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%  // 인증된 세션이 없는경우, 해당페이지를 볼 수 없게 함.
    	if (session.getAttribute("signedUser") == null) {
    	  String redirectUrl = request.getContextPath()+"/HW/main/login.do";
    	response.sendRedirect(redirectUrl); 
    } 
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en-US">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>공지 게시판 글 등록</title>
<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/HW_main/css/animate.css" >
	<link rel="stylesheet" href="<%=request.getContextPath() %>/HW_main/css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:300,400,700" >
	<link rel="stylesheet" href="<%=request.getContextPath() %>/HW_main/css/style.css">
	<link rel="icon" type="image/png" href="<%=request.getContextPath() %>/HW_notice/images/icons/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/HW_notice/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/HW_notice/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/HW_notice/vendor/animate/animate.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/HW_notice/vendor/select2/select2.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/HW_notice/vendor/perfect-scrollbar/perfect-scrollbar.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/HW_notice/css/util.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/HW_notice/css/main.css">
	  
<script type="text/javascript">
jQuery(document).ready( function($) {
   
   var roll = 1;
   
   setInterval(function(){
      roll++;
      if (roll > 3) {roll = 1;}
      $("#hom").attr("src", "<%=request.getContextPath() %>/HW_main/IMG/ban" + roll + ".jpg");
   }, 2000);
   
   
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
});

</script>

<style type="text/css">
.aa {
   font-size: x-large;
   padding: 40px;
}

.menu-menu-1-container ul li {
   line-height: 97px;
}

.container-fluid>.navbar-collapse, .container-fluid>.navbar-header, .container>.navbar-collapse, .container>.navbar-header {
   background-color: black;
}

.topImg {
   background-image: url("/HW_main/IMG/5.jpg");
   background-repeat: no-repeat;
}

.topImg img {
   border-radius: 10px;
}


</style>
</head>
<body class="home page page-template page-template-template-portfolio page-template-template-portfolio-php">
  
  <div class="container-fluid">
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
      </ul>
      <ul class="nav navbar-nav navbar-right">
         <li>
         <a href="#"></a></li>
        <li><a href="<%=request.getContextPath() %>/HW/main/login.do" style="font-size:large; color: white;"><span class="glyphicon glyphicon-log-in" ></span> LogIn</a></li>
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
      <button class="menu-toggle"><img alt="안나와.." src="<%=request.getContextPath() %>/HW_main/IMG/logo.jpg"></button>
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
					<li><a href="<%=request.getContextPath() %>/HW/prod/categoriSelect.do?prodCategori=1">운동 기구</a></li>
					<li><a href="<%=request.getContextPath() %>/HW/prod/categoriSelect.do?prodCategori=2">보조 식품</a></li>
					<li><a href="#">배송 문의</a></li>
					<li><a href="#">상품 문의</a></li>
				</ul>
				</li>
				<li id="byun"><a href="#"><img alt="안나와.." src="<%=request.getContextPath() %>/HW_main/IMG/logo.jpg" width="150" height="150"></a></li>
				<li>
				<a href="<%=request.getContextPath() %>/HW/notice/list.do" class="aa">게시판</a>
				<ul class="sub-menu">
					<li><a href="#l">공지 사항</a></li>
					<li><a href="#">Q & A</a></li>
				</ul>
				</li>
				<li>
				<a href="<%=request.getContextPath() %>/HW/pay/memberex.do" class="aa">멤버쉽</a>
				<ul class="sub-menu">
					<li><a href="#">멤버쉽 소개</a></li>
					<li><a href="#">멤버쉽 결제</a></li>
				</ul>
				</li>
			</ul>
      </div>
      </nav>
      </header>

<body>
<form action="<%=request.getContextPath() %>/HW/notice/insert.do" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td>글 제목 : </td>
				<td><input type="text" name="noticeTitle" value=""></td>
			</tr>
			<tr>
				<td>작성자 : </td>
				<td><input type="text" name="noticeWriter" value=""></td>
			</tr>
			<tr>
				<td>글 내용: </td>
				<td><input type="text" name="noticeContent" value=""></td>
		</table>
		<input type="submit" value="글 등록">
	</form>
</body>
<!-- .container -->
   <footer id="colophon" class="site-footer">
   <div class="container">
      <div class="site-info">
         <h1 style="font-family: 'Herr Von Muellerhoff';color: #ccc;font-weight:300;text-align: center;margin-bottom:0;margin-top:0;line-height:1.4;font-size: 46px;">Hw</h1>
         copyright Homewar 2021-04-21<i class="fa fa-love"></i>
      </div>
   </div>   
   </footer>
   <a href="#top" class="smoothup" title="Back to top"><span class="genericon genericon-collapse"></span></a>
</div>

</body>
<!-- #page -->
<script src='<%=request.getContextPath() %>/HW_main/js/plugins.js'></script>
<script src='<%=request.getContextPath() %>/HW_main/js/scripts.js'></script>
<script src='<%=request.getContextPath() %>/HW_main/js/masonry.pkgd.min.js'></script>

 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</html>