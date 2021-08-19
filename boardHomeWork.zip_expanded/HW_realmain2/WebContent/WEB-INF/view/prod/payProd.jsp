<%@page import="kr.or.ddit.cart.vo.CartVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	List<CartVO> cartList = (List<CartVO>)request.getAttribute("cartList");
%>

<!DOCTYPE html>
<html lang="kr">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>장바구니</title>
	<link rel="stylesheet" href='<%=request.getContextPath() %>/HW_prod/css/shoppingcart-web-new.css' type="text/css">
	<script src="<%=request.getContextPath() %>/HW_prod/js/jquery-3.6.0.js"></script>
	
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/HW_main/css/animate.css" >
	<link rel="stylesheet" href="<%=request.getContextPath() %>/HW_main/css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:300,400,700" >
	<link rel="stylesheet" href="<%=request.getContextPath() %>/HW_main/css/style.css">
	<link rel="stylesheet" href='<%=request.getContextPath() %>/HW_prod/css/shoppingcart-web-new.css' type="text/css">


<!-- 자바스크립트  --> 
	
	<script src="<%=request.getContextPath() %>/HW_main/js/jquery.min.js"></script>
	<script src="<%=request.getContextPath() %>/HW_main/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath() %>/HW_main/js/parallax.js"></script>
	<script src="<%=request.getContextPath() %>/HW_main/js/wow.js"></script>
	<script src="<%=request.getContextPath() %>/HW_main/js/main.js"></script>
	<script src="<%=request.getContextPath() %>/HW_prod/js/jquery-3.6.0.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
		<element>
			<script src="https://code.jquery.com/jquery-3.4.1.min.js"
				integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
				crossorigin="anonymous" type="text/javascript">
			</script>
		</element>
	<!--1. 아임포트 라이브러리 추가-->
	<!-- iamport.payment.js -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	
	<script type="text/javascript">
	
// 		$(document).ready(function() {
// 			alert("실행");
// 			// 전체선택, 전체해제             <---------------실행 안되요
// 			$("#chkAll").click(function() {
// 				var isChecked = $(this).prop("checked");
// 				if(isChecked){
// 					$("input[name=chkchk]").prop("checked",true);
// 				}else {$("input[name=chkchk]").prop("checked",false)}
// 			});
			
// 			// 하나 체크 해제시 전체해제, 올체크시 전체체크
// 			$("input[name=chkchk]").click(function() {
// 				var a = $(":checkbox:checked").not("#chkAll").length;
// 				var b = $("input[name=chkchk]").length;
				
// 				if(a == b){
// 					$("#chkAll").prop("checked",true);
// 				}else if(a != b){
// 					$("#chkAll").prop("checked",false);
// 				}
// 			});

// 		});
		
	</script>
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
          <li><a href="<%=request.getContextPath() %>/HW/mypageuser/main.do"> <%=(String)session.getAttribute("signedUser") %>님 반갑습니다^^ </li>
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
          <li class="nav-item"> <a class="nav-link btn btn-danger" href="<%=request.getContextPath() %>/HW/main/login.do">&nbsp;LogOut&nbsp;</a> </li>
        </ul>
      </div>
    </div>
  </nav>
    
      <header>
    	<h1 style="color:#fff;"> 주문내역 </h1>
	</header>
  
  
    <section id="contents-cart" class="contents-cart async-content" style="visibility: visible;">
       
    
   <table class="cartTable">
            <colgroup><col width="50"><col width="70"><col width="*"><col width="90"><col width="90"></colgroup>
            <thead>
            <tr class="head">
                <th scope="colgroup" id="th-product-box" colspan="2">상품정보</th>
                <th scope="col" id="th-unit-total-price">상품수량</th>
                <th scope="col" id="th-delivery-fee">상품 가격</th>
            </tr>
            </thead>
            
    <tbody id="cartTable-sku">
           
           
           
           <%
           	int cartSize = cartList.size();
           	int allProdPrice = 0;
           if(cartSize > 0){
        	   for(int i = 0 ; i <cartSize; i++){
        		   if(cartList.get(i).getCartOrder() == 1){
        		%>   
        		   
        		 <tr class="cart-deal-item " data-item-status="CHECKED" data-adult="false" data-bundle-id="4794036806" data-bundle-type="PRODUCT" data-app="" data-group-type="rocket">
                
	                <td class="cart-deal-item__image ">
                            <a href="#" class="moveProduct">
                                <img src="<%=request.getContextPath() %><%=cartList.get(i).getProdImgPath() %>" width="78" height="78" class="product-img img" alt="제품 사진">
                            </a>
                    </td>
                    <td class="product-box">
                        <div class="product-name-part">
                            <a href="#" class="product-name moveProduct modify-color"><%=cartList.get(i).getProdName() %></a><br>
                        </div>
                    </td>
                    <td class="unit-total-price">
						<div class="unit-total-sale-price"><%=cartList.get(i).getCartQty() %></div>
                    </td>
	                <td class="delivery-fee" rowspan="1" headers="th-delivery-fee">
                        <span class="delivery-fee__free"><%=cartList.get(i).getProdPrice() %></span>
                    </td>
            </tr>  
        		   
        	<%	
        			allProdPrice += cartList.get(i).getProdPrice();
        		   }
        	   }
           }
           
           %>
        
        <tr class="bundle-price-total">
            <td colspan="5"></td>
        </tr>
    
    </tbody>
            
</table>
        

            <br>
            <%-- <div class="cart-total-price" data-total-price="24900" data-discount-price="0">
                <div class="cart-total-price__inner">
                    <div class="price-area">
                        <h2 class="sr-only" id="cart-total-price">
                      	      장바구니 총 주문금액 정보
                        </h2>

                        총 상품가격
                        <em class="final-product-price">
                            	<%=allProdPrice %>
                        </em>원
                        <span class="final-sale-area">
                        
                        </span>

                        <span class="symbol-plus1"><span class="sr-only">더하기</span></span>
                        총 배송비
                        <em class="final-delivery-charge">0</em>원

                        <span class="symbol-equal1"><span class="sr-only">결과는</span></span>
                        총 주문금액
                        <em class="final-order-price" data-final-order-price="24900">
                            여기는 총 금액<span>원</span>
                        </em>
                    </div>
                </div>
            </div> --%>

            
            <div class="order-buttons">
                <a href="<%=request.getContextPath() %>/HW/prod/list.do" class="goShopping logging" >쇼핑하기</a>
            </div>
        
		</section>
	
	
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
</html>