<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<title>회원상세보기</title>

<body>

  <!-- Content Wrapper. Contains page content -->
  <div >
    <!-- Main content -->
    <section class="content register-page">       
      <div class="register-box">         
          <form role="form" class="form-horizontal"  method="post">
              <div class="register-card-body" >
                  <div class="row"  style="height:200px;">
                  <div class="mailbox-attachments clearfix col-md-12" style="text-align: center;">                     
                     <div id="pictureView" data-id="${member.id }" style="border: 1px solid green; height: 200px; width: 140px; margin: 0 auto;"></div>                                          
                  </div>
               </div>
               <br />
                   <div class="form-group row" >
                     <label for="inputEmail3" class="col-sm-3 control-label text-right">아이디</label>
   
                     <div class="col-sm-9">
                       <input name="id" type="text" class="form-control" id="inputEmail3"  value="${member.id }" readonly>
                     </div>
                   </div>                  
                   <div class="form-group row">
                     <label for="inputPassword3" class="col-sm-3 control-label text-right">이  름</label>
   
                     <div class="col-sm-9">
                       <input name="pwd" type="text" class="form-control" id="inputPassword3" value="${member.name }" readonly>
                     </div>
                   </div>
                    <div class="form-group row">
                     <label for="inputPassword3" class="col-sm-3 control-label text-right">이메일</label>
   
                     <div class="col-sm-9">
                       <input name="email" type="email" class="form-control" id="inputPassword3" value="${member.email }" readonly>
                     </div>
                   </div>
                    <div class="form-group row">
                     <label for="inputPassword3" class="col-sm-3 control-label text-right">전화번호</label>
                     <div class="col-sm-9">   
                        <input name="phone" type="text" class="form-control" id="inputPassword3" value="${member.phone }" readonly>                   
                     </div>                  
                   </div>               
                 </div>  
                <div class="card-footer" >
                      <div class="row">
                         
                         <div class="col-sm-3 text-center">
                            <button type="button" onclick="location.href='modifyForm.do?id=${member.id}';" id="modifyBtn" class="btn btn-warning ">수 정</button>
                         </div>
                      
                         <div class="col-sm-3 text-center">
                            <button type="button" onclick="location.href='remove.do?id=${member.id}';" 
                            id="deleteBtn" class="btn btn-danger" >삭 제</button>
                         </div>
                         <div class="col-sm-3 text-center">
                            <button type="button" id="stopBtn" class="btn btn-info" >정 지</button>
                         </div>
                      
                         <div class="col-sm-3 text-center">
                           <button type="button" id="listBtn" onclick="CloseWindow();" class="btn btn-primary pull-right">닫 기</button>
                        </div>
                       </div>     
                </div>
              </form>
           </div>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
<script src="/resources/js/common.js" ></script>
<script>

window.onload=function(){
	
// var picture = document.getElementById("pictureView");

//배열로 다 가져올때는 예를 들어 querySelectorAll('css')와 같이 사용
MemberPictureThumb(document.querySelector('[data-id="${member.id}"]'),'${member.picture}');
}

// alert("${id}님의 상세보기입니다.");
// 실제 비밀번호를 넣어놓으면 페이지소스에 나오기 때문에 말이 안되나, 실제 Model에 담겨져 오는지 확인하기 위하여 테스트한 내용
// var adminPass = prompt("관리자 암호를 입력하세요");
// if (adminPass != '${admin.pwd}') {
// 	alert("관리자 암호가 일치하지 않습니다.");
// 	window.close();
// }
</script>
</body>









