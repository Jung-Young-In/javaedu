<%@page import="kr.or.ddit.prod.vo.ProdVO"%>
<%@page import="kr.or.ddit.prod.vo.AtchFileVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	ProdVO prodVO = (ProdVO)request.getAttribute("prodVO");
	
%>

<%  // 인증된 세션이 있는경우 로그인 된  쇼핑몰 화면으로 이동
    	if (session.getAttribute("signedUser") != null) {
    	  String redirectUrl = request.getContextPath()+"/HW/prod/selectlogin.do";
    	response.sendRedirect(redirectUrl); 
    } 
%>  
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta charset="UTF-8">
<title>HW market detail</title>


<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta property="og:image"
	content="//thumbnail8.coupangcdn.com/thumbnails/remote/230x230ex/image/vendor_inventory/3679/06dadbc5622a1040310f7e5627e399c13de4351e9f147c652b96d0ee9d30.jpg">

<link rel='stylesheet' href='<%=request.getContextPath() %>/HW_prod/css/woocommerce-layout.css' type='text/css' media='all'/>
<link rel='stylesheet' href='<%=request.getContextPath() %>/HW_prod/css/woocommerce-smallscreen.css' type='text/css' media='only screen and (max-width: 768px)'/>
<link rel='stylesheet' href='<%=request.getContextPath() %>/HW_prod/css/woocommerce.css' type='text/css' media='all'/>
<link rel='stylesheet' href='<%=request.getContextPath() %>/HW_prod/css/font-awesome.min.css' type='text/css' media='all'/>
<link rel='stylesheet' href='<%=request.getContextPath() %>/HW_prod/css/style2.css' type='text/css' media='all'/>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700' type='text/css' media='all'/>
<link rel='stylesheet' href='<%=request.getContextPath() %>/HW_prod/css/easy-responsive-shortcodes.css' type='text/css' media='all'/>

<link rel="stylesheet" href='<%=request.getContextPath() %>/HW_prod/css/common.min.css' type="text/css">
<link rel="stylesheet" href='<%=request.getContextPath() %>/HW_prod/css/sdp2.min.css' type="text/css">
<link rel="stylesheet" href='<%=request.getContextPath() %>/HW_prod/css/productReview.min.css' type="text/css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/HW_main/css/animate.css" >
	<link rel="stylesheet" href="<%=request.getContextPath() %>/HW_main/css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:300,400,700" >
	<link rel="stylesheet" href="<%=request.getContextPath() %>/HW_main/css/style.css">



<script src='<%=request.getContextPath() %>/HW_prod/js/jquery.js'></script>
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


function inBasket(){
	
	 var check = confirm("장바구니에 등록하시겠습니까?");
	 if(!check){
			return;	
	 }
	 
	var memId = "<%=session.getAttribute("signedUser") %>";	
	
	if(memId == "null"){
		alert("로그인 후 이용가능한 기능입니다. 로그인해주세요");
		return
	}
	
	var prodNum = "<%=prodVO.getProdNum() %>";
	var prodPrice = "<%=prodVO.getProdPrice() %>";
	var prodMemberPrice = "<%=prodVO.getProdMemberPrice() %>";
	var prodName = "<%= prodVO.getProdName() %>";
	var prodImgPath = "<%=prodVO.getProdImgPath() %>";

	var param = {
		
		'memId' : memId
		,'prodNum' : prodNum
		,'prodName' : prodName
		,'prodPrice' : prodPrice
		,'prodMemberPrice' : prodMemberPrice
		,'prodImgPath' : prodImgPath
		,'flag' : 'cart'	
	};
	
	
	
	$.ajax({
			url : "/HW_realmain2/CartServlet"
			,type : "post"
			,data : param 
			,dataType : "json"
			,success : function(data){
				if(data.resultCnt == 1){
					alert("저장되었습니다.");
					//페이지 이동
					
				}
			}
			,error : function(xhr){
				console.log("여기부터");
				console.log(xhr);
				alert("실패하였습니다. \n관리자에게 문의하세요.");
				console.log(xhr);
			}
		});  
	 
}











// function dateToString(date){
// 	const dateString = date.toISOString();
// 	const dateToString = dateString.substring(0,10) + " "+ dateString.substring(11, 19);
// 	return dateToString;
// }

// function submitCommet() {
	
// 	var check = confirm("댓글을 등록하시겠습니까?");
// 	 if(!check){
// 			return;	
// 	 }
	 
	
<%-- 	var memId = "<%=session.getAttribute("signedUser") %>";	 --%>
	
// 	if(memId == "null"){
// 		alert("로그인 후 이용가능한 기능입니다. 로그인해주세요");
// 		return
// 	}
	
<%-- 	var prodNum = "<%=prodVO.getProdNum() %>"; --%>
// 	var prodRefleTitle = $('#refleTitle').val();
// 	var prodRefleContent = $('#new-comment').val();
	
// 	var param = {
		
// 		'memId' : memId
// 		,'prodNum' : prodNum
// 		,'prodRefleTitle' : prodRefleTitle
// 		,'prodRefleContent' : prodRefleContent
// 		,'flag' : 'refle'	
// 	};
	
// 	var param2 = {
// 			'prodNum' : prodNum
// 		};
	
	
	
// 	$.ajax({
// 			url : "/HW_realmain2/RefleServlet"
// 			,type : "post"
// 			,data : param 
// 			,dataType : "json"
// 			,success : function(data){
// 				if(data.resultCnt == 1){
// 					alert("저장되었습니다.");
					
// 					$.ajax({
// 						url : "/HW_realmain2/InRefleServlet"
// 						,type : "post"
// 						,data : param2 
// 						,dataType : "json"
// 						,success : function(){
// 								$("#detail").load("inRefle.jsp");
// 							}
// 						}
// 						,error : function(xhr){
// 							console.log("여기부터");
// 							console.log(xhr);
// 							alert("실패하였습니다. \n관리자에게 문의하세요.");
// 							console.log(xhr);
// 						}
// 					});  
				 
					
					
// 				}
// 			}
// 			,error : function(xhr){
// 				console.log("여기부터");
// 				console.log(xhr);
// 				alert("실패하였습니다. \n관리자에게 문의하세요.");
// 				console.log(xhr);
// 			}
// 		});  
	 

	
// 	const newcommentEL = document.getElementById("new-comment");
// 	const newcomment = newcommentEL.value.trim();
	
// 	if(newcomment) {
// 		const dateEL = document.createElement('div');
// 		dateEL.classList.add("comment-date");
// 		const dateString = dateToString(new Date());
// 		dateEL.innerText = dateString;
		
// 		const contentEL = document.createElement('div');
// 		contentEL.classList.add('comment-content2');
// 		contentEL.innerText= newcomment;
		
// 		const commentEL = document.createElement('div');
// 		commentEL.classList.add('comment-row');
// 		commentEL.appendChild(dateEL);
// 		commentEL.appendChild(contentEL);
		
// 		document.getElementById('comments').appendChild(commentEL);
// 		newcommentEL.value = "";
		
// 		const countEL = document.getElementById('comments-count');
// 		const count = countEL.innerText;
// 		countEL.innerText = parseInt(count) + 1;
// 	}
// 	else warnEmpty();
// }


// function warnEmpty(){
// 	alert("댓글을 입력해주세요")
// }



</script>
<style type="text/css">
.aa {
	font-size: x-large;
	padding: 40px;
}
</style>
</head>
<body>
<div class="container-fluid pl-0 pr-0 bg-img clearfix parallax-window2" data-parallax="scroll" data-image-src="<%=request.getContextPath() %>/HW_main/images/banner2.jpg">
  <nav class="navbar navbar-expand-md navbar-dark">
    <div class="container"> 
      <!-- 로고--> 
      <a href="<%=request.getContextPath() %>/HW/main/main.do">
      		<img src="<%=request.getContextPath() %>/HW_main/images/logo.png" alt="HWlogo" />
      </a> 
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
          		<a class="nav-link" href="<%=request.getContextPath() %>/HW/pay/memberex.do">멤버쉽</a>
          </li>
        </ul>
        <ul class="navbar-nav ml-5">
          <li class="nav-item"> <a class="nav-link btn btn-danger" href="<%=request.getContextPath() %>/HW/main/login.do">&nbsp;LogIn&nbsp;</a> </li>
        </ul>
      </div>
    </div>
  </nav>
  
  
  
  
  
		<div class="container">
		<!-- #masthead -->
		
				<div style=" width: 100%;">
					<div class="prod-atf" style="padding-top: 50px;">
						<div class="prod-atf-main">
							<div class="prod-image">
								<div style="width: 600px; height: 400px;" >
									<img class="prod-image__detail" 
										src="<%=request.getContextPath() %><%= prodVO.getProdImgPath() %>"
										alt="detail image" style="width: 500px; height: 400px; border: 3px solid orange;">
								</div>

								<div id="prodStickyBanner"
									class="product-sticky-banner-clickable prod-sticky-banner"
									style="display: none;"></div>
							</div>




							<div
								class="prod-buy       new-oos-style  not-loyalty-member  eligible-address    without-subscribe-buy-type  DISPLAY_0  only-one-delivery">
								<div class="prod-buy-blocker"></div>
								<div class="prod-title-badges"></div>

								<div>
								<p style="color: white;"> 판매처 : <%= prodVO.getProdSell() %></p>
								</div>
								


								<div class="prod-buy-header">

									<h1 class="prod-buy-header__title">
										<p style="color: white;"><%= prodVO.getProdName() %></p>
									</h1>

									<div class="prod-buy-header__info"></div>


								</div>



								<div class="prod-author" style="display: none;"></div>


								<div class="prod-price-container">
									<div class="prod-price">


										<div class="prod-price-onetime">


											<div class="prod-origin-price ">

												<p style="color: white;">판매가 : <span class="origin-price"><%= prodVO.getProdPrice() %>원</span></p>

											</div>



											<div class="prod-sale-price   prod-major-price">
													<span class="total-price"> 
														<h1>
															<strong>회원가 : <%=prodVO.getProdMemberPrice() %><span class="price-unit">원</strong>														
														</h1>
													</span>
												
											</div>

											<div class="prod-coupon-price prod-major-price"
												style="display: none">
												<span class="total-price"> <strong><span
														class="price-unit">원</span></strong>
												</span> <span class="unit-price"></span> <span
													class="price-txt-info"> </span>
											</div>
											<div class="prod-cash-promotion-container"></div>

											<div class="prod-benefit-badge-wrap">
												<div class="prod-ccid-badge-container"></div>
												<div class="prod-reward-cash-badge-container"></div>
											</div>
											<div class="prod-targeted-promotion-banner-container"></div>
										</div>
									</div>




									<div class="subscribe-learnmore-container"></div>
								</div>

								<div class="prod-limit-notice-container"></div>

								<!--display logic summary-->

								<div
									class="prod-shipping-fee-and-pdd-wrapper apply-unknown-customer-handling"
									data-apply-unknown-customer-handling="B">
									<div class="prod-delivery-notice-container"></div>

									<div class="prod-shipping-fee-container">

										<div class="prod-shipping-fee ">





											<div class="prod-pre-order-release-container"
												style="display: none;">
												<span class="prod-pre-order-release-msg"></span>
											</div>
										</div>
									</div>





									<div class="prod-pdd-container">



										<div class="prod-pdd-display-area"></div>

									</div>


								</div>



							</div>
							<div class="prod-buy-footer ">
								<div class="prod-onetime-order" >
									<button class="prod-cart-btn" onclick="inBasket()">장바구니 담기</button>
									<button class="prod-buy-btn"><span class="prod-buy-btn__txt">바로구매</span></button>
								</div>



							</div>

							<div class="prod-loyalty-register-subscribe-order"
								style="display: none;">

								<button class="prod-loyalty-register-btn"
									data-loyalty-landing-url=""
									id="loyaltyRegisterSubscribeOrderButton">
									<span class="prod-buy-btn__txt"></span>
								</button>

							</div>

							<div class="prod-pre-order" style="display: none">
								<button class="prod-pre-order-btn">
									<span class="prod-buy-btn__txt"></span>
								</button>
							</div>
						</div>
						<div class="prod-buy-quantity-and-footer__mask"></div>
					</div>
				
				<br>
				<br>
				<br>
				<br>
				<br>
<div class="container-fluid fh5co-network">
  <div class="container">
    <div class="row">
      <div class="col-md-6">
<!--         <h4 class="wow bounceInUp">FOR NETWORK</h4> -->
        <h2 class="wow bounce" style="margin-top: 40px; margin-left: 60px;">제품 상세 정보</h2>
<!--         <h2 class="wow bounceInRight">HomeWar</h2> -->
        <hr style="max-width: 200px; border-color: white;">
<!--         <h5 class="wow bounceInLeft">NETWORK SUMMER 2017</h5> -->
<!--         <p class="wow bounceInDown">특별 강사 이휘로 강사님 초청 강연 / 대덕 인재 개발원 403호 홍일점 박상영 씨의 초청 공연</p> -->
      </div>
      <div class="col-md-6">
<%--         <figure class="wow bounceInDown"> <img src="<%=request.getContextPath() %>/HW_main/images/about-img.jpg" alt="gym" class="img-fluid" /> </figure> --%>
      </div>
    </div>
  </div>
</div>

					<div>

						<div class="product-detail-content-inside">
							<div class="detail-item">
									<div class="subType-IMAGE">
										<img src="<%=request.getContextPath() %><%= prodVO.getProdDetailInfo()%>" width="100%" alt="상세페이지">
									</div>
							</div>
						</div>

				<div style="clear: both;"></div>
						
						</main>
						<!-- #main -->
					</div>
					<!-- #primary -->
				</div>
				<!-- #content -->				
	</div>
	
	<br>
	<div style="color: black;">
		
	</div>
	
	
	
	<!-- .container -->
	
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
</body>
<!-- #page -->


 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
<script src="<%=request.getContextPath() %>/HW_main/js/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/HW_main/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath() %>/HW_main/js/parallax.js"></script>
<script src="<%=request.getContextPath() %>/HW_main/js/wow.js"></script>
<script src="<%=request.getContextPath() %>/HW_main/js/main.js"></script>
  
  
  
 </body>
</html>
