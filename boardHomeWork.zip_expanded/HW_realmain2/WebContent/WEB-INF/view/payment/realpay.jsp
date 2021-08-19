<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    

<!DOCTYPE html>
<html lang="ko" dir="ltr">
<head>
    <meta charset="utf-8">
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
            crossorigin="anonymous"></script>
    <!--1. 아임포트 라이브러리 추가-->
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <title>주형이 용돈 프로젝트</title>
</head>
<body>
<div id="app">

	<% int price =  Integer.parseInt(request.getParameter("price"));%>
    <h1>주형이 용돈 프로젝트</h1>
<!--     <input v-model="impCode" value="imp68780846" > -->
    <input v-model="order.name"     placeholder="" value="">
    <input v-model="order.amount" id="price"  placeholder="" value="">
<!--     <input v-model="order.buyer_tel" placeholder="주문자 전화번호"> -->

    <button v-on:click="requestPay">결제 확인</button>
</div>

</body>
<script>
    let app = new Vue({
        el: '#app',
        data: {
            impCode : 'imp68780846',
            order: {
                name : '상품 목록이 뜨는 곳',
                amount : <%=price %>,
                buyer_tel : null,
            }
        },
        methods: {
            requestPay: function(){
                //1. 객체 초기화 (가맹점 식별코드 삽입)
                var IMP = window.IMP;
                IMP.init(this.impCode);
                //3. 결제창 호출
                IMP.request_pay({
                    pg : 'jtnet',
                    pay_method : 'card',
                    merchant_uid : 'merchant_' + new Date().getTime(),
                    name : this.order.name,
                    amount : this.order.amount,
                    buyer_tel : this.order.buyer_tel,
                }, function(rsp) {
                    if ( rsp.success ) {
                        //4. 결제 요청 결과 서버(자사)에 적용하기
                        //ajax 서버 통신 구현 -> 5. 서버사이드에서 validation check

                        //6. 최종 서버 응답 클라이언트에서 단계 4.에서 보낸 서버사이드 응답 에따라 결제 성공 실패 출력
                        var msg = '결제가 완료되었습니다.';
                        msg += '고유ID : ' + rsp.imp_uid;
                        msg += '상점 거래ID : ' + rsp.merchant_uid;
                        msg += '결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;
                    } else {
                        var msg = '결제에 실패하였습니다.';
                        msg += '에러내용 : ' + rsp.error_msg;
                    }
                    alert(msg);
                });
            }
        }
    });

</script>
</html>