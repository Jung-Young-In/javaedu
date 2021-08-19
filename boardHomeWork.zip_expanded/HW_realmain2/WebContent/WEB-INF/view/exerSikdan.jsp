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
	margin-left: -40px;
}

.exTitle h2{
	margin-top: 30px;
	color: orange;
}

/* #exeDetail11{ */
/* 	margin-top: -23px; */
/* 	margin-left: 20px; */
/* 	text-align: left; */
/* } */

/* #exeDetail22{ */
/* 	margin-top: 10px; */
/* 	margin-left: 20px; */
/* 	text-align: left; */
/* } */

/* #exeDetail33{ */
/* 	margin-top: 85px; */
/* 	margin-left: 20px; */
/* 	text-align: left; */
/* } */

/* #exeDetail44{ */
/* 	margin-top: 170px; */
/* 	margin-left: 20px; */
/* 	text-align: left; */
/* } */

/* #exeDetail55{ */
/* 	margin-top: 225px; */
/* 	margin-left: 20px; */
/* 	text-align: left; */
/* } */

/* #exeDetail66{ */
/* 	margin-top: 270px; */
/* 	margin-left: 20px; */
/* 	text-align: left; */
/* } */

/* #exeDetail77{ */
/* 	margin-top: 354px; */
/* 	margin-left: 20px; */
/* 	text-align: left; */
/* } */

/* #exeDetail88{ */
/* 	margin-top: 400px; */
/* 	margin-left: 20px; */
/* 	text-align: left; */
/* } */

table {
	margin-top: 50px;
	margin-left: 100px;
	width: 500px;
	height: 300px;
	border-radius: 5px;
}

th, tr, td{
	border: 3px solid orange;
	border-radius: 5px;
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
			$('table').not('#exeDetail1').hide();  
		} else {  
			$('#exeDetail1').hide();  
			$('table').not('#exeDetail1').hide();  
		}
	}
	function ex2( ){
		if($("#exeDetail2").css("display") == "none"){   
			$('#exeDetail2').show();  
			$('table').not('#exeDetail2').hide();
		} else {  
			$('#exeDetail2').hide();  
			$('table').not('#exeDetail2').hide();
		}
	}
	function ex3( ){
		if($("#exeDetail3").css("display") == "none"){   
			$('#exeDetail3').show();  
			$('table').not('#exeDetail3').hide();
		} else {  
			$('#exeDetail3').hide();  
			$('table').not('#exeDetail3').hide();
		}
	}
	function ex4( ){
		if($("#exeDetail4").css("display") == "none"){   
			$('#exeDetail4').show();  
			$('table').not('#exeDetail4').hide();
		} else {  
			$('#exeDetail4').hide();  
			$('table').not('#exeDetail4').hide();
		}
	}
	function ex5( ){
		if($("#exeDetail5").css("display") == "none"){   
			$('#exeDetail5').show();  
			$('table').not('#exeDetail5').hide();
		} else {  
			$('#exeDetail5').hide();  
			$('table').not('#exeDetail5').hide();
		}
	}
	function ex6( ){
		if($("#exeDetail6").css("display") == "none"){   
			$('#exeDetail6').show();  
			$('table').not('#exeDetail6').hide();
		} else {  
			$('#exeDetail6').hide();
			$('table').not('#exeDetail6').hide();
		}
	}
	function ex7( ){
		if($("#exeDetail7").css("display") == "none"){   
			$('#exeDetail7').show();  
			$('table').not('#exeDetail7').hide();
		} else {  
			$('#exeDetail7').hide(); 
			$('table').not('#exeDetail7').hide();
		}
	}
	function ex8( ){
		if($("#exeDetail8").css("display") == "none"){   
			$('#exeDetail8').show();  
			$('table').not('#exeDetail8').hide();
		} else {  
			$('#exeDetail8').hide();
			$('table').not('#exeDetail8').hide();
		}
	}
	function ex9( ){
		if($("#exeDetail9").css("display") == "none"){   
			$('#exeDetail9').show();  
			$('table').not('#exeDetail9').hide();
		} else {  
			$('#exeDetail8').hide();
			$('table').not('#exeDetail9').hide();
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
      <a href="<%=request.getContextPath() %>/HW/video/exerfood.do" class="btn text-uppercase btn-outline-danger btn-lg mr-3 mb-3 wow bounceInUp"> 운동방법 </a> <a href="<%=request.getContextPath() %>/HW/video/exerSikdan.do" class="btn text-uppercase btn-outline-danger btn-lg mb-3 wow bounceInDown"> 식단</a> </div>
  </div>
</div>

<div class="container-fluid fh5co-network1" style="border: 1px solid gray; border-radius: 7px; width: 1232px; height: 360px;">
  <div class="container">
    <div class="row">
      <div class="col-md-6" style="margin-top: 25px;">
        <h2 class="wow bounce" style="margin-top: 40px;">박신혜 식단표</h2>
        <hr style="max-width: 200px; border-top: 2px solid white;">
        <p class="wow bounceInRight" data-wow-delay=".25s" style="color: white; max-width: 500px;">몸이 잘 붓는다는 배우 박신혜가 항상 반전 몸매를 유지하는 비결인 식단표 정보를 제공합니다. </p>
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
        <h2 class="wow bounce">김연아 식단표</h2>
        <hr style="max-width: 200px; border-top: 2px solid white;">
        <p class="wow bounceInRight" data-wow-delay=".25s" style="color: white; max-width: 500px;">영원한 피겨스케이팅 요정인 선수 김연아의 변함없는 몸매를 유지하는 비결인 식단표 정보를 제공합니다.</p>
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
        <h2 class="wow bounce" style="margin-top: 40px;">태연 식단표</h2>
        <hr style="max-width: 200px; border-top: 2px solid white;">
        <p class="wow bounceInRight" data-wow-delay=".25s" style="color: white; max-width: 500px;">소녀시대에서 톡톡히 비주얼 역할을 담당하며 몸매를 유지할 수 있었던 비결인 식단표를 제공합니다.</p>
        <a href="#under" class="btn btn-lg btn-outline-danger d-inline-block text-center mx-auto wow bounceInDown" style="border-color: orange; color: white; border-radius: 0px; margin-top: 35px;">DETAIL</a> 
      </div>
      <div class="col-md-6">
      </div>
    </div>
  </div>
</div>
<div class="container-fluid fh5co-content-box1 pl-0 pr-0 parallax-window">
  <div class="container">
    <div class="row">
    <div id="detail" class="row trainers pl-0 pr-0" style="height: 660px;">
      <div class="col-12 bg-50">
        <div class="quote-box2 wow bounceInDown" data-wow-delay=".25s">
<!--           <h2 style="color: orange;"> DETAIL </h2> -->
        </div>
      </div>
      <div class="col-md-6 pr-5 pl-5">
      <div style="margin-left: 100px;">
        <div id="exDetail" style="float: left;">
			<div id="exerContent" style="align-items: center;">
				<div id="detail" style="float: left;">
					<div id="upper">
						<fieldset class="exTitle">
							<h2 style="float: left; margin-right: 15px; margin-top: 55px;">박신혜 식단표</h2>
							<div style="float: left; margin-top: 5px; margin-left: 10px;">
								<a id="exe1" onclick="ex1()">아침</a><br><br>
								<a id="exe2" onclick="ex2()">점심</a><br><br>
								<a id="exe3" onclick="ex3()">저녁</a><br><br>
							</div>
						</fieldset>
					</div>
					<div id="middle">
						<fieldset class="exTitle">
							<h2 style="float: left; margin-right: 15px; margin-top: 50px;">김연아 식단표</h2>
							<div style="float: left; margin-top: 5px; margin-left: 10px;">
								<a id="exe4" onclick="ex4()">아침</a><br><br>
								<a id="exe5" onclick="ex5()">점심</a><br><br>
								<a id="exe6" onclick="ex6()">저녁</a><br><br>
							</div>
						</fieldset>
					</div>
					<div id="under">
						<fieldset class="exTitle">
							<h2 style="float: left; margin-right: 30px; margin-left: 15px; margin-top: 48px;">태연 식단표</h2>
							<div style="float: left; margin-left: 12px;">
								<a id="exe7" onclick="ex7()">아침</a><br><br>
								<a id="exe8" onclick="ex8()">점심</a><br><br>
								<a id="exe9" onclick="ex9()">저녁</a><br><br>
							</div>
						</fieldset>
					</div>
				</div>
				<fieldset id="exerDetail" style="float: left;">
				
					<div id="exeDetail11">			
					    <div>
					    	<table id="exeDetail1" style="display: none;">
								<tr>
									<th style="width: 75px;">이름</th>
									<th>칼로리</th>
									<th>지방</th>
									<th>단백질</th>
									<th>탄수화물</th>
									<th>당</th>
								</tr>
								<tr>
									<td><%=foodList.get(1).getFoodName() %></td>
									<td><%=foodList.get(1).getFoodKcal() %>kcal</td>
									<td><%=foodList.get(1).getFoodFat() %>g</td>
									<td><%=foodList.get(1).getFoodProtein() %>g</td>
									<td><%=foodList.get(1).getFoodRice() %>g</td>
									<td><%=foodList.get(1).getFoodSweet() %>g</td>
								</tr>
								<tr>
									<td><%=foodList.get(2).getFoodName() %></td>
									<td><%=foodList.get(2).getFoodKcal() %>kcal</td>
									<td><%=foodList.get(2).getFoodFat() %>g</td>
									<td><%=foodList.get(2).getFoodProtein() %>g</td>
									<td><%=foodList.get(2).getFoodRice() %>g</td>
									<td><%=foodList.get(2).getFoodSweet() %>g</td>
								</tr>
								<tr>
									<td><%=foodList.get(3).getFoodName() %></td>
									<td><%=foodList.get(3).getFoodKcal() %>kcal</td>
									<td><%=foodList.get(3).getFoodFat() %>g</td>
									<td><%=foodList.get(3).getFoodProtein() %>g</td>
									<td><%=foodList.get(3).getFoodRice() %>g</td>
									<td><%=foodList.get(3).getFoodSweet() %>g</td>
								</tr>
							</table>
					    </div>
					</div>
					<div id="exeDetail22">
					    <div>
					    	<table  id="exeDetail2" style="display: none;">
								<tr>
									<th style="width: 75px;">이름</th>
									<th>칼로리</th>
									<th>지방</th>
									<th>단백질</th>
									<th>탄수화물</th>
									<th>당</th>
								</tr>
								<tr>
									<td><%=foodList.get(2).getFoodName() %></td>
									<td><%=foodList.get(2).getFoodKcal() %>kcal</td>
									<td><%=foodList.get(2).getFoodFat() %>g</td>
									<td><%=foodList.get(2).getFoodProtein() %>g</td>
									<td><%=foodList.get(2).getFoodRice() %>g</td>
									<td><%=foodList.get(2).getFoodSweet() %>g</td>
								</tr>
								<tr>
									<td><%=foodList.get(6).getFoodName() %></td>
									<td><%=foodList.get(6).getFoodKcal() %>kcal</td>
									<td><%=foodList.get(6).getFoodFat() %>g</td>
									<td><%=foodList.get(6).getFoodProtein() %>g</td>
									<td><%=foodList.get(6).getFoodRice() %>g</td>
									<td><%=foodList.get(6).getFoodSweet() %>g</td>
								</tr>
							</table>
					    </div>
					</div>
					<div id="exeDetail33">   
					    <div>
					    	<table id="exeDetail3" style="display: none;">
								<tr>
									<th style="width: 75px;">이름</th>
									<th>칼로리</th>
									<th>지방</th>
									<th>단백질</th>
									<th>탄수화물</th>
									<th>당</th>
								</tr>
								<tr>
									<td><%=foodList.get(2).getFoodName() %></td>
									<td><%=foodList.get(2).getFoodKcal() %>kcal</td>
									<td><%=foodList.get(2).getFoodFat() %>g</td>
									<td><%=foodList.get(2).getFoodProtein() %>g</td>
									<td><%=foodList.get(2).getFoodRice() %>g</td>
									<td><%=foodList.get(2).getFoodSweet() %>g</td>
								</tr>
								<tr>
									<td><%=foodList.get(6).getFoodName() %></td>
									<td><%=foodList.get(6).getFoodKcal() %>kcal</td>
									<td><%=foodList.get(6).getFoodFat() %>g</td>
									<td><%=foodList.get(6).getFoodProtein() %>g</td>
									<td><%=foodList.get(6).getFoodRice() %>g</td>
									<td><%=foodList.get(6).getFoodSweet() %>g</td>
								</tr>
								<tr>
									<td><%=foodList.get(0).getFoodName() %></td>
									<td><%=foodList.get(0).getFoodKcal() %>kcal</td>
									<td><%=foodList.get(0).getFoodFat() %>g</td>
									<td><%=foodList.get(0).getFoodProtein() %>g</td>
									<td><%=foodList.get(0).getFoodRice() %>g</td>
									<td><%=foodList.get(0).getFoodSweet() %>g</td>
								</tr>
							</table>
					    </div>
					</div>    
					<div id="exeDetail44">   
					    <div>
					    	<table id="exeDetail4" style="display: none;">
								<tr>
									<th style="width: 75px;">이름</th>
									<th>칼로리</th>
									<th>지방</th>
									<th>단백질</th>
									<th>탄수화물</th>
									<th>당</th>
								</tr>
								<tr>
									<td><%=foodList.get(12).getFoodName() %></td>
									<td><%=foodList.get(12).getFoodKcal() %>kcal</td>
									<td><%=foodList.get(12).getFoodFat() %>g</td>
									<td><%=foodList.get(12).getFoodProtein() %>g</td>
									<td><%=foodList.get(12).getFoodRice() %>g</td>
									<td><%=foodList.get(12).getFoodSweet() %>g</td>
								</tr>
								<tr>
									<td><%=foodList.get(7).getFoodName() %></td>
									<td><%=foodList.get(7).getFoodKcal() %>kcal</td>
									<td><%=foodList.get(7).getFoodFat() %>g</td>
									<td><%=foodList.get(7).getFoodProtein() %>g</td>
									<td><%=foodList.get(7).getFoodRice() %>g</td>
									<td><%=foodList.get(7).getFoodSweet() %>g</td>
								</tr>
								<tr>
									<td><%=foodList.get(8).getFoodName() %></td>
									<td><%=foodList.get(8).getFoodKcal() %>kcal</td>
									<td><%=foodList.get(8).getFoodFat() %>g</td>
									<td><%=foodList.get(8).getFoodProtein() %>g</td>
									<td><%=foodList.get(8).getFoodRice() %>g</td>
									<td><%=foodList.get(8).getFoodSweet() %>g</td>
								</tr>
								<tr>
									<td><%=foodList.get(10).getFoodName() %></td>
									<td><%=foodList.get(10).getFoodKcal() %>kcal</td>
									<td><%=foodList.get(10).getFoodFat() %>g</td>
									<td><%=foodList.get(10).getFoodProtein() %>g</td>
									<td><%=foodList.get(10).getFoodRice() %>g</td>
									<td><%=foodList.get(10).getFoodSweet() %>g</td>
								</tr>
							</table>
					    </div>
					</div>    
					<div id="exeDetail55">
					    <div>
					    	<table id="exeDetail5" style="display: none;">
								<tr>
									<th style="width: 75px;">이름</th>
									<th>칼로리</th>
									<th>지방</th>
									<th>단백질</th>
									<th>탄수화물</th>
									<th>당</th>
								</tr>
								<tr>
									<td><%=foodList.get(5).getFoodName() %></td>
									<td><%=foodList.get(5).getFoodKcal() %>kcal</td>
									<td><%=foodList.get(5).getFoodFat() %>g</td>
									<td><%=foodList.get(5).getFoodProtein() %>g</td>
									<td><%=foodList.get(5).getFoodRice() %>g</td>
									<td><%=foodList.get(5).getFoodSweet() %>g</td>
								</tr>
								<tr>
									<td><%=foodList.get(10).getFoodName() %></td>
									<td><%=foodList.get(10).getFoodKcal() %>kcal</td>
									<td><%=foodList.get(10).getFoodFat() %>g</td>
									<td><%=foodList.get(10).getFoodProtein() %>g</td>
									<td><%=foodList.get(10).getFoodRice() %>g</td>
									<td><%=foodList.get(10).getFoodSweet() %>g</td>
								</tr>
							</table>
					    </div>
					</div>
					<div id="exeDetail66">
					    <div>
					    	<table id="exeDetail6" style="display: none;">
								<tr>
									<th style="width: 75px;">이름</th>
									<th>칼로리</th>
									<th>지방</th>
									<th>단백질</th>
									<th>탄수화물</th>
									<th>당</th>
								</tr>
								<tr>
									<td><%=foodList.get(5).getFoodName() %></td>
									<td><%=foodList.get(5).getFoodKcal() %>kcal</td>
									<td><%=foodList.get(5).getFoodFat() %>g</td>
									<td><%=foodList.get(5).getFoodProtein() %>g</td>
									<td><%=foodList.get(5).getFoodRice() %>g</td>
									<td><%=foodList.get(5).getFoodSweet() %>g</td>
								</tr>
								<tr>
									<td><%=foodList.get(11).getFoodName() %></td>
									<td><%=foodList.get(11).getFoodKcal() %>kcal</td>
									<td><%=foodList.get(11).getFoodFat() %>g</td>
									<td><%=foodList.get(11).getFoodProtein() %>g</td>
									<td><%=foodList.get(11).getFoodRice() %>g</td>
									<td><%=foodList.get(11).getFoodSweet() %>g</td>
								</tr>
							</table>
					    </div>
					</div>
					<div id="exeDetail77">   
					    <div>
					    	<table id="exeDetail7" style="display: none;">
								<tr>
									<th style="width: 75px;">이름</th>
									<th>칼로리</th>
									<th>지방</th>
									<th>단백질</th>
									<th>탄수화물</th>
									<th>당</th>
								</tr>
								<tr>
									<td><%=foodList.get(2).getFoodName() %></td>
									<td><%=foodList.get(2).getFoodKcal() %>kcal</td>
									<td><%=foodList.get(2).getFoodFat() %>g</td>
									<td><%=foodList.get(2).getFoodProtein() %>g</td>
									<td><%=foodList.get(2).getFoodRice() %>g</td>
									<td><%=foodList.get(2).getFoodSweet() %>g</td>
								</tr>
								<tr>
									<td><%=foodList.get(3).getFoodName() %></td>
									<td><%=foodList.get(3).getFoodKcal() %>kcal</td>
									<td><%=foodList.get(3).getFoodFat() %>g</td>
									<td><%=foodList.get(3).getFoodProtein() %>g</td>
									<td><%=foodList.get(3).getFoodRice() %>g</td>
									<td><%=foodList.get(3).getFoodSweet() %>g</td>
								</tr>
								<tr>
									<td><%=foodList.get(13).getFoodName() %></td>
									<td><%=foodList.get(13).getFoodKcal() %>kcal</td>
									<td><%=foodList.get(13).getFoodFat() %>g</td>
									<td><%=foodList.get(13).getFoodProtein() %>g</td>
									<td><%=foodList.get(13).getFoodRice() %>g</td>
									<td><%=foodList.get(13).getFoodSweet() %>g</td>
								</tr>
								<tr>
									<td><%=foodList.get(14).getFoodName() %></td>
									<td><%=foodList.get(14).getFoodKcal() %>kcal</td>
									<td><%=foodList.get(14).getFoodFat() %>g</td>
									<td><%=foodList.get(14).getFoodProtein() %>g</td>
									<td><%=foodList.get(14).getFoodRice() %>g</td>
									<td><%=foodList.get(14).getFoodSweet() %>g</td>
								</tr>
							</table>
					    </div>
					</div>
					<div id="exeDetail88">
					    <div>
					    	<table id="exeDetail8" style="display: none;">
								<tr>
									<th style="width: 75px;">이름</th>
									<th>칼로리</th>
									<th>지방</th>
									<th>단백질</th>
									<th>탄수화물</th>
									<th>당</th>
								</tr>
								<tr>
									<td><%=foodList.get(2).getFoodName() %></td>
									<td><%=foodList.get(2).getFoodKcal() %>kcal</td>
									<td><%=foodList.get(2).getFoodFat() %>g</td>
									<td><%=foodList.get(2).getFoodProtein() %>g</td>
									<td><%=foodList.get(2).getFoodRice() %>g</td>
									<td><%=foodList.get(2).getFoodSweet() %>g</td>
								</tr>
								<tr>
									<td><%=foodList.get(3).getFoodName() %></td>
									<td><%=foodList.get(3).getFoodKcal() %>kcal</td>
									<td><%=foodList.get(3).getFoodFat() %>g</td>
									<td><%=foodList.get(3).getFoodProtein() %>g</td>
									<td><%=foodList.get(3).getFoodRice() %>g</td>
									<td><%=foodList.get(3).getFoodSweet() %>g</td>
								</tr>
								<tr>
									<td><%=foodList.get(4).getFoodName() %></td>
									<td><%=foodList.get(4).getFoodKcal() %>kcal</td>
									<td><%=foodList.get(4).getFoodFat() %>g</td>
									<td><%=foodList.get(4).getFoodProtein() %>g</td>
									<td><%=foodList.get(4).getFoodRice() %>g</td>
									<td><%=foodList.get(4).getFoodSweet() %>g</td>
								</tr>
							</table>
					    </div>
					</div>    
					<div id="exeDetail99">
					    <div>
					    	<table id="exeDetail9" style="display: none;">
								<tr>
									<th style="width: 75px;">이름</th>
									<th>칼로리</th>
									<th>지방</th>
									<th>단백질</th>
									<th>탄수화물</th>
									<th>당</th>
								</tr>
								<tr>
									<td><%=foodList.get(6).getFoodName() %></td>
									<td><%=foodList.get(6).getFoodKcal() %>kcal</td>
									<td><%=foodList.get(6).getFoodFat() %>g</td>
									<td><%=foodList.get(6).getFoodProtein() %>g</td>
									<td><%=foodList.get(6).getFoodRice() %>g</td>
									<td><%=foodList.get(6).getFoodSweet() %>g</td>
								</tr>
								<tr>
									<td><%=foodList.get(16).getFoodName() %></td>
									<td><%=foodList.get(16).getFoodKcal() %>kcal</td>
									<td><%=foodList.get(16).getFoodFat() %>g</td>
									<td><%=foodList.get(16).getFoodProtein() %>g</td>
									<td><%=foodList.get(16).getFoodRice() %>g</td>
									<td><%=foodList.get(16).getFoodSweet() %>g</td>
								</tr>
								<tr>
									<td><%=foodList.get(0).getFoodName() %></td>
									<td><%=foodList.get(0).getFoodKcal() %>kcal</td>
									<td><%=foodList.get(0).getFoodFat() %>g</td>
									<td><%=foodList.get(0).getFoodProtein() %>g</td>
									<td><%=foodList.get(0).getFoodRice() %>g</td>
									<td><%=foodList.get(0).getFoodSweet() %>g</td>
								</tr>
								<tr>
									<td><%=foodList.get(10).getFoodName() %></td>
									<td><%=foodList.get(10).getFoodKcal() %>kcal</td>
									<td><%=foodList.get(10).getFoodFat() %>g</td>
									<td><%=foodList.get(10).getFoodProtein() %>g</td>
									<td><%=foodList.get(10).getFoodRice() %>g</td>
									<td><%=foodList.get(10).getFoodSweet() %>g</td>
								</tr>
								</div>
							</table>
					    </div>
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