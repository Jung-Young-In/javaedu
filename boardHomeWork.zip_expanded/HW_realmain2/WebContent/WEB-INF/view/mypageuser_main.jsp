<%@page import="kr.or.ddit.mission.vo.missionVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
<script src='<%=request.getContextPath() %>/HW_main/js/plugins.js'></script>
<script src='<%=request.getContextPath() %>/HW_main/js/scripts.js'></script>
<script	src='<%=request.getContextPath() %>/HW_main/js/masonry.pkgd.min.js'></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src='<%=request.getContextPath()%>/HW_main/js/jquery.js'></script>

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
	});
</script>
<style type="text/css">
.aa {
	font-size: x-large;
	padding: 40px;
}
</style>
</head>
<body
	class="home page page-template page-template-template-portfolio page-template-template-portfolio-php">

	<div class="container-fluid">
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav">
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#"></a></li>
				<li><a href="<%=request.getContextPath()%>/HW/main/login.do"
					style="font-size: x-large;"><span
						class="glyphicon glyphicon-log-in"></span> LogIn</a></li>
			</ul>
		</div>
	</div>

	<div id="page">
		<div class="container">
			<header id="masthead" class="site-header">
				<div class="site-branding">
					<h1 class="site-title">
						<a href="index.html" rel="home"></a>
					</h1>
					<h2 class="site-description"></h2>
				</div>
				<nav id="site-navigation" class="main-navigation">
					<button class="menu-toggle">
						<img alt="안나와.."
							src="<%=request.getContextPath()%>/HW_main/IMG/logo.jpg">
					</button>
					<a class="skip-link screen-reader-text" href="#content">Skip to
						content</a>
					<div class="menu-menu-1-container" onchange="dis()">
						<ul id="menu-menu-1" class="menu">
							<li><a href="index.html" class="aa">PT</a>
								<ul class="sub-menu">
									<li><a href="portfolio-item.html">BMI 계산기</a></li>
									<li><a href="blog-single.html">운동 게시판</a></li>
									<li><a href="shop-single.html">운동 동영상</a></li>
									<li><a href="portfolio-category.html">운동/식단</a></li>
								</ul></li>
							<li><a href="about.html" class="aa">쇼핑몰</a>
								<ul class="sub-menu">
									<li><a href="portfolio-item.html">운동 기구</a></li>
									<li><a href="blog-single.html">보조 식품</a></li>
									<li><a href="shop-single.html">배송 문의</a></li>
									<li><a href="portfolio-category.html">상품 문의</a></li>
								</ul></li>
							<li id="byun"><a href="<%=request.getContextPath() %>/HW/main/main.do"><img alt="안나와.."
									src="<%=request.getContextPath()%>/HW_main/IMG/logo.jpg"
									width="150" height="150"></a></li>
							<li><a href="blog.html" class="aa">게시판</a>
								<ul class="sub-menu">
									<li><a href="portfolio-item.html">공지 사항</a></li>
									<li><a href="blog-single.html">Q & A</a></li>
								</ul></li>
							<li><a href="#" class="aa">멤버쉽</a>
								<ul class="sub-menu">
									<li><a href="portfolio-item.html">멤버쉽 소개</a></li>
									<li><a href="blog-single.html">멤버쉽 결제</a></li>
								</ul></li>
						</ul>
					</div>
				</nav>
			</header>
			<!-- #masthead -->

			<div class="container">
				<div class="main-body">
					<br>
					<br>
					<br>
					<!-- Breadcrumb -->
					<nav aria-label="breadcrumb" class="main-breadcrumb">

						<h1>마이 페이지</h1>

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
									<div class="d-flex flex-column align-items-center text-center">
										<img
											src="<%=request.getContextPath()%>/HW_mypageuser/IMG/logo.jpg"
											alt="회원사진" class="rounded-circle" width="150">
										<div class="mt-3">
											<h2><%=memberVO.getMemId() %>님 환영합니다^^</h2>
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
										<br>
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
								<div class="card-body">
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
								</div>
							</div>

							<br>
							<br>
							<br>

							<div class="row gutters-sm">
								<div class="col-sm-6 mb-3">
									<div class="card h-100">
										<div class="card-body">
											<h2 class="d-flex align-items-center mb-3"
												style="text-align: center;'">
												<i class="material-icons text-info mr-2">미션</i>
											</h2>
	
											<input id="chk1" type="checkbox" name="mission1_1" value="mission1_1">
											<label id="mission1_1"><%=missionList.get(0).getExerMission1() %></label><br>	
											<input id="chk2" type="checkbox" name="mission1_2" value="mission1_2">
											<label id="mission1_2"><%=missionList.get(1).getExerMission1() %></label><br>	
											<input id="chk3" type="checkbox" name="mission1_3" value="mission1_3">
											<label id="mission1_3"><%=missionList.get(2).getExerMission1() %></label><br>	
											
											<script type="text/javascript">
												if($("#chk1").checked || $("#chk2").checked || $("#chk3").checked){
													$("#pro1").show();
												}
												
												
											</script>
											
											<div id="pro1" class="progress mb-3" style="height: 5px; display: none;">
												<div class="progress-bar bg-black" role="progressbar"
													style="width: 33%" aria-valuenow="33" aria-valuemin="0"
													aria-valuemax="100"></div>
											</div>
											
											<input type="checkbox" name="mission2_2" value="mission2_2">
											<label id="mission2_2"><%=missionList.get(0).getExerMission2() %></label><br>	
											<input type="checkbox" name="mission2_2" value="mission2_2">
											<label id="mission2_2"><%=missionList.get(2).getExerMission2() %></label><br>	
											<input type="checkbox" name="mission2_3" value="mission2_3">
											<label id="mission2_3"><%=missionList.get(2).getExerMission2() %></label><br>	
											
											<input type="checkbox" name="mission3_3" value="mission3_3">
											<label id="mission3_3"><%=missionList.get(0).getExerMission3() %></label><br>	
											<input type="checkbox" name="mission3_2" value="mission3_2">
											<label id="mission3_2"><%=missionList.get(3).getExerMission3() %></label><br>	
											<input type="checkbox" name="mission3_3" value="mission3_3">
											<label id="mission3_3"><%=missionList.get(2).getExerMission3() %></label><br>	
			
			
	
	
	
	
	
											
											
											<small>달리기 80%</small>
											<div class="progress mb-3" style="height: 5px">
												<div class="progress-bar bg-black" role="progressbar"
													style="width: 80%" aria-valuenow="80" aria-valuemin="0"
													aria-valuemax="100"></div>
											</div>
											<small>팔 굽혀 펴기 72%</small>
											<div class="progress mb-3" style="height: 5px">
												<div class="progress-bar bg-primary" role="progressbar"
													style="width: 72%" aria-valuenow="72" aria-valuemin="0"
													aria-valuemax="100"></div>
											</div>
											<small>윗 몸 일으키기 89%</small>
											<div class="progress mb-3" style="height: 5px">
												<div class="progress-bar bg-primary" role="progressbar"
													style="width: 89%" aria-valuenow="89" aria-valuemin="0"
													aria-valuemax="100"></div>
											</div>
											<small>스쿼드 55%</small>
											<div class="progress mb-3" style="height: 5px">
												<div class="progress-bar bg-primary" role="progressbar"
													style="width: 55%" aria-valuenow="55" aria-valuemin="0"
													aria-valuemax="100"></div>
											</div>
											<small> 플랭크 66%</small>
											<div class="progress mb-3" style="height: 5px">
												<div class="progress-bar bg-primary" role="progressbar"
													style="width: 66%" aria-valuenow="66" aria-valuemin="0"
													aria-valuemax="100"></div>
											</div>
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
											<div class="progress mb-3" style="height: 25px">사과</div>
											<small>점심 식단</small>
											<div class="progress mb-3" style="height: 25px">고기</div>
											<small>저녘 식단</small>
											<div class="progress mb-3" style="height: 25px">생선</div>
											
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
				<div>

					<div>
						<iframe width="1200px;" height="700px;" src="<%=request.getContextPath() %>/HW/mypageuser/calender.do"></iframe>
					</div>			

				</div>

			<br> <br>
			<!-- .container -->
			<footer id="colophon" class="site-footer">
				<div class="container">
					<div class="site-info">
						<h1
							style="font-family: 'Herr Von Muellerhoff'; color: #ccc; font-weight: 300; text-align: center; margin-bottom: 0; margin-top: 0; line-height: 1.4; font-size: 46px;">Hw</h1>
						copyright Homewar 2021-04-21<i class="fa fa-love"></i>
					</div>
				</div>
			</footer>
			<a href="#top" class="smoothup" title="Back to top"><span
				class="genericon genericon-collapse"></span></a>
		</div>
</body>
</html>