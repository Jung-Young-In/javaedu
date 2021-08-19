<%@page import="kr.or.ddit.exerfood.vo.FoodVO"%>
<%@page import="kr.or.ddit.exerfood.vo.ExerVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
// 	    if (session.getAttribute("signedUser") != null) {
// 	        String redirectUrl = request.getContextPath()+"/HW/main/mainlogin.do";
// 	      response.sendRedirect(redirectUrl); 
// 	    } 
    
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
</style>
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/HW_main/css/animate.css" >
	<link rel="stylesheet" href="<%=request.getContextPath() %>/HW_main/css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:300,400,700" >
	<link rel="stylesheet" href="<%=request.getContextPath() %>/HW_main/css/style.css">
</head>
<script src='<%=request.getContextPath() %>/HW_video/js/jquery-3.6.0.js'></script>
<script type="text/javascript">
	function ex1( ){
		if($("#exeDetail1").css("display") == "none"){   
			$('#exeDetail1').show();  
			$('span').not('#exeDetail1').hide();  
		} else {  
			$('#exeDetail1').hide();  
			$('span').not('#exeDetail1').hide();  
		}
	}
	function ex2( ){
		if($("#exeDetail2").css("display") == "none"){   
			$('#exeDetail2').show();  
			$('span').not('#exeDetail2').hide();
		} else {  
			$('#exeDetail2').hide();  
			$('span').not('#exeDetail2').hide();
		}
	}
	function ex3( ){
		if($("#exeDetail3").css("display") == "none"){   
			$('#exeDetail3').show();  
			$('span').not('#exeDetail3').hide();
		} else {  
			$('#exeDetail3').hide();  
			$('span').not('#exeDetail3').hide();
		}
	}
	function ex4( ){
		if($("#exeDetail4").css("display") == "none"){   
			$('#exeDetail4').show();  
			$('span').not('#exeDetail4').hide();
		} else {  
			$('#exeDetail4').hide();  
			$('span').not('#exeDetail4').hide();
		}
	}
	function ex5( ){
		if($("#exeDetail5").css("display") == "none"){   
			$('#exeDetail5').show();  
			$('span').not('#exeDetail5').hide();
		} else {  
			$('#exeDetail5').hide();  
			$('span').not('#exeDetail5').hide();
		}
	}
	function ex6( ){
		if($("#exeDetail6").css("display") == "none"){   
			$('#exeDetail6').show();  
			$('span').not('#exeDetail6').hide();
		} else {  
			$('#exeDetail6').hide();
			$('span').not('#exeDetail6').hide();
		}
	}
	function ex7( ){
		if($("#exeDetail3").css("display") == "none"){   
			$('#exeDetail7').show();  
			$('span').not('#exeDetail7').hide();
		} else {  
			$('#exeDetail7').hide(); 
			$('span').not('#exeDetail7').hide();
		}
	}
	function ex8( ){
		if($("#exeDetail3").css("display") == "none"){   
			$('#exeDetail8').show();  
			$('span').not('#exeDetail8').hide();
		} else {  
			$('#exeDetail8').hide();
			$('span').not('#exeDetail8').hide();
		}
	}
	
	  
	  
</script>
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
<!--    				<ul class="sub-menu"> -->
<%-- 		           <li><a href="<%=request.getContextPath() %>/HW/video/bmi.do">BMI 계산기</a></li> --%>
<!-- 		           <li><a href="#">운동 게시판</a></li> -->
<%-- 		           <li><a href="<%=request.getContextPath() %>/HW/video/video.do">운동 동영상</a></li> --%>
<%-- 		           <li><a href="<%=request.getContextPath() %>/HW/video/exerfood.do">운동/식단</a></li> --%>
<!--   			   </ul> -->
          </li>
          <li class="nav-item"> 
          		<a class="nav-link" href="<%=request.getContextPath() %>/HW/prod/list.do">쇼핑몰</a> 
<!--           			<ul class="sub-menu"> -->
<%-- 		               <li><a href="<%=request.getContextPath() %>/HW/prod/categoriSelect.do?prodCategori=1">운동 기구</a></li> --%>
<%-- 		               <li><a href="<%=request.getContextPath() %>/HW/prod/categoriSelect.do?prodCategori=2">보조 식품</a></li> --%>
<!-- 		               <li><a href="#">배송 문의</a></li> -->
<!-- 		               <li><a href="#">상품 문의</a></li> -->
<!--            			 </ul> -->
          </li>
          <li class="nav-item"> 
          		<a class="nav-link" href="<%=request.getContextPath() %>/HW/notice/list.do">게시판</a> 
<!--           		<ul class="sub-menu"> -->
<!--               	 	<li><a href="#l">공지 사항</a></li> -->
<!--                		<li><a href="#">Q & A</a></li> -->
<!--             	</ul> -->
          </li>
          <li class="nav-item"> 
          		<a class="nav-link" href="<%=request.getContextPath() %>/HW/pay/memberex.do">멤버쉽</a>
<!--           		<ul class="sub-menu"> -->
<!--                <li><a href="#">멤버쉽 소개</a></li> -->
<!--                <li><a href="#">멤버쉽 결제</a></li> -->
<!--             </ul> -->
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
			<figure class="wow bounceInDown"> <img style="width: 700px; height: 600px; margin-left: -130px; margin-top: -300px; margin-bottom: -180px;" src="<%=request.getContextPath() %>/HW_main/images/mainBan1.png" alt="gym" class="img-fluid" /> </figure>
		</div>
<!--       </div> -->
      <a href="<%=request.getContextPath() %>/HW/video/exerfood.do" class="btn text-uppercase btn-outline-danger btn-lg mr-3 mb-3 wow bounceInUp"> 운동방법 </a> <a href="<%=request.getContextPath() %>/HW/video/exerSikdan.do" class="btn text-uppercase btn-outline-danger btn-lg mb-3 wow bounceInRight"> 식단</a> </div>
  </div>
</div>

<div class="container-fluid fh5co-network1" style="border: 1px solid gray; border-radius: 7px; width: 1232px; height: 360px;">
  <div class="container">
    <div class="row">
      <div class="col-md-6" style="margin-top: 25px;">
        <h2 class="wow bounce" style="margin-top: 40px;">상체 운동</h2>
        <hr style="max-width: 200px; border-top: 2px solid white;">
        <p class="wow bounceInRight" data-wow-delay=".25s" style="color: white; max-width: 500px;">상체 운동은 어깨와 팔 그리고 가슴 부위별로 분류하여 지도합니다.</p>
        <a href="#upper" class="btn btn-lg btn-outline-danger d-inline-block text-center mx-auto wow bounceInDown" style="border-color: orange; color: white; border-radius: 0px; margin-top: 35px;">DETAIL</a>
      </div>
      <div class="col-md-6">
      </div>
    </div>
  </div>
</div>
<div class="container-fluid fh5co-network2" style="width: 1232px; height: 360px;">
  <div class="container">
    <div class="row">
      <div class="col-sm-6 offset-sm-6" style="margin-top: 40px;">
        <h2 class="wow bounce">하체 운동</h2>
        <hr style="max-width: 200px; border-top: 2px solid white;">
        <p class="wow bounceInRight" data-wow-delay=".25s" style="color: white; max-width: 500px;">하체 운동은 허벅지와 다리 그리고 발목 부위별로 분류하여 지도합니다.</p>
        <a href="#middle" class="btn btn-lg btn-outline-danger d-inline-block text-center mx-auto wow bounceInDown" style="border-color: orange; color: white; border-radius: 0px; margin-top: 35px;">DETAIL</a> 
      </div>
      <div class="col-md-6">
      </div>
    </div>
  </div>
</div>
<div class="container-fluid fh5co-network3" style="width: 1232px; height: 360px;">
  <div class="container">
    <div class="row">
      <div class="col-md-6" style="margin-top: 20px;">
        <h2 class="wow bounce" style="margin-top: 40px;">바디 운동</h2>
        <hr style="max-width: 200px; border-top: 2px solid white;">
        <p class="wow bounceInRight" data-wow-delay=".25s" style="color: white; max-width: 400px;">바디 운동은 복근과 허리 부위별로 분류하여 지도합니다.</p>
        <a href="#under" class="btn btn-lg btn-outline-danger d-inline-block text-center mx-auto wow bounceInDown" style="border-color: orange; color: white; border-radius: 0px; margin-top: 35px;">DETAIL</a> 
      </div>
      <div class="col-md-6">
      </div>
    </div>
  </div>
</div>
<div class="container-fluid fh5co-content-box pl-0 pr-0 parallax-window">
  <div class="container">
    <div class="row">
    <div id="detail" class="row trainers pl-0 pr-0">
      <div class="col-12 bg-50">
        <div class="quote-box2 wow bounceInDown" data-wow-delay=".25s">
          <h2> DETAIL </h2>
        </div>
      </div>
      <div class="col-md-6 pr-5 pl-5">
      <div style="margin-left: 100px;">
        <div id="exDetail" style="float: left;">
			<div id="exerContent">
				<div id="detail" style="float: left;">
					<div id="upper">
						<fieldset class="exTitle">
							<h2 style="float: left; margin-right: 15px; margin-top: 55px;">상체</h2>
							<div style="float: left; margin-top: 5px; margin-left: 10px;">
								<a id="exe1" onclick="ex1()">어깨운동</a><br><br>
								<a id="exe2" onclick="ex2()">팔운동</a><br><br>
								<a id="exe3" onclick="ex3()">가슴운동</a><br><br>
							</div>
						</fieldset>
					</div>
					<div id="middle">
						<fieldset class="exTitle">
							<h2 style="float: left; margin-right: 15px; margin-top: 50px;">하체</h2>
							<div style="float: left; margin-top: 5px;">
								<a id="exe4" onclick="ex4()">허벅지운동</a><br><br>
								<a id="exe5" onclick="ex5()">다리운동</a><br><br>
								<a id="exe6" onclick="ex6()">발목운동</a><br><br>
							</div>
						</fieldset>
					</div>
					<div id="under">
						<fieldset class="exTitle">
							<h2 style="float: left; margin-right: 30px; margin-left: 15px;">몸</h2>
							<div style="float: left; margin-top: 15px; margin-left: 10px;">
								<a id="exe7" onclick="ex7()">복근운동</a><br><br>
								<a id="exe8" onclick="ex8()">허리운동</a><br><br>
							</div>
						</fieldset>
					</div>
				</div>
				<fieldset id="exerDetail" style="float: left;">
				
					<div id="exeDetail11">			
					    <span id="exeDetail1" style="display: none; margin-top: -40px;"><%=exerList.get(0).getExeContent() %></span>
					</div>
					<div id="exeDetail22">
					    <span id="exeDetail2" style="display: none;"><%=exerList.get(1).getExeContent() %></span>
					</div>
					<div id="exeDetail33">   
					    <span id="exeDetail3" style="display: none;"><%=exerList.get(2).getExeContent() %></span>
					</div>    
					<div id="exeDetail44">   
					    <span id="exeDetail4" style="display: none;"><%=exerList.get(3).getExeContent() %></span>
					</div>    
					<div id="exeDetail55">
					    <span id="exeDetail5" style="display: none;"><%=exerList.get(4).getExeContent() %></span>
					</div>
					<div id="exeDetail66">
					    <span id="exeDetail6" style="display: none;"><%=exerList.get(5).getExeContent() %></span>
					</div>
					<div id="exeDetail77">   
					    <span id="exeDetail7" style="display: none;"><%=exerList.get(6).getExeContent() %></span>
					</div>
					<div id="exeDetail88">
					    <span id="exeDetail8" style="display: none;"><%=exerList.get(7).getExeContent() %></span>
					</div>    
					    
				</fieldset>
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