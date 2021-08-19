<%@page import="kr.or.ddit.exerBoard.vo.ExerBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<ExerBoardVO> exerBoardList = (List<ExerBoardVO>)request.getAttribute("exerBoardList");
	
	String msg = request.getParameter("msg") == null ? "" : request.getParameter("msg");

%>
    
<!doctype html>
<html lang="en">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Project HW</title>

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/HW_main/css/animate.css" >
  <link rel="stylesheet" href="<%=request.getContextPath() %>/HW_main/css/bootstrap.min.css" type="text/css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:300,400,700" >
  <link rel="stylesheet" href="<%=request.getContextPath() %>/HW_main/css/style.css">
  
  
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
      <a class="navbar-brand mr-auto" href="#"><img src="<%=request.getContextPath() %>/HW_main/images/logo.png" alt="HWlogo" /></a> 
      
      <!-- 토글 버튼 -->
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar"> <span class="navbar-toggler-icon"></span> </button>
      
      <!-- 네비게이션 링크 -->
      <div class="collapse navbar-collapse" id="collapsibleNavbar">
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
          		<a class="nav-link" href="<%=request.getContextPath() %>/HW/exerboard/list.do">게시판</a> 
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
          <li class="nav-item"> <a class="nav-link btn btn-danger" href="<%=request.getContextPath() %>/HW/main/login.do">&nbsp;LogIn&nbsp;</a> </li>
        </ul>
      </div>
    </div>
  </nav>
  
  
  <div class="container">
    <div style="width:100%; height:600px;">
<!--     <div class="fh5co-banner-text-box"> -->
      
		<table border="1">
		<tr>
			<td>글 번호</td>
			<td>작성자</td>
			<td>글 제목</td>
			<td>작성 날짜</td>
			<td>글 답글수</td>
			<td>글 조회수</td>
		</tr>
		
	<%
		int exerBoardSize = exerBoardList.size();
		if(exerBoardSize > 0){
			for(int i =0 ; i < exerBoardSize;i++){
	%>
		<tr>
			<td><%=exerBoardList.get(i).getExerBoardNum() %></td>
			<td><%=exerBoardList.get(i).getMemId() %></td>
			<td><a href="<%=request.getContextPath() %>/HW/exerboard/select.do?exerBoardNum=<%=exerBoardList.get(i).getExerBoardNum()%>"><%=exerBoardList.get(i).getExerBoardTitle() %></a></td>
			<td><%=exerBoardList.get(i).getExerBoardDate() %></td>
			<td><%=exerBoardList.get(i).getExerBoardReple() %></td>
			<td><%=exerBoardList.get(i).getExerBoardCount() %></td>
		</tr>
	<%
			}
		}else {
	%>
		<tr>
			<td colspan="7">게시글이 없습니다.</td>
		</tr>
	<%
		}
	%>
	<tr align="center">
		 <td colspan="7"><a href="<%=request.getContextPath() %>/HW/exerboard/insert.do">[글등록]</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath() %>/HW/main/main.do">[메인화면]</a></td> 
	</tr>
	</table>
	<%
		if(msg.equals("성공")){ //성공메시지가 전달되면...
			
	%>		
			<script type="text/javascript">
				alert('정상적으로 처리되었습니다.');
			</script>
	<%
		}
	%>
	
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

</body>
</html>