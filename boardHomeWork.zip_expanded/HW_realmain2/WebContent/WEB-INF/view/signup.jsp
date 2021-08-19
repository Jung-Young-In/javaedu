<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src='<%=request.getContextPath() %>/HW_main/js/jquery.js'></script>
<script src='<%=request.getContextPath() %>/HW_main/js/main2.js'></script>
<script src='<%=request.getContextPath() %>/HW_main/js/plugins.js'></script>
<script src='<%=request.getContextPath() %>/HW_main/js/scripts.js'></script>
<script src='<%=request.getContextPath() %>/HW_main/js/masonry.pkgd.min.js'></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
@charset "utf-8";
* {margin:0;padding:0;}
html {height:100%;}
body {height:100%; font-family: 'Noto Sans KR';}
table, tr, td, th, div, p, em, ol, ul, li, dl, dt, dd, a, address, img, h1, h2, h3, h4, h5, h6 {font-size:11pt; color:#666;text-decoration: none;}
img {border:0; }
h1 { float:left; padding:0 0 0 0px;}
h2 {padding:0 0 0 0px;}
ul, li { list-style:none;}
ul{list-style:none; }
.red_txt{color:#ee7272;}
.blind {display:block;overflow:hidden;position:absolute;left:0;top:-5000px}
.wrap{max-width:960px; margin: 0 auto;}
.wrap.wd668{max-width:628px;}
.wrap.wd668.line{border:1px solid #ececec;padding:30px 20px;}
.container{width:100%;}
.sub_tit_txt{margin:80px 0 20px 20px; color: #2f2f2f; font-size: 25px;}
.wrap.wd668.line .sub_tit_txt{margin:0px 0 20px 20px; }
.con_term .term_txt{border:1px solid #ececec;padding:30px; height:210px; overflow-y: auto; margin:0 0 15px;}
.con_term .term_txt ul li,.con_term .term_txt p ,.con_term .term_txt div{color:#818181;font-size:12px; line-height:17px;margin: 0 0 15px;}
.left_margin{margin:0 0 0 20px;}
.con_term .term_txt div.txt_bold{font-weight: bold; margin:0 0 25px;}
.btn_wrap{text-align:center; margin:40px 0 30px;}
.btn_wrap a{color: #fff; background-color: #4380ce; font-weight: bold; padding: 10px;  height: 30px; line-height: 30px; width: 168px; display: block; text-align: center; margin: 0 auto;}
.btn_wrap a.wide{width:587px;margin: 0 0 0 20px;}
.find_txt ul li{color:#9a9a9a;font-size:13px;text-align:center; line-height:17px; margin:0 0 20px;}
.form_txtInput .checkbox_wrap {position: relative;padding: 5px;text-align: right;}
.form_txtInput .checkbox_wrap input[type="checkbox"] {position: absolute;width: 1px;height: 1px;padding: 0;margin: -1px;overflow: hidden;clip: rect(0,0,0,0);border: 0;}
.form_txtInput .checkbox_wrap input[type="checkbox"] + label {display: inline-block; line-height:14px;position: relative;padding-left: 20px;font-size: 13px;color: #818181;cursor: pointer;-webkit-user-select: none;-moz-user-select: none;-ms-user-select: none;}
.form_txtInput .checkbox_wrap input[type="checkbox"] + label:before {content: '';position: absolute;top: 0px;left: 0;width: 12px;height: 12px;text-align: center;background: #fff;border: 1px solid #c2c2c2;}
.form_txtInput .checkbox_wrap input[type="checkbox"] + label:active:before, .checkbox_wrap input[type="checkbox"]:checked + label:active:before {box-shadow: 0 1px 2px rgba(0,0,0,0.05), inset 0px 1px 3px rgba(0,0,0,0.1);}
.form_txtInput .checkbox_wrap input[type="checkbox"]:checked + label:before {background: #fff;border-color: #ddd;}
.form_txtInput .checkbox_wrap input[type="checkbox"]:checked + label:after {content: '✓';color: #0094ff;position: absolute;top:0px;left:2px;width: 7px;height: 7px;font-size: 13px;font-weight: bold;}
.exTxt{font-size:14px;color:#9a9a9a;display: block;margin:0 0 45px 20px;}
.join_form{width:100%;max-width:668px;}
.join_form table {border-spacing: 0;margin:0;padding:0; border:0;width:100%;}
.join_form table input{ border:1px solid #ececec;font-size:14px;color:#4c4c4c; height:35px; padding:10px; width:100%; float:left;}
.join_form table input.email{width:162px; display: inline-block;}
.join_form table input.email2{width:192px;}
.join_form.idpwFind table input{width:519px;}
.join_form.idpwFind table input.email{width:223px;}
.join_form.idpwFind table input.email2{width:263px}
.join_form.idpwFind table input.phone{width:182px;margin: 0 12px 0 11px;}
.join_form.idpwFind table input.phone2{width:182px;}
.join_form table input.send_number{width:383px;}
.join_form table th span{color:#404040;font-size:14px; display:inline-block; position:relative;padding:0 10px 0 0; text-indent:20px;}
.join_form table th{text-align:left;}
.join_form table td{padding:6px 0;position: relative;}
.join_form table th span:after{content:'*';font-size:13px;color:#f95427;position:absolute;top:0;right:0px;}
.join_form.idpwFind table th span:after{content:none;}
.join_form table td a.btn_confirm{display: inline-block; float:left;width:115px; height:48px;margin:5px 0 0 0px;border:1px solid #cfcfcf;background:#dedede;color:#626262;text-align:center; vertical-align: top;line-height: 50px;}
.join_form.idpwFind table td select { -webkit-appearance: none; -moz-appearance: none;  appearance: none; background: url(https://secsales.interparkb2b.co.kr/data/G94/main/sele_arr.gif) no-repeat 95% 50%;text-indent:20px; width:124px; height:50px;border:1px solid #ececec; font-size:14px; color:#ccc; float:left;}
.join_form.idpwFind table td select::-ms-expand { display: none;}
.join_form.idpwFind table td  tr.phone td select {text-align: center; text-indent: 10px;}
.join_form.idpwFind table tr.email input:after,.mar10:after,  .join_form.idpwFind table td select:after,.join_form table td a.btn_confirm:after{content:'';display: block;clear:both;}
.agree_wrap{margin:36px 0 0;}
.agree_wrap .checkbox_wrap{text-align:left;}
::placeholder {color: #c4c4c4;opacity: 1;}
:-ms-input-placeholder {color: #c4c4c4!important;}
::-ms-input-placeholder {color: #c4c4c4!important;}
.mar27{margin:27px 0 0;}
.mar10{margin:14px 5px 0 10px; display: inline-block;padding:0; float:left;}
.exform_txt{padding:12px 0 19px 0; text-align:right;color:#9a9a9a;font-size:13px;border-bottom:1px solid #ececec;}
.exform_txt span{display: inline-block;position:relative;  padding-left:10px}
.exform_txt span:after{content:'*';position:absolute;left:0;top:0; color:#f95427; font-size: 13px; font-weight: bold;}
.explan_txt {margin:3px 0 0 22px;}
.explan_txt li{color:#b2b2b2;font-size:13px; line-height:17px;}
.popWrap{border:1px solid #ececec;padding:30px; max-width:400px;width:100%;margin:30px auto 0;display: none;position: absolute;top:0;left:50%;transform: translateX(-50%);background: #fff;z-index:5;}
.popWrap.is-open{display: block;}
.popWrap .pop_txt_con .pop_exTxt{font-size:14px;color:#9a9a9a;line-height:20px;}
.popWrap .pop_txt_con .pop_exTxt span{color:#254ee9}
.popWrap .pop_btnWrap{margin:30px 0 0;}
.popWrap .pop_btnWrap a{color: #fff; background-color: #4380ce; font-weight: bold; padding: 10px;  height: 22px; line-height: 22px; width: 103px; display: block; text-align: center;}
.join_form table input.send_number::placeholder{text-align:right;}
.join_form table input.send_number:-ms-input-placeholder {text-align:right;}
.join_form table input.send_number::-ms-input-placeholder {text-align:right;}
.overlayer {  position: fixed;display: none;width: 100%;  height: 100%;  top: 0;  left: 0;  right: 0;  bottom: 0;  background-color: rgba(0,0,0,0.5);  z-index: 2;  cursor: pointer;}
.overlayer.is-open{  display: block;}
@media ( max-width: 1023px ) {
  .wrap{margin: 30px auto;}
  .wrap,.wrap.wd668.line{max-width:80vw;}
  .wrap.wd668{width:90vw;}
  .join_form{max-width:90vw;}
  .join_form table th span{text-indent: 0;font-size:13px;}
  .join_form table{width:100%;}
  .join_form table input{ border:1px solid #ececec;font-size:14px;color:#4c4c4c; height:37px; padding:10px; width:100%;}
  .join_form table input.email{width:30%; display: inline-block;}
  .join_form table input.email2{width:60%;}
  .join_form.idpwFind table input{width:100%;}
  .join_form.idpwFind table tr.email input{float:left;}
  .mar10{margin:5px 2% 0 2%; float:left;}
  .join_form.idpwFind table input.email{width:36%;}
  .join_form.idpwFind table input.email2{width:53%}
  .join_form.idpwFind table input.phone{width:30%;margin:0 4% 0 4%;}
  .join_form.idpwFind table input.phone2{width:31%;}
  .join_form table input.send_number{width: 53%; }
  .exTxt{margin:0 0 25px 0px}
  .wrap.wd668.line .sub_tit_txt,.wrap .sub_tit_txt{margin:0 0 10px 0;}
  .btn_wrap a,.btn_wrap a.wide{width:auto;margin:0;}
  .btn_wrap{overflow: hidden;}
  .join_form.idpwFind table td select{width:30%;height:37px; float:left;}
  .join_form.idpwFind table tr.email input:after,.mar10:after,  .join_form.idpwFind table td select:after{content:'';display: block;clear:both;}
  .popWrap{right: auto; max-width: 80vw; margin: 30px auto 0; left: 50%; transform: translateX(-50%);}
  .join_form table td a.btn_confirm{width: 100px; height: 35px;line-height: 35px; font-size: 12px;margin:5px 0 0 ;}
  .join_form table input.send_number + a{margin:0 0 0 5px;}
}
</style>
</head>
<body>
<form class="form-horizontal" id="fm">
 <div class="wrap wd668">
      <div class="container">
        <div class="form_txtInput">
          <h2 class="sub_tit_txt"><a href="<%=request.getContextPath() %>/HW/main/main.do"><img alt="안나와.." src="<%=request.getContextPath() %>/HW_main/IMG/logo.jpg"></a>회원가입</h2>
          <p class="exTxt">회원가입시 이메일 인증을 반드시 진행하셔야 합니다.</p>
          <div class="join_form">
            <table>
              <colgroup>
                <col width="30%"/>
                <col width="auto"/>
              </colgroup>
              <tbody>
                <tr>
                  <th><span>아이디</span></th>
                  <td><input type="text" placeholder="영어소문자와 숫자로 구성. 3글자 이상 10글자 이하 " id="userId" name="memId"></td>
                </tr>
                <tr>
                  <th><span>비밀번호</span></th>
                  <td><input type="password" placeholder="영어소문자 또는 대문자를 1개 ,숫자 1개이상 포함.8~15자리 " id="userPass" name="memPass"></td>
                </tr>
				<tr>
                  <th><span>비밀번호 확인</span></th>
                  <td><input type="password" placeholder="비밀번호 재입력" id="userPass2">
                  <!-- <button type="button" class="btn btn-info btn-sm">확인</button></td> -->
                </tr>                
                <tr>
                  <th><span>이름</span></th>
                  <td><input type="text" placeholder="영어대문자, 한글. 2글자 이상 20글자 이하" id="userName" name="memName"></td>
                </tr>
                <tr>
                  <th><span>성별</span></th>
                  <td>
                  	<div >
	                  <input type="radio" value="남자" name="memGender" id="Male" style="width: 13px;" checked="checked">
					</div>
					<div  style="float: left; width: 179px;">
						<label for="Male">남자</label>
						<label for="Male"><img alt="안나와.." src="<%=request.getContextPath() %>/HW_main/IMG/man.jpg" width="20"></label>
					</div>
					<div >
					<input type="radio" value="여자" name="memGender" id="Female" style="width: 13px;">
					</div>
					<div >
						<label for="Female">여자</label>
						<label for="Female"><img alt="안나와.." src="<%=request.getContextPath() %>/HW_main/IMG/woman.jpg" width="15"></label>
	                </div>
                  </td>
                </tr>
                <tr>
                  <th><span>생년월일</span></th>
                  <td><input type="text" placeholder="ex)940404" id="userBir" name="memIn"></td>
                </tr>
                <tr class="email">
                  <th><span>이메일</span></th>
                  <td>
	                    <input type="text"  class="email" placeholder="바른 이메일 형식을 입력하시오" id="userEmail1" name="memEmail">
	                  <!--   <span class="mar10">@</span>
	                    <input type="text"  class="email email2" placeholder="" id="userEmail2"> -->
	                    <!-- <a class="btn_confirm" onclick="emailCheck()">인증번호 발송</a> -->
	                    <button type="button" class="btn btn-info btn-sm" onclick="emailCheck()">인증번호 발송</button>
                  </td>
                </tr>
                <tr>
                  <th><span>인증번호 확인</span></th>
                  <td><input type="text" id="EmailC" class="send_number" placeholder="인증 입력">
                    <!-- <a href="javascript:;" class="btn_confirm">확인</a> -->
                  <button type="button" class="btn btn-info btn-sm" onclick="emailCheck2()">인증번호 확인</button>
                  </td>
                </tr>
                <tr>
                  <th><span>휴대폰 번호</span></th>
                  <td><input type="text" placeholder="-를 제외 입력" id="userPh" name="memHp"></td>
                </tr>
                 <tr>
                 	<th>
						<span>주소</span>
					</th>
					<td>
						<div class="col-sm-10 form-inline">
							<div style="float: left; width: 179px;">
								<input type="text" class="form-control form-inline-zip1" id="memZip" name="memZip" readonly="readonly" required>
							</div>
							<div style="float: left;" >	
								<button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#zipModal">검색</button>
							</div>
							<div  style="float: right; width: 90px;" >
								<input type="text" class="form-control form-inline-zip2" id="memAdd" name="memAddr" readonly="readonly" required>
							</div>
							<br>
							<div class="form-group-inner-down">
							<input type="text" class="form-control" id="memAdd2" name="memAdd2" placeholder="상세주소를 입력하세요" >
							</div>
						</div>
					</td>
                </tr>
                 <tr>
                  <th><span>키</span></th>
                  <td><input type="text" placeholder="숫자만 입력" id="userHeight" name="memHeight"></td>
                </tr>
                 <tr>
                  <th><span>몸무게</span></th>
                  <td><input type="text" placeholder="숫자만 입력" id="userWeight" name="memWeight"></td>
                </tr>
                 <tr>
                  <th><span>장애여부</span></th>
                  <td><input type="text" placeholder="" id="userOb" name="memOb"></td>
                </tr>
                <tr>
                  <th><span>병결여부</span></th>
                  <td><input type="text" placeholder="" id="userSick" name="memSick"></td>
                </tr>
              </tbody>
            </table>
            <div class="exform_txt"><span>표시는 필수적으로 입력해주셔야 가입이 가능합니다.</span></div>
          </div><!-- join_form E  -->
          <div class="agree_wrap">
            <div class="checkbox_wrap">
              <input type="checkbox" id="emailckeck" name="emailckeck" class="agree_chk">
              <label for="emailckeck">[필수]이메일 수신동의</label>
            </div>
            <div class="checkbox_wrap mar27">
              <input type="checkbox" id="marketing" name="marketing" class="agree_chk">
              <label for="marketing">[선택]마케팅 목적 개인정보 수집 및 이용에 대한 동의</label>
              <ul class="explan_txt">
                <li><span class="red_txt">항목 : 성별, 생년월일</span></li>
                <li>고객님께서는 위의 개인정보 및 회원정보 수정 등을 통해 추가로 수집하는 개인정보에<br/>
                  대해 동의하지 않거나 개인정보를 기재하지 않음으로써 거부하실 수 있습니다.<br/>
                  다만 이때 회원 대상 서비스가 제한될 수 있습니다.
                </li>
              </ul>
            </div>
          </div>
          <input type="hidden" name="flag" id="formFlag">
          </form>
          <div class="btn_wrap">
            <a href="#" style="height: 50px" onclick="save()">완료</a>
          </div>
        </div> <!-- form_txtInput E -->
      </div><!-- content E-->
    </div> <!-- container E -->
    
    <div class="modal fade" id="zipModal" role="dialog">
		<div class="modal-dialog">
			Modal content
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">주소 검색</h5>
				</div>
				<div class="modal-body">
					시: <select id="city" onchange="setGu()">
					</select>
					구: <select id="gu" onchange="setDong()" disabled="disabled">
						<option value="">선택하세요</option>
					</select>
					동: <select id="dong" disabled="disabled">
						<option value="">선택하세요</option>
					</select>
					<button type="button" onclick="searchZipCode()" id="btnZip">검색</button>
					<hr>
					<div id="divZipResult" style="display: none;">
						<p>사용하실 주소를 더블클릭으로 선택해주세요</p>
						<table class="table table-striped" id="tbZipResult">
						  <thead>
						    <tr>
						      <th>우편번호</th>
						      <th>주소</th>
						    </tr>
						  </thead>
						  <tbody>
						  </tbody>
						</table>
					</div>
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" id="btnCloseZipModal">닫기</button>
				</div>
			</div>
		</div>
	</div>
    
</body>

</html>