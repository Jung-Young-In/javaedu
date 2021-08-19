<%@page import="kr.or.ddit.prod.vo.ProdVO"%>
<%@page import="kr.or.ddit.prod.vo.AtchFileVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	ProdVO prodVO = (ProdVO)request.getAttribute("prodVO");
	
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




<script src='<%=request.getContextPath() %>/HW_prod/js/jquery.js'></script>
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

function submitCommet() {
	
	var check = confirm("댓글을 등록하시겠습니까?");
	 if(!check){
			return;	
	 }
	 
	
	var memId = "<%=session.getAttribute("signedUser") %>";	
	
	if(memId == "null"){
		alert("로그인 후 이용가능한 기능입니다. 로그인해주세요");
		return
	}
	
	var prodNum = "<%=prodVO.getProdNum() %>";
	var prodRefleTitle = $('#refleTitle').val();
	var prodRefleContent = $('#new-comment').val();
	
	var param = {
		
		'memId' : memId
		,'prodNum' : prodNum
		,'prodRefleTitle' : prodRefleTitle
		,'prodRefleContent' : prodRefleContent
		,'flag' : 'refle'	
	};
	
	var param2 = {
			'prodNum' : prodNum
		};
	
	
	
	$.ajax({
			url : "/HW_realmain2/RefleServlet"
			,type : "post"
			,data : param 
			,dataType : "json"
			,success : function(data){
				if(data.resultCnt == 1){
					alert("저장되었습니다.");
					
					$.ajax({
						url : "/HW_realmain2/InRefleServlet"
						,type : "post"
						,data : param2 
						,dataType : "json"
						,success : function(){
								$("#detail").load("inRefle.jsp");
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
			}
			,error : function(xhr){
				console.log("여기부터");
				console.log(xhr);
				alert("실패하였습니다. \n관리자에게 문의하세요.");
				console.log(xhr);
			}
		});  
	 

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
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
<body class="archive post-type-archive post-type-archive-product woocommerce woocommerce-page">

<div class="container-fluid">
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
      </ul>
      <ul class="nav navbar-nav navbar-right">
      	<li><a href="#"></a></li>
        <li><a href="<%=request.getContextPath() %>/HW/main/login.do" style="font-size: x-large;"><span class="glyphicon glyphicon-log-in" ></span> Login</a></li>
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
		<button class="menu-toggle"><img alt="안나와.." src="<%=request.getContextPath() %>/HW_prod/IMG/logo.jpg"></button>
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
					<li><a href="#">운동 기구</a></li>
					<li><a href="#">보조 식품</a></li>
					<li><a href="#">배송 문의</a></li>
					<li><a href="#">상품 문의</a></li>
				</ul>
				</li>
				<li id="byun"><a href="#"><img alt="안나와.." src="<%=request.getContextPath() %>/HW_main/IMG/logo.jpg" width="150" height="150"></a></li>
				<li>
				<a href="<%=request.getContextPath() %>/HW/board/list.do" class="aa">게시판</a>
				<ul class="sub-menu">
					<li><a href="#l">공지 사항</a></li>
					<li><a href="#">Q & A</a></li>
				</ul>
				</li>
				<li>
				<a href="#" class="aa">멤버쉽</a>
				<ul class="sub-menu">
					<li><a href="#">멤버쉽 소개</a></li>
					<li><a href="#">멤버쉽 결제</a></li>
				</ul>
				</li>
			</ul>
		</div>
		</nav>
		</header>
		
		
		<!-- #masthead -->
		<body>
		
				<div style=" width: 100%;">
					<div class="prod-atf" style="padding-top: 150px;">
						<div class="prod-atf-main">
							<div class="prod-image">
								<div style="width: 600px; height: 400px;" >
									<img class="prod-image__detail"
										src="<%=request.getContextPath() %><%= prodVO.getProdImgPath() %>"
										alt="detail image" style="width: 500px; height: 400px;">
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
								판매처 : <%= prodVO.getProdSell() %>
								</div>
								


								<div class="prod-buy-header">

									<h1 class="prod-buy-header__title">
										<%= prodVO.getProdName() %>
									</h1>

									<div class="prod-buy-header__info"></div>


								</div>



								<div class="prod-author" style="display: none;"></div>


								<div class="prod-price-container">
									<div class="prod-price">


										<div class="prod-price-onetime">


											<div class="prod-origin-price ">

												판매가 : <span class="origin-price"><%= prodVO.getProdPrice() %>원</span>

											</div>



											<div class="prod-sale-price   prod-major-price">
													<span class="total-price"> 
														<h2>
															<strong>회원가 : <%=prodVO.getProdMemberPrice() %><span class="price-unit">원</strong>														
														</h2>
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
				<div id="btf"style="width: 980px;  padding-top: 10px;">
					<div id="btfTab" class="tab">
						<ul class="tab-titles">
							<li>상품상세</li>
							<li>상품평 </li>
							<li>상품문의</li>
						</ul>
						<ul class="tab-contents">
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
	
	<div id ="comments" >
		<div id="comment-head" class="comment-row">
			<span id ="comments-count">2</span> Comment(S)
		</div>	
		<table>
			<div>
				<td width="550">
					<div class ="comment-row">
						<form    style=" margin-left: 30px;">
							제목 : <input type="text" id="refleTitle"></textarea>
							<textarea id="new-comment" name="new_comment" rows="5" cplaceholder="New Comment"></textarea>
						</form>
					</div>
				</td>
				<td width="100" style="text-align:center;  padding: 30px;">
						<button type="submit" onclick="submitCommet()">등록</button>
				</td>
			</div>
		</table>
		<div id="detail">
		</div>
	</div>
	
	</div>	
	<!-- .container -->
	<footer id="colophon" class="site-footer">
</body>
<!-- #page -->


 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
</html>
