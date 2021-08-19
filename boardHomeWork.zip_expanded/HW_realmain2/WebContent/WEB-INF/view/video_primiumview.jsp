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
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PTYoutube</title>
<link  type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/HW_video/css/primiumVideo.css"/>
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
			var key = "videoSearch.do?videoKey=" +videoKey;
			$("#videoKeyInput").attr("href", key);
		});
	  
	  
} );
</script>
<style type="text/css">
.aa {
	font-size: x-large;
	padding: 40px;
}
</style>
</head>
<body class="home page page-template page-template-template-portfolio page-template-template-portfolio-php">
  
  <div class="container-fluid">
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="<%=request.getContextPath() %>/HW/main/login.do"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
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
		<button class="menu-toggle"><img alt="안나와.." src="<%=request.getContextPath() %>/HW_video/IMG/logo.jpg"></button>
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
		<nav id="videoNav">
				<a style="float: left;" href="<%=request.getContextPath() %>/HW/video/primiumVideo.do" style="margin-right: 70px;"><img alt="PTLogo" src="<%=request.getContextPath() %>/HW_video/IMG/primiumlogo.png"></a>
			<form id="videoFm">
				<input id="VideoKeyWard" name="searchVideo" type="text">
				<a id="videoKeyInput" href="">
					<button id="videoSearch" type="button" style="background-color: white; border-color: white">
						<img style="width: 30px; height: 30px;" src="<%=request.getContextPath() %>/HW_video/IMG/search.jpg">
					</button>
				</a>
			</form>
		</nav>
		<div id="videoMenu">
			<ul>
				<li>
			    	<a href="<%=request.getContextPath() %>/HW/video/video.do?videoName=<%="상체"%>"><input type="button" value="상체"></a>
				</li>

				<li>
					<a href="<%=request.getContextPath() %>/HW/video/video.do?videoName=<%="하체"%>"><input type="button" value="하체"></a>
				</li>

				<li>
					<a href="<%=request.getContextPath() %>/HW/video/video.do?videoName=<%="복근"%>"><input type="button" value="복근"></a>
				</li>

				<li>
					
					<a href="<%=request.getContextPath() %>/HW/video/video.do?videoName=<%="허리"%>"><input type="button" value="허리"></a>
				</li>
			</ul>
			</div>

			<div>
				<div id="videoSideMenu">
					<ul style="margin-top: 80px;">
						<li>
					    	<a href="<%=request.getContextPath() %>/HW/video/bmi.do" >BMI 계산기</a>
						</li>
		
						<li>
							<a href="#">운동 게시판</a>
						</li>
		
						<li>
							<a href="<%=request.getContextPath() %>/HW/video/video.do">운동 동영상</a>
						</li>
		
						<li>
							<a href="<%=request.getContextPath() %>/HW/video/exerfood.do">운동/식단</a>
						</li>
					</ul>
				</div>
				
				
				<fieldset id="videoField" style="width: 888px;">	
				<%
						for(int i = 0; i < videoList.size(); i++){
				%>
							<fieldset id="ptVideo">
							<iframe width="300" height="200"
									src="https://www.youtube.com/embed/<%=videoList.get(i).getVideoPath()%>" title="YouTube video player" frameborder="0"
							allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
							allowfullscreen></iframe><br>
							<span><%=videoList.get(i).getVideoContent()%></span>
							</fieldset>
				<%					
				
				
						}
					
				%>
				</fieldset>
			</div>	
		<!-- #main -->
	</div>
	<!-- #primary -->
</div>
		<!-- #content -->
	<!-- .container -->
<!-- 	<footer id="colophon" class="site-footer"> -->
<!-- 	<div class="container"> -->
<!-- 		<div class="site-info"> -->
<!-- 			<h1 style="font-family: 'Herr Von Muellerhoff';color: #ccc;font-weight:300;text-align: center;margin-bottom:0;margin-top:0;line-height:1.4;font-size: 46px;">밑에</h1> -->
<!-- 			밑에<i class="fa fa-love"></i> -->
<!-- 		</div> -->
<!-- 	</div>	 -->
<!-- 	</footer> -->
<!-- 	<a href="#top" class="smoothup" title="Back to top"><span class="genericon genericon-collapse"></span></a> -->
</body>
<!-- #page -->
<script src='<%=request.getContextPath() %>/HW_video/js/plugins.js'></script>
<script src='<%=request.getContextPath() %>/HW_video/js/scripts.js'></script>
<script src='<%=request.getContextPath() %>/HW_video/js/masonry.pkgd.min.js'></script>

 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</html>