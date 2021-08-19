<%@page import="kr.or.ddit.video.vo.VideoVO"%>
<%@page import="kr.or.ddit.exerfood.vo.FoodVO"%>
<%@page import="kr.or.ddit.exerfood.vo.ExerVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%  /* 
       if (session.getAttribute("signedUser") != null) {
         String redirectUrl = request.getContextPath()+"/HW/main/mainlogin.do";
       response.sendRedirect(redirectUrl); 
    }  */
    	List<VideoVO> videoList = (List<VideoVO>)request.getAttribute("videoList");
    	List<ExerVO> exerList = (List<ExerVO>)request.getAttribute("exerList");
    	List<FoodVO> foodList = (List<FoodVO>)request.getAttribute("foodList");
%>   
 
<!DOCTYPE html>
<html lang="en-US">

<head>
  <!-- Required meta tags -->
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Project HW</title>
<style type="text/css">
#bmiTable{
	height: 400px;
	width: 870px;
	text-align: center;
	font-family: sans-serif;
	font-size: large;
	color: white;
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
	margin-top: 50px;
}

#bmiInput2{
	height: 400px;
	width: 434px;
	text-align: center;
	border-radius: 7px;
	margin-top: -20px;
}

#bmiResult1{
	margin-top:70px;
	display: inline-block;
}

#bmiInput input{
	margin-top: 35px;
	margin-left: 50px;
}

label {
	font-size: 25px;
}

</style>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/HW_main/css/animate.css" >
  <link rel="stylesheet" href="<%=request.getContextPath() %>/HW_main/css/bootstrap.min.css" type="text/css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:300,400,700" >
  <link rel="stylesheet" href="<%=request.getContextPath() %>/HW_main/css/style.css">
</head>
<body>
<div class="container-fluid pl-0 pr-0 bg-img clearfix parallax-window2" data-parallax="scroll" data-image-src="<%=request.getContextPath() %>/HW_main/images/banner2.jpg">
  <nav class="navbar navbar-expand-md navbar-dark">
    <div class="container"> 
      <!-- 로고--> 
      <a class="navbar-brand mr-auto" href="<%=request.getContextPath() %>/HW/main/main.do"><img src="<%=request.getContextPath() %>/HW_main/images/logo.png" alt="HWlogo" /></a> 
      
      <!-- 토글 버튼 -->
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar"> <span class="navbar-toggler-icon"></span> </button>
      
      <!-- 네비게이션 링크 -->
      <div class="collapse navbar-collapse" id="collapsibleNavbar">
      <ul class="navbar-nav ml-auto" style="float:left;">
<%--            <li><a href="<%=request.getContextPath() %>/HW/mypageuser/main.do"> <%=(String)session.getAttribute("signedUser") %>님 반갑습니다^^ </li> --%>
				 <% 
		  	if (session.getAttribute("signedUser") == null) {
		  	 %>
		  		
		  		<% 
		  } else {
			  %>
      			
		  		 <li><a href="<%=request.getContextPath() %>/HW/mypageuser/main.do"> <%=(String)session.getAttribute("signedUser") %>님 반갑습니다^^ </li>
			  
			  <% 
		  }
      %>
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
          		<a class="nav-link" href="<%=request.getContextPath() %>/HW/pay/memberex.do">멤버쉽</a>
          </li>
        </ul>
        <ul class="navbar-nav ml-5">
          <li class="nav-item"> 
<%--           	<a class="nav-link btn btn-danger" href="<%=request.getContextPath() %>/HW/main/login.do">&nbsp;LogIn&nbsp;</a>  --%>
				 <% 
		  	if (session.getAttribute("signedUser") == null) {
		  	 %>
		  		<a class="nav-link btn btn-danger" href="<%=request.getContextPath() %>/HW/main/login.do">&nbsp;LogIn&nbsp;</a>
		  		
		  		<% 
		  } else {
			  %>
      			<a class="nav-link btn btn-danger" href="<%=request.getContextPath() %>/HW/main/logout.do">&nbsp;LogOut&nbsp;</a>
			  
			  <% 
		  }
      %>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  
  <!-- 1번 컨테이너 -->
  
  <div class="container">
    <div class="fh5co-banner-text-box">
<!--       <div class="quote-box pl-5 pr-5 wow bounce"> -->
		<div>
	  		<fieldset id="videoField" style="width: 888px; height: 300px;">	
							<%
								int[] numbers = new int[4];
							
								for(int i = 0; i < numbers.length; i++){
									numbers[i] = (int)(Math.random() * videoList.size());
									
									for(int j = 0; j < i; j++){
										if(numbers[i] == numbers[j]){
											i--;
											break;
										}
									}
								}
								
								int a = numbers[0];
								int b = numbers[1];
								int c = numbers[2];
								int d = numbers[3];
								
							%>
						<div style="float: left; border: 3px solid orange;">
							<fieldset id="ptVideo">
							
							<iframe width="300" height="200"
									src="https://www.youtube.com/embed/<%=videoList.get(a).getVideoPath()%>" title="YouTube video player" frameborder="0"
							allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
							allowfullscreen></iframe><br>
<%-- 							<span><%=videoList.get(a).getVideoContent()%></span> --%>
							</fieldset>
						</div>
						<div style="float: left; margin-left: 50px; border: 3px solid orange;">
							<fieldset id="ptVideo">
							
							<iframe width="300" height="200"
									src="https://www.youtube.com/embed/<%=videoList.get(b).getVideoPath()%>" title="YouTube video player" frameborder="0"
							allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
							allowfullscreen></iframe><br>
<%-- 							<span><%=videoList.get(b).getVideoContent()%></span> --%>
							</fieldset>
						</div>
<!-- 						<div style="float: left; margin-left: 50px; border: 3px solid orange;"> -->
<!-- 							<fieldset id="ptVideo"> -->
							
<!-- 							<iframe width="300" height="200" -->
<%-- 									src="https://www.youtube.com/embed/<%=videoList.get(c).getVideoPath()%>" title="YouTube video player" frameborder="0" --%>
<!-- 							allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" -->
<!-- 							allowfullscreen></iframe><br> -->
<%-- <%-- 							<span><%=videoList.get(b).getVideoContent()%></span> --%> --%>
<!-- 							</fieldset> -->
<!-- 						</div> -->
<!-- 						<div style="float: left; margin-left: 50px; border: 3px solid orange;"> -->
<!-- 							<fieldset id="ptVideo"> -->
							
<!-- 							<iframe width="300" height="200" -->
<%-- 									src="https://www.youtube.com/embed/<%=videoList.get(d).getVideoPath()%>" title="YouTube video player" frameborder="0" --%>
<!-- 							allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" -->
<!-- 							allowfullscreen></iframe><br> -->
<%-- <%-- 							<span><%=videoList.get(b).getVideoContent()%></span> --%> --%>
<!-- 							</fieldset> -->
<!-- 						</div> -->
			</fieldset>
		</div>
<!--       </div> -->
      <a href="<%=request.getContextPath() %>/HW/exerboard/list.do" class="btn text-uppercase btn-outline-danger btn-lg mr-3 mb-3 wow bounceInUp"> 운동게시판 </a> 
      <a href="<%=request.getContextPath() %>/HW/video/exerfood.do" class="btn text-uppercase btn-outline-danger btn-lg mb-3 wow bounceInLeft"> 운동방법</a> 
      <a style="margin-left: 15px;" href="<%=request.getContextPath() %>/HW/video/exerSikdan.do" class="btn text-uppercase btn-outline-danger btn-lg mb-3 wow bounceInRight"> 식단</a> 
      <% 
		  	if (session.getAttribute("signedUser") == null) {
		  	 %>
		  		<a style="margin-left: 15px;" href="<%=request.getContextPath() %>/HW/main/login.do" class="btn text-uppercase btn-outline-danger btn-lg mb-3 wow bounceInDown"> 비회원 사용 불가</a>
		  		
		  		<% 
		  } else {
			  %>
      <a style="margin-left: 15px;" href="<%=request.getContextPath() %>/HW/video/video.do" class="btn text-uppercase btn-outline-danger btn-lg mb-3 wow bounceInDown"> 운동 동영상</a>
			  
			  <% 
		  }
      %>
      
      
      
      </div> 
  </div>
</div>
<div class="container-fluid fh5co-network">
  <div class="container">
    <div class="row">
      <div class="col-md-6" style="margin-top: 30px;">
<!--         <h4 class="wow bounceInUp">FOR NETWORK</h4> -->
        <h2 class="wow bounce" style="margin-top: 40px;">운동 방법</h2>
<!--         <h2 class="wow bounceInRight">HomeWar</h2> -->
        <hr style="max-width: 200px; border-color: white;">
        <p class="wow bounceInRight" data-wow-delay=".25s" style="color: white; max-width: 400px;">상체, 하체, 바디의 부위별 운동법을 구체적으로 지도함으로써 SLIM BODY를 이루실 수 있도록 진심을 다하여 지도합니다.</p>
        
<!--         <h5 class="wow bounceInLeft">NETWORK SUMMER 2017</h5> -->
<!--         <p class="wow bounceInDown">특별 강사 이휘로 강사님 초청 강연 / 대덕 인재 개발원 403호 홍일점 박상영 씨의 초청 공연</p> -->
      </div>
      <div class="col-md-6">
<%--         <figure class="wow bounceInDown"> <img src="<%=request.getContextPath() %>/HW_main/images/about-img.jpg" alt="gym" class="img-fluid" /> </figure> --%>
      </div>
    </div>
  </div>
</div>
<div id="about-us" class="container-fluid fh5co-about-us pl-0 pr-0 parallax-window" data-parallax="scroll" data-image-src="<%=request.getContextPath() %>/HW_main/images/about-us-bg.jpg">
  <div class="container">
    <div class="col-sm-6 offset-sm-6">
      <h2 class="wow bounceInLeft" data-wow-delay=".25s">운동 식단</h2>
      <hr style="max-width: 200px; border-color: white; margin-left: -3px;margin-bottom: 15px; margin-top: 15px;">
      <p class="wow bounceInRight" data-wow-delay=".25s">이미 PERFECT BODY를 이룬 유명인들의 검증된 식단으로 한층 더 완벽한 몸을 만드실 수 있도록 구성되어 있습니다. </p>
<!--       <a href="#" class="btn btn-lg btn-outline-danger d-inline-block text-center mx-auto wow bounceInDown">운동식단</a>  -->
      </div>
  </div>
</div>
<div class="container-fluid fh5co-content-box">
  <div class="container">
    <div class="row">
      <div class="col-md-5 pr-0"><img src="<%=request.getContextPath() %>/HW_main/images/sikdan1.jpg" alt="gym" class="img-fluid wow bounceInLeft" /> </div>
      <div class="col-md-7 pl-0">
        <div class="wow bounceInRight" data-wow-delay=".25s">
          <div class="card-img-overlay">
          </div>
          <img style="height: 300px;" src="<%=request.getContextPath() %>/HW_main/images/pt11.png" alt="girls in gym" class="img-fluid" /> </div>
      </div>
    </div>
    <div class="row trainers pl-0 pr-0">
      <div class="col-12 bg-50">
        <div class="quote-box2 wow bounceInDown" data-wow-delay=".25s">
          <h2> BMI 측정 </h2>
        </div>
      </div>
      <div class="col-md-6 pr-5 pl-5">
      <div style="margin-left: 100px;">
        <div id="bmiTable" style="float: left;">
				<div id="bmiInput1" style="float: left;">
					<div id="bmiInput11">
						<label style="margin-right: 10px;">성별</label>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input style="color:black;" type="radio" id="M" name="gender">
						<label for="M" style="margin-right: 10px;">남자</label>
						&nbsp;&nbsp;&nbsp;
						<input style="color:black;" type="radio" id="F" name="gender">
						<label for="F">여자</label>
						<br><br>
						<label>키(cm)</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input style="color:black;" type="text" id="ke">
						<br><br>
						<label>몸무게(kg)</label>
			 			<input style="color:black;" type="text" id="mo">
						<br><br>
						<label>나이(세)</label>&nbsp;&nbsp;&nbsp;&nbsp;
		 				<input style="color:black;" type="text" id="age">
		 				<br><br>
<!-- 		 				<button style="background-color: white;" type="reset">초기화</button> -->
		 				<button type="button" id="bmicall" style="margin-left: 30px; background-color: #D8D8D8;">계산하기</button>
		 			</div>	
				</div>
				<div id="bmiInput2" style="float: left;">
					<div id="bmiResult1">
						<label>BMI(신체질량지수)</label>
						<br><br>
					
		 				<span id="bmiResult" style="font-size: xx-large;"></span>
		 			
		 				<br>
		 				<img style="width: 550px; height: 450px;" alt="bmiResult" src="<%=request.getContextPath() %>/HW_main/images/bmiResult.png">
					</div>				
				</div>
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
  
</footer>

<!-- 자바스크립트  --> 

<script src="<%=request.getContextPath() %>/HW_main/js/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/HW_main/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath() %>/HW_main/js/parallax.js"></script>
<script src="<%=request.getContextPath() %>/HW_main/js/wow.js"></script>
<script src="<%=request.getContextPath() %>/HW_main/js/main.js"></script>
<script src='<%=request.getContextPath() %>/HW_video/js/plugins.js'></script>
<script src='<%=request.getContextPath() %>/HW_video/js/scripts.js'></script>
<script src='<%=request.getContextPath() %>/HW_video/js/masonry.pkgd.min.js'></script>
<script src='<%=request.getContextPath() %>/HW_video/js/bmi.js'></script>

</body>
</html>