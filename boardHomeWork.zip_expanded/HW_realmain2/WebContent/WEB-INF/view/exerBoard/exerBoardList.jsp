<%@page import="kr.or.ddit.exerBoard.vo.ExerBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<ExerBoardVO> exerBoardList = (List<ExerBoardVO>)request.getAttribute("exerBoardList");
	
	String msg = request.getParameter("msg") == null ? "" : request.getParameter("msg");

%>
<%-- <%  // 인증된 세션이 없는경우, 해당페이지를 볼 수 없게 함.
    	if (session.getAttribute("signedUser") == null) {
    	  String redirectUrl = request.getContextPath()+"/HW/main/login.do";
    	response.sendRedirect(redirectUrl); 
    } 
%>   --%>
<!doctype html>
<html lang="en">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>공지 게시판</title>

  <!-- Bootstrap CSS -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/HW_main/css/animate.css" >
	<link rel="stylesheet" href="<%=request.getContextPath() %>/HW_main/css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:300,400,700" >
	<link rel="stylesheet" href="<%=request.getContextPath() %>/HW_main/css/style.css">
	<link rel="icon" type="image/png" href="<%=request.getContextPath() %>/HW_notice/images/icons/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/HW_notice/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/HW_notice/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/HW_notice/vendor/animate/animate.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/HW_notice/vendor/select2/select2.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/HW_notice/vendor/perfect-scrollbar/perfect-scrollbar.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/HW_notice/css/util.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/HW_notice/css/main.css">
	  
  
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
          <li class="nav-item"> <a class="nav-link btn btn-danger" href="<%=request.getContextPath() %>/HW/main/main.do">&nbsp;LogOut&nbsp;</a> </li>
        </ul>
      </div>
    </div>
  </nav>

  
  
		<div class="container">
					<br><br>
					<h1 style="color:#fff">운동 게시판</h1>
					<br><br>
			<div class="limiter">
				<div class="wrap-table100">



					<div class="table100 ver3 m-b-110">
						<div class="table100-head">
							<table>
								<thead>
									<tr class="row100 head">
										<th class="cell100 column3">작성자</th>
										<th class="cell100 column1">제목</th>
										<th class="cell100 column4">게시 일자</th>
										<th class="cell100 column5">조회수</th>
									</tr>
								</thead>
							</table>
						</div>
						<div class="table100-body js-pscroll">
							<table>
								<tbody>
								 <%
           	int exerboardSize = exerBoardList.size();
           	int allProdPrice = 0;
           if(exerboardSize> 0){
        	   for(int i = 0 ; i<exerboardSize; i++){
        		%>   
        							<tr class="row100 body">
        								<td class="cell100 column3"><%=exerBoardList.get(i).getMemId() %></td>
										<td class="cell100 column1"><a href="<%=request.getContextPath() %>/HW/exerboard/select.do?boardNum=<%=exerBoardList.get(i).getExerBoardNum()%>"><%=exerBoardList.get(i).getExerBoardTitle() %></a></td>
										<td class="cell100 column4"><%=exerBoardList.get(i).getExerBoardDate() %></td>
										<td class="cell100 column5"><%=exerBoardList.get(i).getExerBoardCount() %></td>
									</tr>
        		   
        	<%	
        	   }
           }
           %>
				
								</tbody>
							</table>
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
<script src="<%=request.getContextPath() %>/HW_notice/js/main.js"></script>
</body>
</html>