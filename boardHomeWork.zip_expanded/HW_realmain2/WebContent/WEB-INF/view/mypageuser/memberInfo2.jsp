<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
 <%
 	List<MemberVO> memberList = (List<MemberVO>)request.getAttribute("memberList");
 	
 
 %>   
    
    
    
<!DOCTYPE html>
<html lang="kr">
<head>
	<meta charset="UTF-8">
    <title>장바구니</title>
	<link rel="stylesheet" href='<%=request.getContextPath() %>/HW_prod/css/shoppingcart-web-new.css' type="text/css">
	<script src="<%=request.getContextPath() %>/HW_prod/js/jquery-3.6.0.js"></script>

</head>
<body> 
<div id="wrap">
    <header>
  <h1>회원정보를 클릭하면 회원에게 미션을 보낼수 있습니다</h1>
	</header>
  
    <section id="contents-cart" class="contents-cart async-content" style="visibility: visible;">
       
    
   <table class="cartTable">
            <colgroup><col width="50"><col width="70"><col width="*"><col width="90"><col width="90"></colgroup>
            <thead>
            <tr class="head">
                <th scope="col" class="all-select-event"><span>&nbsp;&nbsp;회원아이디</span></th>
                <th scope="colgroup" id="th-product-box" colspan="2">회원 정보</th>
                <th scope="col" id="th-unit-total-price">성별</th>
                <th scope="col" id="th-delivery-fee">성별</th>
            </tr>
            </thead>
            
    <tbody id="cartTable-sku">
           
           <%
           	int memberSize = memberList.size();
           	int allProdPrice = 0;
           if(memberSize > 0){
        	   for(int i = 0 ; i <memberSize; i++){
        		%>   
        		 <tr class="cart-deal-item " data-item-status="CHECKED" data-adult="false" data-bundle-id="4794036806" data-bundle-type="PRODUCT" data-app="" data-group-type="rocket">
                
                    <td class="product-select-event">
                    	 <a href="#" class="moveProduct">
                             <%=memberList.get(i).getMemId() %> 
                            </a>
                    </td>
	                <td class="cart-deal-item__image ">
                            <a href="#" class="moveProduct">
                            </a>
                    </td>
                    <td class="product-box">
                        <div class="product-name-part">
                            <a href="<%=request.getContextPath() %>/HW/mypageuser/Mission.do?memId=<%=memberList.get(i).getMemId() %>" class="product-name moveProduct modify-color">
                            	<%-- <% 
										 double Height = (double)  memberList.get(i).getMemHeight()/100;
										 double Weight = (double) memberList.get(i).getMemWeight();
										double BMI = Weight/(Height*Height);
										
                              			%>
                              			,BMI수치 :<%=Math.round(BMI) %><br>
                            	키 : <%=memberList.get(i).getMemHeight() %> <br>
                              	몸무게 :<%=memberList.get(i).getMemWeight() %><br>
								병명 : <%=memberList.get(i).getMemSick() %><br>
                              	장애 : <%=memberList.get(i).getMemOb() %><br>    --%>
                              	
                              	<%=memberList.get(i).getMemId() %> 
                              	                         
                            </a><br>
                        </div>
                    </td>
                    <td class="unit-total-price">
						<div class="unit-total-sale-price"><%-- <%=memberList.get(i).getMemGender() %> --%></div>
                    </td>
	                <td class="delivery-fee" rowspan="1" headers="th-delivery-fee">
                        <span class="delivery-fee__free"><%-- <%=memberList.get(i).getMemGender() %> --%></span>
                    </td>
            </tr>  
        		   
        	<%	
        	   }
           }
           
           %>
        
        <tr class="bundle-price-total">
            <td colspan="5"></td>
        </tr>
    
    </tbody>
            
</table>
            <br>
           <%--  <div class="cart-total-price" data-total-price="24900" data-discount-price="0">
                <div class="cart-total-price__inner">
                    <div class="price-area">
                        <h2 class="sr-only" id="cart-total-price">
                      	      장바구니 총 주문금액 정보
                        </h2>

                        총 상품가격
                        <em class="final-product-price">
                            	<%=allProdPrice %>
                        </em>원
                        <span class="final-sale-area">
                        
                        </span>

                        <span class="symbol-plus1"><span class="sr-only">더하기</span></span>
                        총 배송비
                        <em class="final-delivery-charge">0</em>원

                        <span class="symbol-equal1"><span class="sr-only">결과는</span></span>
                        총 주문금액
                        <em class="final-order-price" data-final-order-price="24900">
                            여기는 총 금액<span>원</span>
                        </em>
                    </div>
                </div>
            </div> --%>
            
            <div class="order-buttons">
                <a href="<%=request.getContextPath() %>/HW/mypageuser/main.do" class="goPayment" id="btnPay">마이페이지 </a>
            </div>
		</section>
	</div>
</body>
</html>