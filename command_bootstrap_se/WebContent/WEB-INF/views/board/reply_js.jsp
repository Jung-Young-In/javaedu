<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.6/handlebars.min.js"></script>
<script type="text/x-handlebars-template" id="reply-list-template">
{{#each .}}
<div class="replyLi" >

	<i class="far fa-comment bg-yellow"></i>

 	<div class="timeline-item" >
  		<span class="time">
    		({{prettifyDate regdate}}에 작성된 댓글)
	 		<a class="btn btn-outline-secondary btn-xs" id="modifyReplyBtn" data-rno={{rno}}
				onclick="replyModifyModal_go('{{rno}}');"
				style="display:{{VisibleByLoginCheck replyer}};"
	    		data-replyer={{replyer}} data-toggle="modal" data-target="#modifyModal">COMMENT 수정</a>
  		</span>
	
  		<h3 class="timeline-header no-border"><strong style="display:none;">{{rno}}</strong><a href="#">{{replyer}}</a>&nbsp;&nbsp;&nbsp;&nbsp;<span class="timeline-body" id="{{rno}}-replytext">{{replytext}} </span></h5>
	</div>
</div>
{{/each}}	
</script>

<script type="text/x-handlebars-template" id="reply-pagination-template" >
<li class="paginate_button page-item">
	<a href="1" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
 		<i class="fas fa-angle-double-left"></i>
 	</a>
</li>
<li class="paginate_button page-item">
 	<a href="{{#if prev}}{{prevPageNum}}{{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
 		<i class="fas fa-angle-left"></i>
 	</a>
</li>
{{#each pageNum}}
<li class="paginate_button page-item {{signActive this}}">
 	<a href="{{this}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		{{this}}
 	</a>
</li>
{{/each}}
<li class="paginate_button page-item">
 	<a href="{{#if next}}{{nextPageNum}}{{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
 		<i class="fas fa-angle-right"></i>
 	</a>
</li>
<li class="paginate_button page-item">
 	<a href="{{realEndPage}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
 		<i class="fas fa-angle-double-right"></i>
 	</a>
</li>
</script>

<script>//댓글리스트
var replyPage=1;

//window.onload는 아래 jquery function을 다 읽고 실행한다는 의미의 기능
window.onload=function(){
	getPage("<%=request.getContextPath()%>/reply/list.do?bno=${board.bno}&page="+replyPage);
	
	$('.pagination').on('click','li a',function(event){
		//alert($(this).attr("href"));
		
		if($(this).attr("href")) {
			replyPage=$(this).attr("href");
			getPage("<%=request.getContextPath()%>/reply/list.do?bno=${board.bno}&page="+replyPage);
		}
		return false;
	});
}

//자바스크립트라 브라우저에서 실행하기 때문에 jsp 요소를 사용하지 못함
//Handlebars라는 객체에서 registerHelper를 이용하여 key,value 형식으로 function 이름과 function을 차례로 입력하여 작성함
Handlebars.registerHelper({
	"prettifyDate":function(timeValue) {	//Handlebars에 날짜출력함수 등록
						var dateObj=new Date(timeValue);
						var year=dateObj.getFullYear();
						var month=dateObj.getMonth()+1;
						var date=dateObj.getDate();
						return year+"-"+month+"-"+date;
	},
	"VisibleByLoginCheck":function(replyer){
					var result="none";
					
					if (replyer == "${loginUser.id}") result="visible";
					
					return result;
	},
	"signActive":function(pageNum){
		if(pageNum == replyPage) return 'active';
	}
});

function printData(replyArr,target,templateObject){	//json array 주고 줄 target을 주고 template 주면 태크에 맞춰 붙여줌
	var template=Handlebars.compile(templateObject.html());
	var html=template(replyArr);
	$('.replyLi').remove();	//자바스크립트이기 때문에 이전 리스트 삭제하고
	target.after(html);	//리스트 붙여줘야 함
}

function printPagination(pageMaker,target,templateObject){	//json array 주고 줄 target을 주고 template 주면 태크에 맞춰 붙여줌
	
	var pageNum = new Array(pageMaker.endPage-pageMaker.startPage+1);
	
	for(var i=0;i<pageMaker.endPage-pageMaker.startPage+1;i++){
		pageNum[i]=pageMaker.startPage+i;
	}
	
	pageMaker.pageNum=pageNum;
	pageMaker.prevPageNum=pageMaker.startPage-1;
	pageMaker.nextPageNum=pageMaker.endPage+1;
	
	var template=Handlebars.compile(templateObject.html());
	var html=template(pageMaker);
// 	$('ul#pagination').html("");
//	target.html(html); 
	target.html("").html(html);	//왼쪽과 같이 메서드 계속 연달아 붙여주면 순서대로 실행되는 것을 메서드 체이닝이라고 함(앞에 메서드가 다 끝나고 난 뒤어야 뒤 메서드가 실행됨. 즉, 앞에 메서드가 터지면 뒤 메서드 실행되지 않음)
}

function getPage(pageInfo){
	$.getJSON(pageInfo,function(data){	//좌측 data에 pageMaker가 들어있음
		printData(data.replyList,$('#repliesDiv'),$('#reply-list-template'));	//map형태이기 때문에 data안에 replyList와 page 중 data. 으로 replyList를 불러줌
		printPagination(data.pageMaker,$('ul#pagination'),$('#reply-pagination-template'));
	});
}


function replyRegist_go() {
	//alert("add reply btn");
	var replyer=$('#newReplyWriter').val();
	var replytext=$('#newReplyText').val();
	var bno=$('input[name="bno"]').val();
	
	//아래 조건식처럼 비교연산자가 없는 if문은 javascript에서는 boolean이 아니라 있는지, 없는지로 판단하기 때문에 자바스트립에서만 가능한 기술방식
	if (!(replyer && replytext)) {
		alert("작성자 혹은 내용은 필수입니다.");
		return;
	}

	//유효성검사로 데이터가 있는지, 없는지 확인했으니 데이터를 보내야할 차례
	var data={
			"bno":""+bno+"",	//에러방지 차원에서 int가 아닌 문자형이라는 것을 표시해주기 위해서 "" ""로 감싸줌
			"replyer":replyer,
			"replytext":replytext
	}
	$.ajax({
		url:"/reply/regist.do",
		type:"post",
		data:JSON.stringify(data),
		contentType:'application/json',
		success:function(data){
			var result=data.split(',');
			if (result[0]=="SUCCESS") {
				//bno가 넘어가기 때문에 서버가 endpage(count로)를 알수 있음(ajax 안에 success에 ajax재사용 금지) 
				//리스트 뿌릴때 var replyPage=1; 선언해준 것이 기준이 됨
				alert("댓글이 정상적으로 등록되었습니다.");
				replyPage=result[1];	//페이지 이동
				getPage("/reply/list.do?bno="+bno+"&page="+result[1]);	//리스트 출력
				$('#newReplyText').val("");	//댓글 등록후 등록칸 비워주는 역할
			}else{
				alert("댓글 등록에 실패하였습니다.");
			}
		}
	});
}

//댓글 수정
function replyModifyModal_go(rno) {
	//alert("click modify btn");
	//alert(rno);
	//var rno = rno;
	//var replyer = $('.'+rno+'-a').attr("data-replyer");
	//var replytext = $('div#'+rno+'-replytext').text();
	
	//alert("rno:"+rno+"\nreplyer:"+replyer+"\nreplytext:"+replytext);
	
	$('#replytext').val($('div#'+rno+'-replytext').text());
	$('.modal-title').text(rno);
	
}

function replyModify_go() {
	//alert("click modify btn");
	var rno = $('.modal-title').text();
	var replytext = $('#replytext').val();
	
	var sendData={
			rno:rno,	//replytext를 수정하기 위해서는 rno를 알아야 하기 때문에 받아옴
			replytext:replytext
	}
	
	$.ajax({
		url:"<%=request.getContextPath()%>/reply/modify.do",
		type:"post",
		data:JSON.stringify(sendData),	//json데이터를 String으로 받아오기 위해 stringify 해줌
		contentType:"application/json",
		success:function(result){
			alert("정상적으로 수정되었습니다.");
			getPage("<%=request.getContextPath()%>/reply/list.do?bno=${board.bno}&page="+replyPage);
		},
		error:function(error){
			alert("수정에 실패하였습니다.");
		},
		complete:function(){
			$('#modifyModal').modal('hide');
		}
	});
}

function replyRemove_go() {
	//alert("click remove btn");
	
	var rno = $('.modal-title').text();
	
	$.ajax({
		url:"<%=request.getContextPath()%>/reply/remove.do?rno="+rno+"&page="+replyPage+"&bno=${board.bno}",
		type:"get",	//고전 방식인 get방식으로 시도해본 것
		success:function(page){
			alert("정상적으로 삭제되었습니다.");
			getPage("<%=request.getContextPath()%>/reply/list.do?bno=${board.bno}&page="+page);
			replyPage=page;
		},
		error:function(error){
			alert("삭제에 실패하였습니다.");
		},
		complete:function(){
			$('#modifyModal').modal('hide');
			window.reload();
		}
	});
}
</script>
