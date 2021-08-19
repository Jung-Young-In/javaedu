<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

    
<!doctype html>
<html lang="en">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge" />
  
 <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/HW_main/css/animate.css" >
  <link rel="stylesheet" href="<%=request.getContextPath() %>/HW_main/css/bootstrap.min.css" type="text/css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:300,400,700" >
  <link rel="stylesheet" href="<%=request.getContextPath() %>/HW_main/css/style.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,600" />
   <!-- Google web font "Open Sans" -->
   <link rel="stylesheet" href="<%=request.getContextPath() %>/HW_membership/css/all.min.css" />
   <link rel="stylesheet" href="<%=request.getContextPath() %>/HW_membership/css/bootstrap.min.css" />
   <link rel="stylesheet" href="<%=request.getContextPath() %>/HW_membership/css/templatemo-style.css" />
    <title>멤버쉽 소개 </title>
  
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


.frame {
  width: 90%;
  margin: 40px auto;
  text-align: center;
}
button {
  margin: 20px;
  outline: none;
}
.custom-btn {
  width: 130px;
  height: 40px;
  padding: 10px 25px;
  border: 2px solid #000;
  font-weight: 500;
  background: transparent;
  cursor: pointer;
  transition: all 0.3s ease;
  position: relative;
  display: inline-block;
}


/* 8 */
.btn-8 {
   line-height: 40px;
  padding: 0;
  background: transparent;
  position: relative;
  z-index: 2;
  color: #fff;
  -webkit-perspective: 300px;
  perspective: 300px;
  -webkit-transform-style: preserve-3d;
  transform-style: preserve-3d;
}
.btn-8:hover{
  color: #000;
}
.btn-8:after {
  position: absolute;
  content: "";
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: #000;
  z-index: -1;
  -webkit-transform-origin: center bottom;
  transform-origin: center bottom;
  -webkit-transform: rotateX(0);
  transform: rotateX(0);
  transition: all 0.3s ease;
}
.btn-8:hover:after {
  -webkit-transform: rotateX(-180deg);
  transform: rotateX(-180deg);
}
  
.btn-81 {
   line-height: 40px;
  padding: 0;
  background: transparent;
  position: relative;
  z-index: 2;
  color: #000;
  -webkit-perspective: 300px;
  perspective: 300px;
  -webkit-transform-style: preserve-3d;
  transform-style: preserve-3d;
}
.btn-81:hover{
  color: #fff;
}
.btn-81:after {
  position: absolute;
  content: "";
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: #fff;
  z-index: -1;
  -webkit-transform-origin: center bottom;
  transform-origin: center bottom;
  -webkit-transform: rotateX(0);
  transform: rotateX(0);
  transition: all 0.3s ease;
}
.btn-81:hover:after {
  -webkit-transform: rotateX(-180deg);
  transform: rotateX(-180deg);
}
</style>

</head>

<body>
<div class="container-fluid">
<div class="collapse navbar-collapse" id="myNavbar">
  <ul class="nav navbar-nav">
  </ul>
  <ul class="nav navbar-nav navbar-right">
  	<li>
  	<a href="<%=request.getContextPath() %>/HW/mypageuser/main.do"> 
  	<%=(String)session.getAttribute("signedUser") %>님 반갑습니다^^ 
  	</a></li>
    <li><a href="<%=request.getContextPath() %>/HW/main/logout.do" style="font-size: x-large;"><span class="glyphicon glyphicon-log-in" ></span> LogOut</a></li>
  </ul>
</div>
</div>
<div class="container-fluid pl-0 pr-0 bg-img clearfix parallax-window2" data-parallax="scroll" data-image-src="<%=request.getContextPath() %>/HW_main/images/banner2.jpg">
  <nav class="navbar navbar-expand-md navbar-dark">
    <div class="container"> 
      <!-- 로고--> 
      <a class="navbar-brand mr-auto" href="<%=request.getContextPath() %>/HW/main/main.do"><img src="<%=request.getContextPath() %>/HW_main/images/logo.png" alt="HWlogo" /></a> 
      
      <!-- 토글 버튼 -->
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar"> <span class="navbar-toggler-icon"></span> </button>
      
      <!-- 네비게이션 링크 -->
      <div class="collapse navbar-collapse" id="collapsibleNavbar">
      
       <ul class="navbar-nav ml-auto">
          <li class="nav-item"> 
          		<a class="nav-link" href="<%=request.getContextPath() %>/HW/video/pt.do">PT</a>
          </li>
          <li class="nav-item"> 
          		<a class="nav-link" href="<%=request.getContextPath() %>/HW/prod/list.do">쇼핑몰</a> 
          </li>
          <li class="nav-item"> 
          	          		<a class="nav-link" href="<%=request.getContextPath() %>/HW/notice/list.do">게시판</a> 
          </li>
          <li class="nav-item"> 
          		<a class="nav-link" href="<%=request.getContextPath() %>/HW/pay/memberex.do"">멤버쉽</a>
          </li>
        </ul>
        <ul class="navbar-nav ml-5">
          <li class="nav-item"> <a class="nav-link btn btn-danger" href="<%=request.getContextPath() %>/HW/main/logout.do">&nbsp;LogIn&nbsp;</a> </li>
        </ul>
      </div>
    </div>
  </nav>
  
  

 <div class="container">
   	 <div class="columns-bg">
      <!-- Logo & Intro -->
      <section id="logo" class="tm-section-logo">
        <div class="container-fluid">
          <div class="row">
            <div class="col-sm-12 offset-sm-0 col-md-6 offset-md-6">
              <div class="tm-site-name-container">
                <div class="tm-site-name-container-inner">
                  <h1 class="text-uppercase tm-text-primary tm-site-name">
                    HW memberShip
                  </h1>
                  <p class="tm-text-primary tm-site-description">
                   	HW 만의 특별 해택
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      <!-- Intro -->
      <section id="intro" class="tm-p-1-section-1">
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-6">
              <div class="tm-section-text-container">
                <i class="tm-text-white">
                  <p class="mb-0">
                    	<h3>HWmember</h3> 
                    	<h4>만 가질수 있는 해특별한 선택  </h4> </p>
                    
                </i>
              </div>
            </div>
          </div>
        </div>
      </section>

      <!-- Our Place -->
      <section id="our_place">
        <div class="container-fluid">
          <div class="row">
            <div
              class="col-md-12 col-lg-6 tm-section-image-container tm-img-left-container"
            >                                      
              <img src="<%=request.getContextPath()%>/HW_membership/IMG/22.jpg" alt="Image" class="img-fluid" style="width:90%;"/>
            </div>
            <div class="col-md-12 col-lg-6">
              <div class="tm-section-text-container-2">
                <h2
                  class="tm-text-primary tm-section-title-mb tm-sm-bg-white-alpha"
                >
                  1번쨰 해택
                </h2>
                <div class="tm-text-gray">
                  <p class="mb-4">
                  	HW 만에서 저렴하게 구입할수 있는 <a href="#">HW market</a>의 보조 식품과 운동 기구  , 
                                   이 저렴한 제품을 멤버쉽 기간 동안  추가로 10% 추가 할인!!
                 </p>
                 
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      <!-- Fusce, Section 4 -->
      <section id="section_4" class="tm-section-4">
        <div class="container-fluid">
          <div class="row flex-column-reverse flex-lg-row">
            <div class="col-md-12 col-lg-6 tm-text-left-container">
              <div class="tm-section-text-container-3 tm-bg-white-alpha h-100">
                <h2 class="tm-text-primary tm-section-title-mb tm-sm-bg-white-alpha">
                 2번째 해택
                </h2>
                <p class="mb-0">
                  HW에서 만이 누릴 수 있는 특별한 혜택 그 2번째  전문 트레이너 들의 1:1 대 매팅으로  <br>
                                보다 전문적이고 효과적인 운동을 즐길수있는 HW 만의 PT!!!!
                </p>
              </div>
            </div>
            <div class="col-md-12 col-lg-6 tm-section-image-container tm-img-right-container"   >
              <img
                src="<%=request.getContextPath()%>/HW_membership/IMG/88.jpg"
                alt="Image"
                class="img-fluid tm-img-right"
              />
            </div>
          </div>
        </div>
      </section>

      <!-- 3번쨰 -->
      <section id="gallery">
          <div class="row">
            <div
              class="col-md-12 col-lg-6 tm-section-image-container tm-img-left-container"
            >                                      
              <img src="<%=request.getContextPath()%>/HW_membership/IMG/gym2.jpg" alt="Image" class="img-fluid" style="width:90%;"/>
            </div>
            <div class="col-md-12 col-lg-6">
              <div class="tm-section-text-container-2">
                <h2
                  class="tm-text-primary tm-section-title-mb tm-sm-bg-white-alpha"
                >
                  3번쨰 해택
                </h2>
                <div class="tm-text-gray">
                  <p class="mb-4">
                  	HW 만에서 저렴하게 구입할수 있는 <a href="#">HW market</a>의 보조 식품과 운동 기구  , 
                                   이 저렴한 제품을 멤버쉽 기간 동안  추가로 10% 추가 할인!!
                 </p>
                 
                </div>
              </div>
            </div>
          </div>
      </section>
			<div class="frame" style="text-align: center;">
								<button class="custom-btn btn-81" onclick="location.href='<%=request.getContextPath() %>/HW/main/main.do'">홈으로</button>
								<button class="custom-btn btn-81" onclick="location.href='<%=request.getContextPath() %>/HW/pay/memberpay2.do'">결제</button>
			</div>
	</div>
	</div>
</div>

		<footer class="container-fluid">
  <div class="container">
    <div class="row" style="padding-top: 20px;">
      <div class="col-md-3 footer1 d-flex wow bounceInLeft" data-wow-delay=".25s">
        <div class="d-flex flex-wrap align-content-center"> <a href="<%=request.getContextPath() %>/HW/main/main.do"><img src="<%=request.getContextPath() %>/HW_main/images/logo.png" alt="logo" /></a>
          <p>&copy; 2021 HomeWar. All rights reserved.<br> Design by <a href="#" target="_blank">HomeWar</a>.</p>
        </div>
      </div>
      <div class="col-md-6 footer2 wow bounceInUp" data-wow-delay=".25s" id="contact">
      </div>
      <div class="col-md-3 footer3 wow bounceInRight" data-wow-delay=".25s">
        <h5>찾아 오시는 길</h5>
        <p>대전광역시 중구 대흥동.</p>
        <h5>E-mail</h5>
        <p>joo3278@naver.com</p>
        </div>
      </div>
    </div>
  </div>
</footer>

<!-- 자바스크립트  --> 

<script src="<%=request.getContextPath() %>/HW_main/js/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/HW_main/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath() %>/HW_main/js/parallax.js"></script>
<script src="<%=request.getContextPath() %>/HW_main/js/wow.js"></script>
<script src="<%=request.getContextPath() %>/HW_main/js/main.js"></script>
<script src="<%=request.getContextPath() %>/HW_notice/vendor/jquery/jquery-3.2.1.min.js"></script>
<script src="<%=request.getContextPath() %>/HW_notice/vendor/bootstrap/js/popper.js"></script>
<script src="<%=request.getContextPath() %>/HW_notice/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath() %>/HW_notice/vendor/select2/select2.min.js"></script>
<script src="<%=request.getContextPath() %>/HW_notice/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script>
$('.js-pscroll').each(function(){
	var ps = new PerfectScrollbar(this);

	$(window).on('resize', function(){
		ps.update();
	})
});
	

</script>
<script src="<%=request.getContextPath() %>/HW_notice/js/main.js"></script>
</body>
</html>