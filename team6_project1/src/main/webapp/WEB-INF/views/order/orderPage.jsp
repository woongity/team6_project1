<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<title>Spring Framework</title>
  <style>
  	#navSticky {
		position: sticky;
		top: 10px;
	}
  </style>
</head>
<body>

<div class="d-flex justify-content-center">
	<div class="col-8">
	
  <form action="${pageContext.request.contextPath}/order/orderComplete" method="post">
    <c:forEach var="result" items="${orderProducts}" varStatus="rstatus">
      <input type="text" id="orderPcode" name="pcode" class="form-control" value="${result.pcode}" style="display: none;">
      <input type="text" id="orderPcolor" name="pcolor" class="form-control" value="${result.pcolor}" style="display: none;">
      <input type="text" id="orderPsize" name="psize" class="form-control" value="${result.psize}" style="display: none;">
      <input type="text" id="orderPquantity" name="pquantity" class="form-control" value="${result.pquantity}" style="display: none;">
    </c:forEach>

	<h3>주문하기</h3>
		<!-- 주문 정보 -->
		<div class="d-flex">
		<div class="col-8">
		<table class="table table-striped mb-5">
		  <thead class="text-center">
		    <tr>
		      <th class="col-2"></th>
		      <th class="col-6">상품정보</th>
		      <th class="col-2">수량</th>
		      <th class="col-2">판매가</th>
		    </tr>
		  </thead>
		  <tbody>
		  	<c:set var="count" value="0" />
		  	<c:set var="total" value="0" />
		   	<c:forEach var="product" items="${orderProducts}">
 		  	<c:set var="count" value="${count + product.pquantity}" />
		  	<c:set var="total" value="${total + product.pprice * product.pquantity}" />
		    <tr>
		      <th scope="row" class="d-flex">
		      	<img src="${product.pimage1}" class="card-img-top" style="width: 6rem;" alt="">
		      </th>
		      <td>
		      	<h6 class="fw-bold">${product.pbrand}</h6>
		      	<h6>${product.pname}</h6>    	
		      	<h6>&nbsp;</h6>
		      	<h6>&nbsp;</h6>
		      	<h6 class="text-muted">Color: ${product.pcolor} / Size: ${product.psize}</h6>
		      	${multiple}
		      </td>
		      <td>
		    	<div class="d-flex justify-content-center" style="margin-top: 60%;">
			    	<div class="me-1 fs-5">${product.pquantity}</div>
			   	</div>
		      </td>
		      <td class="text-center align-middle"><span>\</span>${product.pprice * product.pquantity}</td>
		    </tr>
			</c:forEach>
			
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
		<!-- 수령인 이름 -->
		<div class="d-flex">
			<div class="col-2 text-center">
				<h6>수령인</h6>
			</div>
			<div class="col-10">
				<input type="text" id="oname" name="oname" class="form-control" value="${orderMember.mname}" style="display: block;">
			</div>
		</div>
		<!-- 수령인 휴대폰 -->
		<div class="d-flex my-2">
			<div class="col-2 text-center">
				<h6>휴대폰</h6>
			</div>
			<div class="col-10">
				<input type="text" id="otel" name="otel" class="form-control" value="${orderMember.mtel}" style="display: block;">
			</div>
		</div>
		<!-- 배송지 주소 -->
		<div class="d-flex my-3">
			<div class="col-2 text-center">
				<h6>배송지 주소</h6>
			</div>
			<div class="col-10">
				<div class="d-flex">
					<h6 class="align-middle ms-3">05717</h6>
					<h6 class="btn btn-outline-dark btn-sm ms-4">우편번호 조회</h6>			
				</div>
				<input type="text" id="oaddress" name="oaddress" class="form-control" value="${orderMember.maddress}" style="display: block;">
			</div>
		</div>
		<!-- 배송요청사항 -->
		<div class="d-flex my-2">
			<div class="col-2 text-center">
				<h6>배송요청사항</h6>
			</div>
			<div class="col-10">
				<input type="text" id="ocomment" name="ocomment" class="form-control" value="조심히 가져다주세요. 감사합니다 :)" style="display: block;">
			</div>
		</div>
		<hr class="mb-5">
		
		<h5 class="my-4">결제 정보</h5>
		<hr>
		<!-- <input type="text" id="opaymentmethod" name="opaymentmethod" class="form-control" value="12" style="display: block;"> -->
		<!-- 결제수단 선택 -->
		<div class="d-flex">
			<div class="col-2 text-center">
				<h6>결제수단 선택</h6>
			</div>
			<div class="d-flex col-10">
				<div class="form-check me-3">
				  <input class="form-check-input" type="radio" name="opaymentmethod" id="flexRadioDefault1" value="1" checked>
				  <label class="form-check-label" for="flexRadioDefault1">
				    CLICK결제
				  </label>
				</div>
				<div class="form-check me-3">
				  <input class="form-check-input" type="radio" name="opaymentmethod" id="flexRadioDefault2" value="2">
				  <label class="form-check-label" for="flexRadioDefault2">
				    신용카드
				  </label>
				</div>
				<div class="form-check me-3">
				  <input class="form-check-input" type="radio" name="opaymentmethod" id="flexRadioDefault3" value="3">
				  <label class="form-check-label" for="flexRadioDefault3">
				    계좌이체
				  </label>
				</div>
				<div class="form-check">
				  <input class="form-check-input" type="radio" name="opaymentmethod" id="flexRadioDefault4" value="4">
				  <label class="form-check-label" for="flexRadioDefault4">
				    무통장입금
				  </label>
				</div>
			</div>
		</div>
		</div>
		
		<hr class="mb-5">
		
		<!-- 최종 결제금액창 / 결제버튼 -->
		
		<div >
			<div class="ms-4" id="navSticky" style="width: 20vw;">

			<div class="border p-3">
				<h5 class="text-center">최종 결제 금액</h5>
				<hr>
			      <div>
			      	<div class="d-flex justify-content-between my-2">
				      	<h5>총</h5>
				      	<h5><span class="fw-bold ms-2" style="color: darkKhaki">${count}</span> 개 상품</h5>
			      	</div>
			      	<div class="d-flex justify-content-between mt-2">
				      	<h6>상품 합계</h6>
				      	<h6>\ ${total}</h6>	      	
			      	</div>
			      	<div class="d-flex justify-content-between mb-2">
				      	<h6>배송비</h6>
				      	<h6>\ 0</h6>	      	
			      	</div>
			      	<div class="d-flex justify-content-between mt-3">
				      	<h5>합계</h5>
				      	<h5 class="fw-bold" style="color: darkKhaki">\ ${total}</h5>	      	
			      	</div>
			 	  </div>
			</div>
			
			<div class="border-0 p-3 my-3">
				<div class="form-check mb-3">
				  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" onclick="checkAgreement()">
				  <label class="form-check-label fw-bold" for="flexCheckDefault">
				    구매자 동의
				  </label>
				</div>
				<!-- 동의약관 -->
		        <div class="px-2" style="color: #c3c4c7;">
					<h6 class="mb-3">
						주문할 상품의 상품명, 가격, 배송정보 등
						판매조건을 확인하였으며, 구매진행에 동의합니다.
						(전자상거래법 제8조 2항)
					</h6>


					<h6 class="mb-3">
						* 통합 멤버십으로 가입하시면 H.Point 적립 및 사용이 가능합니다.
					</h6>
		 	    </div>
			</div>
			
			<!-- 비활성화 -->
			<div class="d-flex justify-content-center">			
				<input class="btn btn-dark col-8" id="ableButton" value="결제하기" type="submit" style="display: none;">
			</div>
			<!-- 활성화 -->
			<div class="d-flex justify-content-center">
				<input class="btn btn-dark col-8" id="disableButton" value="결제하기" type="submit" style="display: block;" disabled>
			</div>
			
  		</form>
				
			
		</div>
		</div>
		</div>
		</div>

</div>

<script>
	
	/* 약관동의여부 체크 */
	function checkAgreement() {
		const isChecked = document.getElementById("flexCheckDefault").checked;
		const able = document.getElementById("ableButton");
		const disable = document.getElementById("disableButton");
		
		if (isChecked == true) {
			able.style.display = "block";
			disable.style.display = "none";
		} else if (isChecked == false) {
			able.style.display = "none";
			disable.style.display = "block";
		}
	}
	

</script>

	
</body>
</html>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>