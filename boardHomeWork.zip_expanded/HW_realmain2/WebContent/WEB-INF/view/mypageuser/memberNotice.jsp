<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en-US">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Project HomeWar</title>
<script src='<%=request.getContextPath() %>/HW_main/js/jquery.js'></script>
<link rel='stylesheet' href='<%=request.getContextPath() %>/HW_main/css/woocommerce-layout.css' type='text/css' media='all'/>
<link rel='stylesheet' href='<%=request.getContextPath() %>/HW_main/css/woocommerce-smallscreen.css' type='text/css' media='only screen and (max-width: 768px)'/>
<link rel='stylesheet' href='<%=request.getContextPath() %>/HW_main/css/woocommerce.css' type='text/css' media='all'/>
<link rel='stylesheet' href='<%=request.getContextPath() %>/HW_main/css/font-awesome.min.css' type='text/css' media='all'/>
<link rel='stylesheet' href='<%=request.getContextPath() %>/HW_main/style.css' type='text/css' media='all'/>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700' type='text/css' media='all'/>
<link rel='stylesheet' href='<%=request.getContextPath() %>/HW_main/css/easy-responsive-shortcodes.css' type='text/css' media='all'/>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="<%=request.getContextPath() %>/HW_main/css/reset.css"> <!-- CSS reset -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/HW_main/css/style.css"> <!-- Resource style -->
<script src="<%=request.getContextPath() %>/HW_main/js/modernizr.js"></script> 
<script src="<%=request.getContextPath() %>/HW_main/js/jquery-2.1.1.js"></script>
<script src="<%=request.getContextPath() %>/HW_main/js/main.js"></script> <!-- Resource jQuery -->
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
   background-color: black;
}

.topImg {
   background-image: url("/HW_main/IMG/5.jpg");
   background-repeat: no-repeat;
}

.topImg img {
   border-radius: 10px;
}


</style>
</head>
<body class="home page page-template page-template-template-portfolio page-template-template-portfolio-php">
  
  <div class="container-fluid">
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
      </ul>
      <ul class="nav navbar-nav navbar-right">
         <li>
         <a href="#"></a></li>
        <li><a href="<%=request.getContextPath() %>/HW/main/login.do" style="font-size:large; color: white;"><span class="glyphicon glyphicon-log-in" ></span> LogIn</a></li>
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
      <button class="menu-toggle"><img alt="?????????.." src="<%=request.getContextPath() %>/HW_main/IMG/logo.jpg"></button>
      <a class="skip-link screen-reader-text" href="#content">Skip to content</a>
      <div class="menu-menu-1-container" onchange="dis()">
        <ul id="menu-menu-1" class="menu">
				<li>
				<a href="<%=request.getContextPath() %>/HW/video/pt.do" class="aa">PT</a>
				<ul class="sub-menu">
					<li><a href="<%=request.getContextPath() %>/HW/video/bmi.do">BMI ?????????</a></li>
					<li><a href="#">?????? ?????????</a></li>
					<li><a href="<%=request.getContextPath() %>/HW/video/video.do">?????? ?????????</a></li>
					<li><a href="<%=request.getContextPath() %>/HW/video/exerfood.do">??????/??????</a></li>
				</ul>
				</li>
				<li>
				<a href="<%=request.getContextPath() %>/HW/prod/list.do" class="aa">?????????</a>
				<ul class="sub-menu">
					<li><a href="<%=request.getContextPath() %>/HW/prod/categoriSelect.do?prodCategori=1">?????? ??????</a></li>
					<li><a href="<%=request.getContextPath() %>/HW/prod/categoriSelect.do?prodCategori=2">?????? ??????</a></li>
					<li><a href="#">?????? ??????</a></li>
					<li><a href="#">?????? ??????</a></li>
				</ul>
				</li>
				<li id="byun"><a href="#"><img alt="?????????.." src="<%=request.getContextPath() %>/HW_main/IMG/logo.jpg" width="150" height="150"></a></li>
				<li>
				<a href="<%=request.getContextPath() %>/HW/board/list.do" class="aa">?????????</a>
				<ul class="sub-menu">
					<li><a href="#l">?????? ??????</a></li>
					<li><a href="#">Q & A</a></li>
				</ul>
				</li>
				<li>
				<a href="<%=request.getContextPath() %>/HW/pay/memberex.do" class="aa">?????????</a>
				<ul class="sub-menu">
					<li><a href="#">????????? ??????</a></li>
					<li><a href="#">????????? ??????</a></li>
				</ul>
				</li>
			</ul>
      </div>
      </nav>
      </header>

<body>
<form action="<%=request.getContextPath() %>/HW/mypageuser/memberNotice.do" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td>?????? ????????? : </td>
				<td><input type="text" name="memId" value="<%=request.getAttribute("memId2") %>" readonly="readonly"></td>
			</tr>
			<tr>
				<td>????????? ?????? : </td>
				<!-- <td><input type="text" name="exercise" value=""></td> -->
				<td><textarea rows="20" cols="20" name="exercise" ></textarea></td>
			</tr>
			<tr>
				<td>???????????? ??????: </td>
				<td><textarea rows="20" cols="20" name="food" ></textarea></td>
				<!-- <td><input type="text" name="food" value=""></td> -->
			</tr>
			<tr>
				<td>??????: </td>
				<td><input type="date" name="month"></td>
			</tr>
		</table>
		<input type="submit" value="??? ??????">
	</form>
</body>
<!-- .container -->
   <footer id="colophon" class="site-footer">
   <div class="container">
      <div class="site-info">
         <h1 style="font-family: 'Herr Von Muellerhoff';color: #ccc;font-weight:300;text-align: center;margin-bottom:0;margin-top:0;line-height:1.4;font-size: 46px;">Hw</h1>
         copyright Homewar 2021-04-21<i class="fa fa-love"></i>
      </div>
   </div>   
   </footer>
   <a href="#top" class="smoothup" title="Back to top"><span class="genericon genericon-collapse"></span></a>
</div>

</body>
<!-- #page -->
<script src='<%=request.getContextPath() %>/HW_main/js/plugins.js'></script>
<script src='<%=request.getContextPath() %>/HW_main/js/scripts.js'></script>
<script src='<%=request.getContextPath() %>/HW_main/js/masonry.pkgd.min.js'></script>

 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</html>