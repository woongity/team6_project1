<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<c:forEach var="oi" items="${ordereditems}">
  ${oi}
</c:forEach>
${orderMember}
${order}
${totalnumber}
${totalprice}
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
		<h6>211231P10845117</h6>
	</div>
</div>
<!-- 주문일시 -->
<div class="d-flex my-2">
	<div class="col-2 text-center">
		<h6>주문일시</h6>
	</div>
	<div class="col-10">
		<h6>2021. 12. 31. 18시 00분</h6>
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
    <tr>
      <th scope="row" class="d-flex">
      	<img src="${pageContext.request.contextPath}/resources/images/male_shirt_1.jpg" class="card-img-top" style="width: 8rem;" alt="">
      </th>
      <td>
      	<h6 class="fw-bold">AVAN AD201 2021 ALL</h6>
      	<h6>미니멀 오버핏 폴리 셔츠 화이트</h6>    	
      	<h6>&nbsp;</h6>
      	<h6>&nbsp;</h6>
      	<h6 class="text-muted">Color: ⬜White / Size: M(95)</h6>
      </td>
      <td>
    	<div class="d-flex justify-content-center" style="margin-top: 30%;">
	    	<div class="me-1 fs-5">1</div>	
	   	</div>
      </td>
      <td class="text-center align-middle">\ 36,000</td>
    </tr>

    <tr>
      <th scope="row" class="d-flex">
      	<img src="${pageContext.request.contextPath}/resources/images/male_shirt_4.jpg" class="card-img-top" style="width: 8rem;" alt="">
      </th>
      <td>
      	<h6 class="fw-bold">AVAN AD201 2021 ALL</h6>
      	<h6>미니멀 오버핏 폴리 셔츠 블루</h6>    	
      	<h6>&nbsp;</h6>
      	<h6>&nbsp;</h6>
      	<h6 class="text-muted">Color: 🟦Blue / Size: XL(105)</h6>
      </td>
      <td>
    	<div class="d-flex justify-content-center" style="margin-top: 30%;">
	    	<div class="me-1 fs-5">1</div>	
	   	</div>
      </td>
      <td class="text-center align-middle">\ 35,200</td>
    </tr>
    <tr>
      <td colspan="2"></td>
      <td colspan="2">
      <div>
      	<div class="d-flex justify-content-between mt-2">
	      	<h5>총</h5>
	      	<h5><span class="fw-bold ms-2" style="color: darkKhaki">2</span> 개 상품</h5>
      	</div>
      	<div class="d-flex justify-content-between mt-2">
	      	<h6>상품 합계</h6>
	      	<h6>\ 71,200</h6>	      	
      	</div>
      	<div class="d-flex justify-content-between mb-2">
	      	<h6>배송비</h6>
	      	<h6>\ 0</h6>	      	
      	</div>
      	<div class="d-flex justify-content-between">
	      	<h5>합계</h5>
	      	<h5 class="fw-bold" style="color: darkKhaki">\ 71,200</h5>	      	
      	</div>
 	  </div>
      </td>
    </tr>
  </tbody>
</table>

		<h5 class="mt-5">결제 수단</h5>
		<hr>
		<!-- 결제수단 -->
		<div class="d-flex mt-3">
			<div class="col-2 text-center">
				<h6>카드번호</h6>
			</div>
			<div class="col-10">
				<h6>5003 - 4567 - 9876 - 1054</h6>
			</div>
		</div>
		<!-- 결제일시 -->
		<div class="d-flex my-2">
			<div class="col-2 text-center">
				<h6>결제일시</h6>
			</div>
			<div class="col-10">
				<h6>2021. 12. 31. 18시 00분 입금</h6>
			</div>
		</div>
		<hr class="mb-5">
		
		<h5 class="my-4">주문자 정보</h5>
		<hr>
		<!-- 주문자 이름 -->
		<div class="d-flex">
			<div class="col-2 text-center">
				<h6>주문자</h6>
			</div>
			<div class="col-10">
				<h6>user</h6>
			</div>
		</div>
		<!-- 주문자 휴대폰 -->
		<div class="d-flex my-2">
			<div class="col-2 text-center">
				<h6>휴대폰</h6>
			</div>
			<div class="col-10">
				<h6>010 - 8253 - 3218</h6>
			</div>
		</div>
		<!-- 주문자 E-mail -->
		<div class="d-flex my-2">
			<div class="col-2 text-center">
				<h6>이메일</h6>
			</div>
			<div class="col-10">
				<h6>team6-miniproject@gmail.com</h6>
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
				<h6>(05717) 서울특별시 송파구 가락동 78 서관 12층 L2</h6>
			</div>
		</div>
		<!-- 수령인 이름 -->
		<div class="d-flex">
			<div class="col-2 text-center">
				<h6>수령인</h6>
			</div>
			<div class="col-10">
				<h6>user</h6>
			</div>
		</div>
		<!-- 수령인 휴대폰 -->
		<div class="d-flex my-2">
			<div class="col-2 text-center">
				<h6>휴대폰</h6>
			</div>
			<div class="col-10">
				<h6>010 - 8253 - 3218</h6>
			</div>
		</div>
		<hr class="mb-5">
		
<div class="d-flex justify-content-center mt-4">
	<a href="${pageContext.request.contextPath}/" class="btn btn-outline-dark col-3 me-3">쇼핑 계속하기</a>
	<a href="${pageContext.request.contextPath}/order/orderHistory" class="btn btn-dark col-3">쇼핑 내역보기</a>
</div>

</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>