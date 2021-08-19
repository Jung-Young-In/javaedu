<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%  // 인증된 세션이 없는경우, 해당페이지를 볼 수 없게 함.
    	if (session.getAttribute("signedUser") == null) {
    	  String redirectUrl = request.getContextPath()+"/HW/main/login.do";
    	response.sendRedirect(redirectUrl); 
    } 
%>  
    
<!doctype html>
<html lang="en">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Project HW</title>

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/HW_main/css/animate.css" >
  <link rel="stylesheet" href="<%=request.getContextPath() %>/HW_main/css/bootstrap.min.css" type="text/css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:300,400,700" >
  <link rel="stylesheet" href="<%=request.getContextPath() %>/HW_main/css/style.css">
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
</script>
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
      <a class="navbar-brand mr-auto" href="#"><img src="<%=request.getContextPath() %>/HW_main/images/logo.png" alt="HWlogo" /></a> 
      
      <!-- 토글 버튼 -->
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar"> <span class="navbar-toggler-icon"></span> </button>
      
      <!-- 네비게이션 링크 -->
      <div class="collapse navbar-collapse" id="collapsibleNavbar">
        <ul class="navbar-nav ml-auto" style="float:left;">
          <li><a href="<%=request.getContextPath() %>/HW/mypageuser/main.do"> <%=(String)session.getAttribute("signedUser") %>님 반갑습니다^^ </li>
      	</ul>
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
          <li class="nav-item"> <a class="nav-link btn btn-danger" href="<%=request.getContextPath() %>/HW/main/logout.do">&nbsp;LogOut&nbsp;</a> </li>

        </ul>
      </div>
    </div>
  </nav>
  
  
  
  
  
  <div class="container">
    <div class="fh5co-banner-text-box">
      <div class="quote-box pl-5 pr-5 wow bounce">
<!--       <div class="quote-box pl-5 pr-5 wow bounceInRight"> -->
        <h2> HW <br>만이 누릴수 있는<br><span>PT</span> 와  <span>Market</span> </h2>
      </div>
      <a href="<%=request.getContextPath() %>/HW/video/pt.do" class="btn text-uppercase btn-outline-danger btn-lg mr-3 mb-3 wow bounceInUp"> PT </a> <a href="<%=request.getContextPath() %>/HW/prod/list.do" class="btn text-uppercase btn-outline-danger btn-lg mb-3 wow bounceInDown"> Market</a> </div>
  </div>
</div>
<div class="container-fluid fh5co-network">
  <div class="container">
    <div class="row">
      <div class="col-md-6">
<!--         <h4 class="wow bounceInUp">FOR NETWORK</h4> -->
        <h2 class="wow bounce">이벤트</h2>
<!--         <h2 class="wow bounceInRight">HomeWar</h2> -->
        <hr>
        <h5 class="wow bounce">HomeWar 2021 여름 특별 이벤트</h5>
<!--         <h5 class="wow bounceInLeft">NETWORK SUMMER 2017</h5> -->
        <p class="wow bounceInDown">특별 강사 이휘로 강사님 초청 강연 / 대덕 인재 개발원 403호 홍일점 박상영 씨의 초청 공연</p>
      </div>
      <div class="col-md-6">
        <figure class="wow bounceInDown"> <img src="<%=request.getContextPath() %>/HW_main/images/about-img.jpg" alt="gym" class="img-fluid" /> </figure>
      </div>
    </div>
  </div>
</div>
<div id="about-us" class="container-fluid fh5co-about-us pl-0 pr-0 parallax-window" data-parallax="scroll" data-image-src="<%=request.getContextPath() %>/HW_main/images/about-us-bg.jpg">
  <div class="container">
    <div class="col-sm-6 offset-sm-6">
      <h2 class="wow bounceInLeft" data-wow-delay=".25s">about HomeWar</h2>
      <hr>
      <p class="wow bounceInRight" data-wow-delay=".25s">27년 전통의 이씨 가문의 전통 훈련법을 중점으로 만들어진 신체 강화 훈련법과 듬직한 PL을 중심으로 형성된 방구석 여포로 구성 되어 있습니다 </p>
      <a href="<%=request.getContextPath() %>/HW/pay/memberex.do" class="btn btn-lg btn-outline-danger d-inline-block text-center mx-auto wow bounceInDown">멤버쉽</a> </div>
  </div>
</div>
<div class="container-fluid fh5co-content-box">
  <div class="container">
    <div class="row">
      <div class="col-md-5 pr-0"><img src="<%=request.getContextPath() %>/HW_main/images/rode-gym.jpg" alt="gym" class="img-fluid wow bounceInLeft" /> </div>
      <div class="col-md-7 pl-0">
        <div class="wow bounceInRight" data-wow-delay=".25s">
          <div class="card-img-overlay">
            <p>우리의 파덜 , 34년 어둠의 영역에 몸담고 있던 파란 만장한 화려한 인생의 주인공 정영인 강사님의 노하우 </p>
          </div>
          <img src="<%=request.getContextPath() %>/HW_main/images/gym-girls.jpg" alt="girls in gym" class="img-fluid" /> </div>
      </div>
    </div>
    <div class="row trainers pl-0 pr-0">
      <div class="col-12 bg-50">
        <div class="quote-box2 wow bounceInDown" data-wow-delay=".25s">
          <h2> 트레이너 </h2>
        </div>
      </div>
      <div class="col-md-6 pr-5 pl-5">
        <div class="card text-center wow bounceInLeft" data-wow-delay=".25s"> <img class="card-img-top rounded-circle img-fluid" src="<%=request.getContextPath() %>/HW_main/images/star2.jpg" alt="Card image">
          <div class="card-body mb-5">
            <h4 class="card-title">이휘로</h4>
            <p class="card-text">27년 이씨 가문의 희망</p>
          </div>
        </div>
      </div>
      <div class="col-md-6 pl-5 pr-5">
        <div class="card text-center wow bounceInRight" data-wow-delay=".25s"> <img class="card-img-top rounded-circle img-fluid" src="<%=request.getContextPath() %>/HW_main/images/father.jpg" alt="Card image">
          <div class="card-body mb-5">
            <h4 class="card-title">정영인</h4>
            <p class="card-text">34년 HW의 유일한 희망</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<footer class="container-fluid">
  <div class="container">
    <div class="row" style="padding-top: 20px;">
      <div class="col-md-3 footer1 d-flex wow bounceInLeft" data-wow-delay=".25s">
        <div class="d-flex flex-wrap align-content-center"> <a href="#"><img src="<%=request.getContextPath() %>/HW_main/images/logo.png" alt="logo" /></a>
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

</body>
</html>