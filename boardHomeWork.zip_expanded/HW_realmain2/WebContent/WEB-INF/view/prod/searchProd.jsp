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
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel='stylesheet' href='<%=request.getContextPath() %>/HW_prod/css/style2.css' type='text/css' media='all'/>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">


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
	
	o

</script>
<style type="text/css">
.aa {
	font-size: x-large;
	padding: 40px;
}

.searchbar{
    margin-bottom: 10px;
    margin-top: auto;
    height: 40px;
    border-radius: 30px;
    padding: 20px;
    padding-left: 40px;
    }

    .search_input{
    background: none;
    width: 200px;
    line-height: 40px;
    }
    
	#list li{
	list-style-type: none; 
	float : left;
	padding-right: 105px; 
	margin-top: 30px;
	}
	
	li {
	list-style-type: none; 
	}
	

	
	#img2{
	width: 150px;
	height: 150px;
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
			<div id="content" class="site-content">
			<div id="primary" class="content-area column full">
				<main id="main" class="site-main" role="main" style="padding-top: 30px;">
					<div style="float: left; width:15%;">
						<a href="<%=request.getContextPath() %>/HW/prod/list.do">
							<img alt="Marketimg" src="<%=request.getContextPath() %>/HW_prod/IMG/Market.png">
						</a>
						<br>
						<div class="container h-100">
     						 <div class="d-flex justify-content-center h-100">
  							      <div class="searchbar">
							       	   <input onkeyup="enterkey();" class="search_input" type="text" name="" placeholder="Search" id="search_prod">
      							  </div>
    						  </div>
   						 </div>
						<table>
							<ul class="products" style="padding-top: 40px;">		
								<li ><a href="categoriSelect.do?prodCategori=1"><h3>운동기구</h3></a></li>
								<li ><a href="categoriSelect.do?prodCategori=2"><h3>보조식품</h3></a></li>
								<li ><a href=""><h3>배송 문의</h3></a></li>
								<li ><a href=""><h3>상품 문의</h3></a></li>
							</ul>
						</table>
					</div>
			
			
					
				<div style="float:right; width: 80%; padding-left:100px;">	
					<ul id ="list" style="width: 800px;">			
				
				<%
					int prodSize = prodList.size();
					
					if(prodSize > 0){
						for(int i = 0; i < prodSize; i++){
				%>	
				
					<li>
							<a href="select.do?prodNum=<%=prodList.get(i).getProdNum()%>">
							<img id="img2"s alt="방심했지" src="<%=request.getContextPath() %><%=prodList.get(i).getProdImgPath() %>">
							<h1 style="color:black; "><strong><%=prodList.get(i).getProdName() %></strong></h1>
							<span><span>판매가 : <%=prodList.get(i).getProdPrice() %></span>
							<br>
							<span style="color: red;"><h2>회원가</h2>
							<h1><%=prodList.get(i).getProdMemberPrice() %>원</h1></span>
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
	<footer id="colophon" class="site-footer">


</body>
</html>