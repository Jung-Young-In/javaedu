<%@page import="kr.or.ddit.mission.vo.missionVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%  // 인증된 세션이 없는경우, 해당페이지를 볼 수 없게 함.
    	if (session.getAttribute("signedUser") == null) {
    	  String redirectUrl = request.getContextPath()+"/HW/main/login.do";
    	response.sendRedirect(redirectUrl); 
    } 
%>  
<%
	MemberVO memberVO = (MemberVO)request.getAttribute("memberVO");

	List<missionVO> missionList = (List<missionVO>) request.getAttribute("missionList");
%>
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Project HomeWar</title>
<!-- #page -->
<script src='<%=request.getContextPath() %>/HW_video/js/jquery-3.6.0.js'></script>
<script src='<%=request.getContextPath() %>/HW_main/js/plugins.js'></script>
<script src='<%=request.getContextPath() %>/HW_main/js/scripts.js'></script>
<script	src='<%=request.getContextPath() %>/HW_main/js/masonry.pkgd.min.js'></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src='<%=request.getContextPath()%>/HW_main/js/jquery.js'></script>

<link rel="stylesheet" href="<%=request.getContextPath() %>/HW_main/css/animate.css" >
<link rel="stylesheet" href="<%=request.getContextPath() %>/HW_main/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:300,400,700" >
<link rel="stylesheet" href="<%=request.getContextPath() %>/HW_main/css/style.css">
<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel='stylesheet'href='<%=request.getContextPath()%>/HW_MypageUser/css/style.css'	type='text/css' media='all' />
<link rel='stylesheet'href='<%=request.getContextPath()%>/HW_main/css/woocommerce-layout.css'type='text/css' media='all' />
<link rel='stylesheet'href='<%=request.getContextPath()%>/HW_main/css/woocommerce-smallscreen.css'type='text/css' media='only screen and (max-width: 768px)' />
<link rel='stylesheet'href='<%=request.getContextPath()%>/HW_main/css/woocommerce.css'	type='text/css' media='all' />
<link rel='stylesheet'href='<%=request.getContextPath()%>/HW_main/css/font-awesome.min.css'type='text/css' media='all' />
<link rel='stylesheet'href='<%=request.getContextPath()%>/HW_main/style.css' type='text/css'media='all' />
<link rel='stylesheet'href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700'type='text/css' media='all' />
<link rel='stylesheet'href='<%=request.getContextPath()%>/HW_main/css/easy-responsive-shortcodes.css'type='text/css' media='all' />
<linkhref='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700'rel='stylesheet' type='text/css'>
<style>
	#calender tr th {
		width: 30px;
		height: 30px;
		text-align: center;
	}
	#calender tr td {
		width: 150px;
		height: 150px;
		text-align: center;
	}
</style>
<script type="text/javascript">

	jQuery(document).ready(function($) {
		$(window).resize(function() {
			change();
		});
		function change() {
			var windowWidth = $(window).width();
			if (windowWidth < 980) {
				$('#byun').hide();
			} else {
				$('#byun').show();
			}
		}
		
		//미션 세팅
		initMissionSelect();
		
		//식단 세팅
		initfoodSelect();
		
	});
	
	function initMissionSelect() {
		
		$.ajax({
			url : "/HW_realmain2/MissionServlet",
			type : "post",
			data : {
				'flag' : 'missionList'
			},
			dataType : "json",
			success : function(data){
				makeMission(data);
				console.log(data);
			},
			error : function(xhr){
				console.log(xhr);
			}
		})
	}
	
	function initfoodSelect() {
		
		var memDate = "2021-04-30"
		$.ajax({
			url : "/HW_realmain2/ListExerciseNoticeServlet",
			type : "post",
			data : {
				'memDate' : memDate
				,'flag' : 'exerciseNoticeList'
			},
			dataType : "json",
			success : function(data){
				var food = data[0].food;
				var foodArr = food.split('/');
				$("#food1").html(foodArr[0])
				$("#food2").html(foodArr[1])
				$("#food3").html(foodArr[2])
				console.log(data);
			},
			error : function(xhr){
				console.log(xhr);
			}
		})
	}
	
// 	function makeCalenderSelect() {
// 		str = "";
// 		str += '<table border=\"1\" id="calender"><tr>
// 		<th>5월</th>
// 		<th></th>
// 		<th></th>
// 		<th></th>
// 		<th></th>
// 		<th></th>
// 		<th></th>
// 	</tr>		
// 	<tr>
// 		<th>일</th>
// 		<th>월</th>
// 		<th>화</th>
// 		<th>수</th>
// 		<th>목</th>
// 		<th>금</th>
// 		<th>토</th>
// 	</tr>'
// 		for(var i = 1; i <= 8; i++){
			
// 		}
// 	}
	
	function makeMission(data){
		var str = "";
		for (var i=0; i<data.length; i++){
			str += '<label for=\"mission' + i + "_" + 1 + '\">' + data[i].exerMission1 + '</label>'
			 	+ '<input type=\"checkbox\" id=\"mission' + i + "_" + 1 + '\" onclick=\"chk' + i + '()\">'
			 	+ '<label for=\"mission' + i + "_" + 2 + '\">' + data[i].exerMission2 + '</label>'
			 	+ '<input type=\"checkbox\" id=\"mission' + i + "_" + 2 + '\" onclick=\"chk' + i + '()\">'
			 	+ '<label for=\"mission' + i + "_" + 3 + '\">' + data[i].exerMission3 + '</label>'
			 	+ '<input type=\"checkbox\" id=\"mission' + i + "_" + 3 + '\" onclick=\"chk' + i + '()\"><br>';
			
			str += '<div id=\"' + i + "_" + 1 + '\" class=\"progress mb-3\" style=\"height: 5px; display: none;\">' 	
				+ '<div class=\"progress-bar bg-black\" role=\"progressbar\"'
				+ 'style=\"width: 33%\" aria-valuenow=\"33\" aria-valuemin=\"0\"'
				+ 'aria-valuemax=\"100\"></div></div>';
				
			str += '<div id=\"' + i + "_" + 2 + '\" class=\"progress mb-3\" style=\"height: 5px; display: none;\">' 	
				+ '<div class=\"progress-bar bg-black\" role=\"progressbar\"'
				+ 'style=\"width: 66%\" aria-valuenow=\"66\" aria-valuemin=\"0\"'
				+ 'aria-valuemax=\"100\"></div></div>'
				
			str += '<div id=\"' + i + "_" + 3 + '\" class=\"progress mb-3\" style=\"height: 5px; display: none;\">' 	
				+ '<div class=\"progress-bar bg-black\" role=\"progressbar\"'
				+ 'style=\"width: 100%\" aria-valuenow=\"100\" aria-valuemin=\"0\"'
				+ 'aria-valuemax=\"100\"></div></div>';
			if(i == 3){
				break;
			}
		}
		$("#mission").html(str);
	}
	
	function chk0(){
		if($("#mission0_1").prop("checked") == true && $("#mission0_2").prop("checked") == false && $("#mission0_3").prop("checked") == false){
			$("#0_1").show();
			$("#0_2").hide();
			$("#0_3").hide();
		}else if($("#mission0_1").prop("checked") == false && $("#mission0_2").prop("checked") == true && $("#mission0_3").prop("checked") == false){
			$("#0_1").show();
			$("#0_2").hide();
			$("#0_3").hide();
		}else if($("#mission0_1").prop("checked") == false && $("#mission0_2").prop("checked") == false && $("#mission0_3").prop("checked") == true){
			$("#0_1").show();
			$("#0_2").hide();
			$("#0_3").hide();
		}else if($("#mission0_1").prop("checked") == true && $("#mission0_2").prop("checked") == true && $("#mission0_3").prop("checked") == false){
			$("#0_1").hide();
			$("#0_2").show();
			$("#0_3").hide();
		}else if($("#mission0_1").prop("checked") == true && $("#mission0_3").prop("checked") == true && $("#mission0_2").prop("checked") == false){
			$("#0_1").hide();
			$("#0_2").show();
			$("#0_3").hide();
		}else if($("#mission0_2").prop("checked") == true && $("#mission0_3").prop("checked") == true && $("#mission0_1").prop("checked") == false){
			$("#0_1").hide();
			$("#0_2").show();
			$("#0_3").hide();
		}else if($("#mission0_2").prop("checked") == false && $("#mission0_3").prop("checked") == false && $("#mission0_1").prop("checked") == false){
			$("#0_1").hide();
			$("#0_2").hide();
			$("#0_3").hide();
		}else{
			$("#0_1").hide();
			$("#0_2").hide();
			$("#0_3").show();
			alert("오늘의 미션이 완료되었습니다.");
		}
	}
	function chk1(){
		if($("#mission1_1").prop("checked") == true && $("#mission1_2").prop("checked") == false && $("#mission1_3").prop("checked") == false){
			$("#1_1").show();
			$("#1_2").hide();
			$("#1_3").hide();
		}else if($("#mission1_1").prop("checked") == false && $("#mission1_2").prop("checked") == true && $("#mission1_3").prop("checked") == false){
			$("#1_1").show();
			$("#1_2").hide();
			$("#1_3").hide();
		}else if($("#mission1_1").prop("checked") == false && $("#mission1_2").prop("checked") == false && $("#mission1_3").prop("checked") == true){
			$("#1_1").show();
			$("#1_2").hide();
			$("#1_3").hide();
		}else if($("#mission1_1").prop("checked") == true && $("#mission1_2").prop("checked") == true && $("#mission1_3").prop("checked") == false){
			$("#1_1").hide();
			$("#1_2").show();
			$("#1_3").hide();
		}else if($("#mission1_1").prop("checked") == true && $("#mission1_3").prop("checked") == true && $("#mission1_2").prop("checked") == false){
			$("#1_1").hide();
			$("#1_2").show();
			$("#1_3").hide();
		}else if($("#mission1_2").prop("checked") == true && $("#mission1_3").prop("checked") == true && $("#mission1_1").prop("checked") == false){
			$("#1_1").hide();
			$("#1_2").show();
			$("#1_3").hide();
		}else if($("#mission1_2").prop("checked") == false && $("#mission1_3").prop("checked") == false && $("#mission1_1").prop("checked") == false){
			$("#1_1").hide();
			$("#1_2").hide();
			$("#1_3").hide();
		}else{
			$("#1_1").hide();
			$("#1_2").hide();
			$("#1_3").show();
			alert("오늘의 미션이 완료되었습니다.");
		}
	}
	function chk2(){
		if($("#mission2_1").prop("checked") == true && $("#mission2_2").prop("checked") == false && $("#mission2_3").prop("checked") == false){
			$("#2_1").show();
			$("#2_2").hide();
			$("#2_3").hide();
		}else if($("#mission2_1").prop("checked") == false && $("#mission2_2").prop("checked") == true && $("#mission2_3").prop("checked") == false){
			$("#2_1").show();
			$("#2_2").hide();
			$("#2_3").hide();
		}else if($("#mission2_1").prop("checked") == false && $("#mission2_2").prop("checked") == false && $("#mission2_3").prop("checked") == true){
			$("#2_1").show();
			$("#2_2").hide();
			$("#2_3").hide();
		}else if($("#mission2_1").prop("checked") == true && $("#mission2_2").prop("checked") == true && $("#mission2_3").prop("checked") == false){
			$("#2_1").hide();
			$("#2_2").show();
			$("#2_3").hide();
		}else if($("#mission2_1").prop("checked") == true && $("#mission2_3").prop("checked") == true && $("#mission2_2").prop("checked") == false){
			$("#2_1").hide();
			$("#2_2").show();
			$("#2_3").hide();
		}else if($("#mission2_2").prop("checked") == true && $("#mission2_3").prop("checked") == true && $("#mission2_1").prop("checked") == false){
			$("#2_1").hide();
			$("#2_2").show();
			$("#2_3").hide();
		}else if($("#mission2_2").prop("checked") == false && $("#mission2_3").prop("checked") == false && $("#mission2_1").prop("checked") == false){
			$("#2_1").hide();
			$("#2_2").hide();
			$("#2_3").hide();
		}else{
			$("#2_1").hide();
			$("#2_2").hide();
			$("#2_3").show();
			alert("오늘의 미션이 완료되었습니다.");
		}
		
		
	}
</script>
<style type="text/css">
.aa {
	font-size: x-large;
	padding: 40px;
}
#mymy{
color: #fff;
}
</style>
</head>
<body>

<div class="container-fluid pl-0 pr-0 bg-img clearfix parallax-window2" data-parallax="scroll" data-image-src="<%=request.getContextPath() %>/HW_main/images/banner2.jpg">
  <nav class="navbar navbar-expand-md navbar-dark">
    <div class="container"> 
      <!-- 로고--> 
      <a class="navbar-brand mr-auto" href="<%=request.getContextPath() %>/HW/main/mainlogin.do"><img src="<%=request.getContextPath() %>/HW_main/images/logo.png" alt="HWlogo" /></a> 
      
      <!-- 토글 버튼 -->
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar"> <span class="navbar-toggler-icon"></span> </button>
      
      <!-- 네비게이션 링크 -->
      <div class="collapse navbar-collapse" id="collapsibleNavbar">
     		 <ul class="navbar-nav ml-auto" style="float:left;">
     	     <li>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     	     		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     	         </li>
     		 	</ul>
        <ul class="navbar-nav ml-auto">
          <li><a href="<%=request.getContextPath() %>/HW/mypageuser/main.do"> <%=(String)session.getAttribute("signedUser") %>님 반갑습니다^^ </li>
      	</ul>
       <ul class="navbar-nav ml-auto"style="float:left;">
          <li class="nav-item"> 
          		<a class="nav-link" href="<%=request.getContextPath() %>/HW/video/pt.do">PT</a>
          </li>
          <li class="nav-item"style="float:left;"> 
          		<a class="nav-link" href="<%=request.getContextPath() %>/HW/prod/list.do">쇼핑몰</a> 
          </li>
          <li class="nav-item"style="float:left;"> 
          	          		<a class="nav-link" href="<%=request.getContextPath() %>/HW/notice/list.do">게시판</a> 
          </li>
          <li class="nav-item"style="float:left;"> 
          		<a class="nav-link" href="<%=request.getContextPath() %>/HW/pay/memberex.do"">멤버쉽</a>
          </li>
        </ul>
        <ul class="navbar-nav ml-5"style="float:left;">
          <li class="nav-item"> <a class="nav-link btn btn-danger" href="<%=request.getContextPath() %>/HW/main/logout.do">&nbsp;LogOut&nbsp;</a> </li>
        </ul>
      </div>
    </div>
  </nav>

  
  
		<div class="container">
				<div class="main-body">
					<br>
					<br>
					<br>
					<!-- Breadcrumb -->
					<nav aria-label="breadcrumb" class="main-breadcrumb">

						<h1 id="mymy"style="color:write;">마이 페이지</h1>

					</nav>
					<!-- /Breadcrumb -->
					<br>
					<br>
					<div class="row gutters-sm">
						<br>
						<br>
						<br>
						<div class="col-md-4 mb-3">
							<div class="card">
								<div class="card-body">
									<div class="d-flex flex-column align-items-center text-center" style="height:430px;">
										<img
											src="<%=request.getContextPath()%>/HW_mypageuser/IMG/11.jpg"
											alt="회원사진" class="rounded-circle" width="150">
										<div class="mt-3">
											<h4><%=memberVO.getMemId() %>님 환영합니다^^</h4>
											<p class="text-secondary mb-1">
											<%
											if(memberVO.getGradeCode().equals("G001")){
												%>일반 회원<%
											}else { 
												%>결제 회원<%
											}
											%>
											</p>
											<button class="btn btn-primary"><a href="<%=request.getContextPath() %>/HW/mypageuser/memberInfoUpdate.do">내정보 수정</a></button>
											<button class="btn btn-outline-primary"><a href="<%=request.getContextPath() %>/HW/whisp/list.do">트레이너 1대1 대화 메세지</a></button>
											<br> <br> <br> <br> <br>
										</div>
									</div>
								</div>
							</div>
							<div class="card mt-3">
								<ul class="list-group list-group-flush">
									<li
										class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
										<h6 class="mb-0">
											<circle cx="12" cy="12" r="10"></circle>
											<line x1="2" y1="12" x2="22" y2="12"></line>
											<path
												d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"></path>
											</svg>
											내정보
										</h6> <span class="text-secondary"><a href="#">회원 탈퇴</a></span>
									</li>
									<li
										class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
										<h6 class="mb-0">
											<path
												d="M9 19c-5 1.5-5-2.5-7-3m14 6v-3.87a3.37 3.37 0 0 0-.94-2.61c3.14-.35 6.44-1.54 6.44-7A5.44 5.44 0 0 0 20 4.77 5.07 5.07 0 0 0 19.91 1S18.73.65 16 2.48a13.38 13.38 0 0 0-7 0C6.27.65 5.09 1 5.09 1A5.07 5.07 0 0 0 5 4.77a5.44 5.44 0 0 0-1.5 3.78c0 5.42 3.3 6.61 6.44 7A3.37 3.37 0 0 0 9 18.13V22"></path>
											</svg>
											멤버쉽
										</h6> <span class="text-secondary"><a href="#">멤버쉽 정보</a></span>
									</li>
									<li
										class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
										<h6 class="mb-0">
											<path
												d="M23 3a10.9 10.9 0 0 1-3.14 1.53 4.48 4.48 0 0 0-7.86 3v1A10.66 10.66 0 0 1 3 4s-4 9 5 13a11.64 11.64 0 0 1-7 2c9 5 20 0 20-11.5a4.5 4.5 0 0 0-.08-.83A7.72 7.72 0 0 0 23 3z"></path>
											</svg>
											Shopingmall
										</h6> <span class="text-secondary"><a href="<%=request.getContextPath() %>/HW/prod/cartProd.do">장바구니 </a> / <a href="<%=request.getContextPath() %>/HW/prod/payProd.do">주문 내역</a></span>
									</li>
									<li
										class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
										<h6 class="mb-0">
											<rect x="2" y="2" width="20" height="20" rx="5" ry="5"></rect>
											<path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z"></path>
											<line x1="17.5" y1="6.5" x2="17.51" y2="6.5"></line>
											</svg>
											PT
										</h6> <span class="text-secondary"><a href="#">트레이너</a> /<a
											href="#"> 추천 식단 </a>/ <a href="#">미션</a></span>
									</li>
									<li
										class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
										<h6 class="mb-0">
											<path
												d="M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z"></path>
											</svg>
											문의
										</h6> <span class="text-secondary"><a href="#">공지</a> / <a
											href="#">Q&A</a> / <a href="#">운동</a></span>
									</li>
								</ul>
							</div>
						</div>
						<div class="col-md-8">
							<div class="card mb-3">
								<div class="card-body" style="height:450px;">
									<div class="row">
										<div class="col-sm-3">
											<h6 class="mb-0">이름</h6>
										</div>
										<div class="col-sm-9 text-secondary"><%=memberVO.getMemName() %></div>
									</div>
									<hr>
									<div class="row">
										<div class="col-sm-3">
											<h6 class="mb-0">이메일</h6>
										</div>
										<div class="col-sm-9 text-secondary"><%=memberVO.getMemEmail() %></div>
									</div>
									<hr>
									<div class="row">
										<div class="col-sm-3">
											<h6 class="mb-0">전화번호</h6>
										</div>
										<div class="col-sm-9 text-secondary"><%=memberVO.getMemHp() %></div>
									</div>
									<hr>
									<div class="row">
										<div class="col-sm-3">
											<h6 class="mb-0">주 소</h6>
										</div>
										<div class="col-sm-9 text-secondary"><%=memberVO.getMemAddr() %></div>
									</div>
									<hr>
									<div class="row">
										<div class="col-sm-3">
											<h6 class="mb-0">체형</h6>
										</div>
										<div class="col-sm-9 text-secondary">
										 
										 키 : <%=memberVO.getMemHeight() %> 
										 , 몸무게 : <%=memberVO.getMemWeight() %>
										 <% 
										 double Height = (double)  memberVO.getMemHeight()/100;
										 double Weight = (double)  memberVO.getMemWeight();
										double BMI = Weight/(Height*Height);
                              			%>
                              			,BMI수치 :<%=Math.round(BMI) %>
										 </div>
									</div>
									<hr>
									<div class="row">
										<div class="col-sm-3">
											<h6 class="mb-0">체형</h6>
										</div>
										<div class="col-sm-9 text-secondary">
										 
                              			 BMI수치 :<%=Math.round(BMI) %>
										 </div>
									</div>
								</div>
							</div>


							<div class="row gutters-sm">
								<div class="col-sm-6 mb-3">
									<div class="card h-100">
										<div class="card-body">
											<h2 class="d-flex align-items-center mb-3"
												style="text-align: center;'">
												<i class="material-icons text-info mr-2">미션</i>
											</h2>
										<div id="mission"></div>	
												
												
										</div>
									</div>
								</div>
								<div class="col-sm-6 mb-3">
									<div class="card h-100">
										<div class="card-body" style="line-height: 30px;">
											<h2 class="d-flex align-items-center mb-3"
												style="text-align: center;">
												<i class="material-icons text-info mr-2"> 추천 식단</i>
											</h2>
											<small>아침 식단</small>
											<div id="food1" class="progress mb-3" style="height: 25px"></div>
											<small>점심 식단</small>
											<div id="food2" class="progress mb-3" style="height: 25px"></div>
											<small>저녘 식단</small>
											<div id="food3" class="progress mb-3" style="height: 25px"></div>
											
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div>
					<table border="1" id="calender">
						<tr>
							<th>5월</th>
							<th></th>
							<th></th>
							<th></th>
							<th></th>
							<th></th>
							<th></th>
						</tr>		
						<tr>
							<th>일</th>
							<th>월</th>
							<th>화</th>
							<th>수</th>
							<th>목</th>
							<th>금</th>
							<th>토</th>
						</tr>		
						<tr>
							<td><p>25</p><div class="date"></div></td>
							<td><p>26</p><div class="date"></div></td>
							<td><p>27</p><div class="date"></div></td>
							<td><p>28</p><div class="date"></div></td>
							<td><p>29</p><div class="date">
								<div class="progress mb-3" style="height: 5px">
									<div class="progress-bar bg-primary" role="progressbar"
										style="width: 100%" aria-valuenow="100" aria-valuemin="0"
										aria-valuemax="100"></div>
								</div>
							</div></td>
							<td><p>30</p><div class="date">
								<div class="progress mb-3" style="height: 5px">
									<div class="progress-bar bg-primary" role="progressbar"
										style="width: 100%" aria-valuenow="100" aria-valuemin="0"
										aria-valuemax="100"></div>
								</div>
							</div></td>
							<td><p>1</p><div class="date"></div></td>
						</tr>		
						<tr>
							<td><p>2</p><div class="date"></div></td>
							<td><p>3</p><div class="date"></div></td>
							<td><p>4</p><div class="date"></div></td>
							<td><p>5</p><div class="date"></div></td>
							<td><p>6</p><div class="date"></div></td>
							<td><p>7</p><div class="date"></div></td>
							<td><p>8</p><div class="date"></div></td>
						</tr>		
						<tr>
							<td><p>9</p><div class="date"></div></td>
							<td><p>10</p><div class="date"></div></td>
							<td><p>11</p><div class="date"></div></td>
							<td><p>12</p><div class="date"></div></td>
							<td><p>13</p><div class="date"></div></td>
							<td><p>14</p><div class="date"></div></td>
							<td><p>15</p><div class="date"></div></td>
						</tr>		
						<tr>
							<td><p>16</p><div class="date"></div></td>
							<td><p>17</p><div class="date"></div></td>
							<td><p>18</p><div class="date"></div></td>
							<td><p>19</p><div class="date"></div></td>
							<td><p>20</p><div class="date"></div></td>
							<td><p>21</p><div class="date"></div></td>
							<td><p>22</p><div class="date"></div></td>
						</tr>		
						<tr>
							<td><p>23</P><div class="date"></div></td>
							<td><p>24</P><div class="date"></div></td>
							<td><p>25</P><div class="date"></div></td>
							<td><p>26</P><div class="date"></div></td>
							<td><p>27</P><div class="date"></div></td>
							<td><p>28</P><div class="date"></div></td>
							<td><p>29</P><div class="date"></div></td>
						</tr>		
						<tr>
							<td><p>30</p><div class="date"></div></td>
							<td><p>31</p><div class="date"></div></td>
							<td><p>1</p><div class="date"></div></td>
							<td><p>2</p><div class="date"></div></td>
							<td><p>3</p><div class="date"></div></td>
							<td><p>4</p><div class="date"></div></td>
							<td><p>5</p><div class="date"></div></td>
						</tr>		
					</table>

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
<script src="<%=request.getContextPath() %>/HW_main/js/main2.js"></script>
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
</body>
</html>