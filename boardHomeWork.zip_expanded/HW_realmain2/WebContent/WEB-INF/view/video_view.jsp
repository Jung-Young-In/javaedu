<%@page import="kr.or.ddit.video.vo.VideoVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	List<VideoVO> videoList = (List<VideoVO>) request.getAttribute("videoList");
    %>
    
<!DOCTYPE html>
<html lang="en-US">

<head>
  <!-- Required meta tags -->
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Project HW</title>
<link  type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/HW_video/css/video.css"/>
<script src='<%=request.getContextPath() %>/HW_video/js/jquery.js'></script>
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
	  $("#videoSearch").click(function(){
			
			// 서버로 전달할 데이터 만들기
			var videoKey = $("#VideoKeyWard").val();
			var key = "videoSearch.do?videoKey=" + videoKey;
			$("#videoKeyInput").attr("href", key);
		});
	  
	  
} );
</script>
<style type="text/css">
#exDetail{
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

.bounce{
	color: orange;
	font-family: sans-serif;
}

hr{
	margin-left: -5px;
}

#exerDetail{
	font-size: medium;
	max-width: 700px;
}

.exTitle{
	margin-top: -20px;
	margin-bottom: 20px;
	margin-left: -10px;
}

.exTitle h2{
	margin-top: 30px;
	color: orange;
}

#exeDetail11{
	margin-top: -23px;
	margin-left: 20px;
	text-align: left;
}

#exeDetail22{
	margin-top: 10px;
	margin-left: 20px;
	text-align: left;
}

#exeDetail33{
	margin-top: 85px;
	margin-left: 20px;
	text-align: left;
}

#exeDetail44{
	margin-top: 170px;
	margin-left: 20px;
	text-align: left;
}

#exeDetail55{
	margin-top: 225px;
	margin-left: 20px;
	text-align: left;
}

#exeDetail66{
	margin-top: 270px;
	margin-left: 20px;
	text-align: left;
}

#exeDetail77{
	margin-top: 354px;
	margin-left: 20px;
	text-align: left;
}

#exeDetail88{
	margin-top: 400px;
	margin-left: 20px;
	text-align: left;
}

#ptVideo{
	margin-top: 55px;
	margin-left: 40px;
}

#videoField{
	margin-left: 130px;
}
</style>
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/HW_main/css/animate.css" >
	<link rel="stylesheet" href="<%=request.getContextPath() %>/HW_main/css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:300,400,700" >
	<link rel="stylesheet" href="<%=request.getContextPath() %>/HW_main/css/style.css">
</head>
<script src='<%=request.getContextPath() %>/HW_video/js/jquery-3.6.0.js'></script>
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
          		<a class="nav-link" href="<%=request.getContextPath() %>/HW/board/list.do">게시판</a> 
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
			<figure class="wow bounceInDown"> <img style="width: 700px; height: 600px; margin-left: 200px; margin-top: -300px; margin-bottom: -180px;" src="<%=request.getContextPath() %>/HW_main/images/mainBan1.png" alt="gym" class="img-fluid" /> </figure>
		</div>
<!--       </div> -->
	<div style="margin-left: 220px;">
      <a href="<%=request.getContextPath() %>/HW/video/video.do?videoName=<%="상체"%>" class="btn text-uppercase btn-outline-danger btn-lg mr-3 mb-3 wow bounceInUp"> 상체 </a> 
      <a href="<%=request.getContextPath() %>/HW/video/video.do?videoName=<%="하체"%>" class="btn text-uppercase btn-outline-danger btn-lg mb-3 wow bounceInRight"> 하체</a>
      <a style="margin-left: 10px;" href="<%=request.getContextPath() %>/HW/video/video.do?videoName=<%="복근"%>" class="btn text-uppercase btn-outline-danger btn-lg mr-3 mb-3 wow bounceInUp"> 복근 </a> 
      <a href="<%=request.getContextPath() %>/HW/video/video.do?videoName=<%="허리"%>" class="btn text-uppercase btn-outline-danger btn-lg mb-3 wow bounceInRight"> 허리</a> </div>
    </div>
      	<div style="margin-top: 50px; margin-bottom: -20px;">
	      <form id="videoFm" style="margin-left: 150px;">
			<input style="font-size: medium; border-color: orange;" id="VideoKeyWard" name="searchVideo" type="text">
			<a id="videoKeyInput" href="">
				<button id="videoSearch" type="button" style="background-color: white; border-color: orange;">
					<img style="width: 20px; height: 25px;" src="<%=request.getContextPath() %>/HW_video/IMG/search.jpg">
				</button>
			</a>
		  </form>
		</div>
  </div>
</div>

<div class="container-fluid fh5co-network11" style="margin-top:-30px; width: 1246px; height: 360px;">
  <div class="container">
    
      <div class="col-md-6">
      		<fieldset id="videoField" style="width: 888px;">	
				<%
						for(int i = 0; i < videoList.size(); i++){
				%>
							<fieldset id="ptVideo">
							<iframe width="300" height="200"
									src="https://www.youtube.com/embed/<%=videoList.get(i).getVideoPath()%>" title="YouTube video player" frameborder="0"
							allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
							allowfullscreen></iframe><br>
							<span style="color: white; font-size: 15px;"><%=videoList.get(i).getVideoContent()%></span>
							</fieldset>
				<%					
						}
				%>
				</fieldset>	
      </div>

  </div>
</div>
<div class="container-fluid fh5co-network22" style="width: 1246px; height: 360px;">
  <div class="container">
    <div class="row">
      <div class="col-md-6">
      </div>
    </div>
  </div>
</div>
<div class="container-fluid fh5co-network33" style="width: 1246px; height: 360px;">
  <div class="container">
    <div class="row">
      <div class="col-md-6">
      </div>
    </div>
  </div>
</div>
<div class="container-fluid fh5co-network44" style="width: 1246px; height: 360px;">
  <div class="container">
    <div class="row">
      <div class="col-md-6">
      </div>
    </div>
  </div>
</div>
<div class="container-fluid fh5co-network55" style="width: 1246px; height: 360px;">
  <div class="container">
    <div class="row">
      <div class="col-md-6">
      </div>
    </div>
  </div>
</div>
<div class="container-fluid fh5co-content-box pl-0 pr-0 parallax-window">
  <div class="container">
    <div class="row">
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
<script src='<%=request.getContextPath() %>/HW_video/js/plugins.js'></script>
<script src='<%=request.getContextPath() %>/HW_video/js/scripts.js'></script>
<script src='<%=request.getContextPath() %>/HW_video/js/masonry.pkgd.min.js'></script>

</body>
</html>