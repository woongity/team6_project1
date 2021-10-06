<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div class="d-flex justify-content-center">
<div class="col-8">
<h3>주문완료</h3>
<hr>
<!-- 주문번호 -->
<div class="d-flex mt-3">
	<div class="col-2 text-center">
		<h6>주문번호</h6>
	</div>
	<div class="col-10">
		<h6>${order.oid}</h6>
	</div>
</div>
<!-- 주문일시 -->
<div class="d-flex my-3">
	<div class="col-2 text-center">
		<h6>주문일시</h6>
	</div>
	<div class="col-10">
		<h6>${order.otime}</h6>
	</div>
</div>
<!-- 결제수단 -->
<div class="d-flex mb-3">
	<div class="col-2 text-center">
		<h6>결제수단</h6>
	</div>
	<div class="col-10">
 		<c:if test="${order.opaymentmethod == 1}">
			<h6>CLICK결제</h6>
		</c:if>
		<c:if test="${order.opaymentmethod == 2}">
			<h6>신용카드</h6>
		</c:if>
		<c:if test="${order.opaymentmethod == 3}">
			<h6>계좌이체</h6>
		</c:if>
		<c:if test="${order.opaymentmethod == 4}">
			<h6>무통장입금</h6>
		</c:if>
	</div>
</div>
<hr class="mb-5">

<table class="table table-striped">
  <thead class="text-center">
    <tr>
    
      <th class="col-2"></th>
      <th class="col-6">상품정보</th>
      <th class="col-2">수량</th>
      <th class="col-2">판매가</th>
    </tr>
  </thead>
  <tbody>
  	<c:forEach var="oi" items="${ordereditems}">
    <tr>
      <th scope="row" class="d-flex">
      	<img src="${oi.pimage1}" class="card-img-top" style="width: 6rem;" alt="">
      </th>
      <td>
      	<h6 class="fw-bold">${oi.pbrand}</h6>
      	<h6>${oi.pname}</h6>    	
      	<h6>&nbsp;</h6>
      	<h6>&nbsp;</h6>
      	<h6 class="text-muted">Color: ${oi.pcolor} / Size: ${oi.psize}</h6>
      </td>
      <td>
    	<div class="d-flex justify-content-center" style="margin-top: 30%;">
	    	<div class="me-1 fs-5">${oi.pquantity}</div>
	   	</div>
      </td>
       <td class="text-center align-middle"><span>\</span> ${oi.pquantity * oi.oprice}</td>
    </tr>
	</c:forEach>
  
    <tr>
      <td colspan="2"></td>
      <td colspan="2">
      <div>
      	<div class="d-flex justify-content-between mt-2">
	      	<h5>총</h5>
	      	<h5><span class="fw-bold ms-2" style="color: darkKhaki">${totalnumber}</span> 개 상품</h5>
      	</div>
      	<div class="d-flex justify-content-between mt-2">
	      	<h6>상품 합계</h6>
	      	<h6>\ ${totalprice}</h6>	      	
      	</div>
      	<div class="d-flex justify-content-between mb-2">
	      	<h6>배송비</h6>
	      	<h6>\ 0</h6>	      	
      	</div>
      	<div class="d-flex justify-content-between">
	      	<h5>합계</h5>
	      	<div class="d-flex"><h5>\&nbsp;</h5><h5 class="fw-bold" style="color: darkKhaki"> ${totalprice}</h5></div>	      	
      	</div>
 	  </div>
      </td>
    </tr>
  </tbody>
</table>
		
		<h5 class="my-4">주문자 정보</h5>
		<hr>
		<!-- 주문자 이름 -->
		<div class="d-flex">
			<div class="col-2 text-center">
				<h6>주문자</h6>
			</div>
			<div class="col-10">
				<h6>${orderMember.mname}</h6>
			</div>
		</div>
		<!-- 주문자 휴대폰 -->
		<div class="d-flex my-2">
			<div class="col-2 text-center">
				<h6>휴대폰</h6>
			</div>
			<div class="col-10">
				<h6>${orderMember.mtel}</h6>
			</div>
		</div>
		<!-- 주문자 E-mail -->
		<div class="d-flex my-2">
			<div class="col-2 text-center">
				<h6>이메일</h6>
			</div>
			<div class="col-10">
				<h6>${orderMember.memail}</h6>
			</div>
		</div>
		<hr class="mb-5">
		
		<h5 class="my-4">배송지 정보</h5>
		<hr>
		<!-- 배송지 주소 -->
		<div class="d-flex">
			<div class="col-2 text-center">
				<h6>배송지 주소</h6>
			</div>
			<div class="col-10">
				<h6>${order.oaddress}</h6>
			</div>
		</div>
		<!-- 수령인 이름 -->
		<div class="d-flex my-2">
			<div class="col-2 text-center">
				<h6>수령인</h6>
			</div>
			<div class="col-10">
				<h6>${order.oname}</h6>
			</div>
		</div>
		<!-- 수령인 휴대폰 -->
		<div class="d-flex">
			<div class="col-2 text-center">
				<h6>휴대폰</h6>
			</div>
			<div class="col-10">
				<h6>${order.otel}</h6>
			</div>
		</div>
		<!-- 배송 요청사항 -->
		<div class="d-flex my-2">
			<div class="col-2 text-center">
				<h6>배송 요청사항</h6>
			</div>
			<div class="col-10">
				<h6>${order.ocomment}</h6>
			</div>
		</div>
		<hr class="mb-5">
		
<div class="d-flex justify-content-center mt-4">
	<a href="${pageContext.request.contextPath}/listView" class="btn btn-outline-dark col-3 me-3">쇼핑 계속하기</a>
	<a href="${pageContext.request.contextPath}/orderedHistory" class="btn btn-dark col-3">쇼핑 내역보기</a>
</div>

</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>