<%@page import="kr.or.ddit.prod.vo.ProdVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<ProdVO> prodList = 
			(List<ProdVO>)request.getAttribute("prodList");
	String msg = request.getParameter("msg") == null ? ""
			: request.getParameter("msg");
%> 
<%  // 인증된 세션이 있는경우 로그인 된  쇼핑몰 화면으로 이동
    	if (session.getAttribute("signedUser") != null) {
    	  String redirectUrl = request.getContextPath()+"/HW/prod/listlogin.do";
    	response.sendRedirect(redirectUrl); 
    } 
%>  
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel='stylesheet' href='<%=request.getContextPath() %>/HW_prod/css/style2.css' type='text/css' media='all'/>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

<!-- Bootstrap CSS -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/HW_main/css/animate.css" >
  <link rel="stylesheet" href="<%=request.getContextPath() %>/HW_main/css/bootstrap.min.css" type="text/css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:300,400,700" >
  <link rel="stylesheet" href="<%=request.getContextPath() %>/HW_main/css/style.css">




<script type="text/javascript">

function enterkey() {
    if (window.event.keyCode == 13) {
    	var searchProd = document.getElementById('search_prod').value;
     	window.location.href = "searchProd.do?prodSearch=" + searchProd;
    }
}


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

window.onload = function changeBgColor() {
		setInterval(changeColor,2500);
	}
	
	function changeColor() {
		var r=0;
		r=Math.floor((Math.random()*4)+1);
		
		switch(r){
		case 1:
			document.getElementById("hom").src="<%=request.getContextPath() %>/HW_prod/IMG/oh1.jpg";
			break;
		case 2:
			document.getElementById("hom").src="<%=request.getContextPath() %>/HW_prod/IMG/oh2.png";
			break;
		case 3:
			document.getElementById("hom").src="<%=request.getContextPath() %>/HW_prod/IMG/oh3.jpg";
			break;
		case 4:
			document.getElementById("hom").src="<%=request.getContextPath() %>/HW_prod/IMG/oh4.png";
			break;
		
		}
	}
	
	

</script>
<style type="text/css">
.aa {
   font-size: x-large;
   padding: 40px;
}

.menu-menu-1-container ul li {
   line-height: 97px;
}

.container-fluid>.navbar-collapse, .container-fluid>.navbar-header, .container>.navbar-collapse, .container>.navbar-header {
   background-color: #1a1a1a;
}

.searchbar{
    margin-bottom: 10px;
    margin-top: auto;
    height: 40px;
    border-radius: 30px;
    padding: 10px;
    }

.search_input{
   background: none;
   width: 230px;
   caret-color:transparent;
   line-height: 40px;
   }
   
.sideNav {
   height: 300px;
   width: 227px;
   position: relative;
   z-index: 1;
   top: 0;
   left: 0;
   background-color: #111;
   overflow-x: hidden;
   transition: 0.5s;
   padding-top: 60px;
   border-radius: 5px;
}

.sideNav a {
    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 20px;
    color: #818181;
    display: block;
    transition: 0.3s;
    font-family: "Lato", sans-serif;
    margin-top: 5px;
}

.sideNav a:hover {
    color: #f1f1f1;
}

.sideNav .closebtn {
    position: absolute;
    top: 0;
    right: 25px;
    font-size: 36px;
    margin-left: 50px;
}

@media screen and (max-height: 450px) {
  .sideNav {padding-top: 15px;}
  .sideNav a {font-size: 18px;}
}

#list li{
   list-style-type: none; 
   float : left;
   padding-right: 105px; 
   padding-top: 70px;
   margin-left: 10px;
}

li {
   list-style-type: none; 
}

#list li span, h1, h2, p{
   text-align: center;
   font-family: sans-serif;
}

#list h2{
   border: 1px solid white;
   background-color: #ff8013;
   color: white;
   border-radius: 7px;
}

#list h1{
   font-size: large;
}

#list span{
   margin-bottom: 0px;
   font-size: large;
}

#img2{
   width: 150px;
   height: 150px;
}
</style>
</head>
<body class="archive post-type-archive post-type-archive-product woocommerce woocommerce-page">

<div id="page" class="container-fluid pl-0 pr-0 bg-img clearfix parallax-window2" data-parallax="scroll" data-image-src="<%=request.getContextPath() %>/HW_main/images/banner.jpg">
   <nav class="navbar navbar-expand-md navbar-dark">
    <div class="container"> 
      <!-- 로고--> 
      <a class="navbar-brand mr-auto" href="<%=request.getContextPath() %>/HW/main/main.do"><img src="<%=request.getContextPath() %>/HW_main/images/logo.png" alt="HWlogo" /></a> 
      
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
		</header>
		<!-- #masthead -->
		 <div id="content" class="site-content">
         <div id="primary" class="content-area column full">
            <main id="main" class="site-main" role="main" style="padding-top: 10px;">
               <div style="float: left; width:20%;">
                  <a href="<%=request.getContextPath() %>/HW/prod/list.do">
                     <img alt="Marketimg" src="<%=request.getContextPath() %>/HW_prod/IMG/market22.png" style="height: 50px; width: 230px; margin-left: 10px;">
                  </a>
                  <br><br>
                  <div class="container h-100">
                        <div class="d-flex justify-content-center h-100">
                            
                        </div>
                      </div>
                      <br><br><br>
                      <span style="font-size: 30px;cursor: pointer; font-family: sans-serif; color:orange;" onclick="openNav()">&#9776; open</span>
                      
                      <div id="mySideNav" class="sideNav" style="width: 227px;">
                         <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                         <a href="categoriSelect.do?prodCategori=1">운동기구</a>
                         <a href="categoriSelect.do?prodCategori=2">보조식품</a>
                         <a href="">배송 문의</a>
                         <a href="">상품 문의</a>
                      </div>
                      <img alt="Marketimg" src="<%=request.getContextPath() %>/HW_prod/IMG/shopBan2.jpg" style="margin-top: 160px; margin-left: 15px; border-radius: 5px">
<!--                   <table> -->
<!--                      <ul class="products">       -->
<!--                         <li ><a href="categoriSelect.do?prodCategori=1"><h3>운동기구</h3></a></li> -->
<!--                         <li ><a href="categoriSelect.do?prodCategori=2"><h3>보조식품</h3></a></li> -->
<!--                         <li ><a href=""><h3>배송 문의</h3></a></li> -->
<!--                         <li ><a href=""><h3>상품 문의</h3></a></li> -->
<!--                   </ul> -->
<!--                   </table> -->
               
               
               </div>
			
			
					
				<div style="float:right; width: 80%; padding-left:100px;">	
					<ul id ="list" style="width: 800px;">	
				
				 <%
               int prodSize = prodList.size();
               
               if(prodSize > 0){
                  for(int i = 0; i < prodSize; i++){
            %>   
            
                  <li>
                     <a href="<%=request.getContextPath() %>/HW/prod/select.do?prodNum=<%=prodList.get(i).getProdNum()%>">
                     <img style="border: 3px solid orange;" id="img2"s alt="상품이미지" src="<%=request.getContextPath() %><%=prodList.get(i).getProdImgPath() %>">
                     <h1 style="color:black; "><strong><span style="color: white;"><%=prodList.get(i).getProdName() %></span></strong></h1>
                     <span><span style="color: white;">판매가 : <%=prodList.get(i).getProdPrice() %>원</span>
                     <br>
                     <span><h2>회원가격</h2>
                     <h1 style="color: red;"><%=prodList.get(i).getProdMemberPrice() %>원</h1></span>
                     </a>
                  </li>
                  <%
                        }
                     }
                  %>
               </ul>
            </div>
						
			
				<div style="clear: both;">
<!-- 			 	<nav class="woocommerce-pagination"> -->
<!-- 				<ul class="page-numbers"> -->
<!-- 					<li><span class="page-numbers current">1</span></li> -->
<!-- 					<li><a class="page-numbers" href="#">2</a></li> -->
<!-- 					<li><a class="next page-numbers" href="#">→</a></li> -->
<!-- 				</ul> -->
<!-- 				</nav> -->
				</div> 
				</main>
				<!-- #main -->
			</div>
			<!-- #primary -->
		</div>
		<!-- #content -->
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
</html>