<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
 	
  	.paginator {
	  transition: 0.5s;
	  cursor: pointer;
  	}
 	
   </style>

<script>
	
	function getHistory() {
		const historyId = document.getElementById("historyPage")
		const profileId = document.getElementById("profilePage")
		const couponId = document.getElementById("couponPage")
		const historyBtnId = document.getElementById("historyBtn")
		const profileBtnId = document.getElementById("profileBtn")
		const couponBtnId = document.getElementById("couponBtn")
		
		if (historyId.style.display == "none") {
			historyId.style.display = "block"
			profileId.style.display = "none"
			couponId.style.display = "none"
			historyBtnId.style.backgroundColor = "white"
			profileBtnId.style.backgroundColor = "black"
			couponBtnId.style.backgroundColor = "black"
			historyBtnId.style.color = "black"
			profileBtnId.style.color = "white"
			couponBtnId.style.color = "white"
		}
	}
	function getProfile() {
		const historyId = document.getElementById("historyPage")
		const profileId = document.getElementById("profilePage")
		const couponId = document.getElementById("couponPage")
		const historyBtnId = document.getElementById("historyBtn")
		const profileBtnId = document.getElementById("profileBtn")
		const couponBtnId = document.getElementById("couponBtn")
		
		if (profileId.style.display == "none") {
			historyId.style.display = "none"
			profileId.style.display = "block"
			couponId.style.display = "none"
			historyBtnId.style.backgroundColor = "black"
			profileBtnId.style.backgroundColor = "white"
			couponBtnId.style.backgroundColor = "black"
			historyBtnId.style.color = "white"
			profileBtnId.style.color = "black"
			couponBtnId.style.color = "white"
		}
	}
	function getCoupon() {
		const historyId = document.getElementById("historyPage")
		const profileId = document.getElementById("profilePage")
		const couponId = document.getElementById("couponPage")
		const historyBtnId = document.getElementById("historyBtn")
		const profileBtnId = document.getElementById("profileBtn")
		const couponBtnId = document.getElementById("couponBtn")
		
		if (couponId.style.display == "none") {
			historyId.style.display = "none"
			profileId.style.display = "none"
			couponId.style.display = "block"
			historyBtnId.style.backgroundColor = "black"
			profileBtnId.style.backgroundColor = "black"
			couponBtnId.style.backgroundColor = "white"
			historyBtnId.style.color = "white"
			profileBtnId.style.color = "white"
			couponBtnId.style.color = "black"
		}
	}

	function page1() {
		const showPage1 = document.getElementById("page1");
		const showPage2 = document.getElementById("page2");
		const changeSize1 = document.getElementById("changeSize1")
		const changeSize2 = document.getElementById("changeSize2")
		
		console.log("page1()")
		if (showPage1.style.display == "none") {
			showPage1.style.display = "block";
			showPage2.style.display = "none";
			changeSize1.style.fontSize = "calc(0.8rem + .6vw)";
			changeSize2.style.fontSize = "calc(0.325rem + .6vw)";
		}
	}

	function page2() {
		const showPage1 = document.getElementById("page1");
		const showPage2 = document.getElementById("page2");
		
		console.log("page2()")
		
		if (showPage1.style.display == "block") {
			showPage1.style.display = "none";
			showPage2.style.display = "block";
			changeSize1.style.fontSize = "calc(0.325rem + .6vw)";
			changeSize2.style.fontSize = "calc(0.8rem + .6vw)";
		}
	}
</script>

</head>
<body>

<div class="d-flex justify-content-center">
<div class="col-8">

<%-- <c:forEach var="item" items="${orderedList}">
	<p>${item}</p>
</c:forEach> --%>

<p>${member}</p>

<c:forEach var="coupon" items="${couponlist}">
  <p>${coupon}</p>
</c:forEach>
<h3>마이 페이지</h3>

<!-- 마이페이지 버튼 -->
<div class="my-5 d-flex justify-content-center">
	<div class="btn btn-outline-dark col-2 me-1" id="historyBtn" onclick="getHistory()">쇼핑 내역</div>
	<div class="btn btn-dark col-2 me-1" id="profileBtn" onclick="getProfile()">내 정보</div>
	<div class="btn btn-dark col-2" id="couponBtn" onclick="getCoupon()">쿠폰 목록</div>
</div>

<!-- 쇼핑내역 -->
<div id="historyPage" style="display: block;">
<h5>쇼핑 내역</h5>
<!-- page1 -->
<table class="table table-striped" id="page1" style="display: block;">
  <thead class="text-center">
    <tr>
      <th class="col-1">주문번호</th>
      <th class="col-2"></th>
      <th class="col-4">상품정보</th>
      <th class="col-1">수량</th>
      <th class="col-2">판매가</th>
      <th class="col-2">주문상태</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach var="item" items="${orderedList}" varStatus="oistatus" begin="0" end="4">
    ${item}
    <tr>
      <th class="text-center align-middle">
      	<h6>${item.oid}</h6>
      	<h6>${item.otime}</h6>
      </th>
      <td>
      	<img src="${item.pimage1}" class="card-img-top" style="width: 6rem;" alt="">
      </td>
      <td>
      <div>
      	<h6 class="fw-bold">${item.pbrand}</h6>
      	<h6>${item.pname}</h6>    	
      	<h6>&nbsp;</h6>
      	<h6>&nbsp;</h6>
      	<h6 class="text-muted">Color: <img alt="" src="${item.pcolorimage}" style="width: 20px; height: 20px;"> ${item.pcolor} / Size: ${item.psize}</h6>
   	  </div>
      </td>
      <td class="text-center align-middle">
	    	<h5 class="me-1 fs-5">${item.pquantity}</h5>	
      </td>
      <td class="text-center align-middle">\ ${item.oprice}</td>
      <td class="text-center align-middle">
        <c:if test="${item.ostatus == 1}">
          <h6>결제완료</h6>
        </c:if>
        <c:if test="${item.ostatus == 0}">
          <h6>주문취소</h6>
        </c:if>      	
      	<h6>(${item.otime})</h6>
        <form action="order/delete" method="post">
          <!-- 주문취소 확인 Modal -->
          <div class="modal" id="getDeleteModal${oistatus.index}" tabindex="-1">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title">▶ 알림</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body d-flex justify-content-start">
                  <h5>정말 주문을 취소하시겠습니까?</h5> 
                </div>
                <div class="d-flex justify-content-center">
                  <img alt="" src="${pageContext.request.contextPath}/resources/images/error_cat.png" class="pop" style="width: 50%;">
                </div>
                <div class="d-flex justify-content-end p-3">             
                  <input class="btn btn-dark me-2" value="확인" type="submit">
                  <button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal">취소</button>
                </div>
              </div>
            </div>
          </div>
          <input type="text" id="oid" name="oid" class="form-control" value="${item.oid}" style="display: none;">
          <c:if test="${item.ostatus == 1}">
          	<input class="btn btn-sm" id="deleteModalBtn${oistatus.index}" value="[ 주문취소 ]" type="submit">
          </c:if>
          
        </form>
      </td>
    </tr>
    
    <script>
	    // deleteModal
		$('#deleteModalBtn${oistatus.index}').click(function(e){
			e.preventDefault();
			$('#getDeleteModal${oistatus.index}').modal("show");
		});
    </script>
    
    </c:forEach>
  </tbody>
</table>

<!-- page2 -->
<table class="table table-striped" id="page2" style="display: none;">
  <thead class="text-center">
    <tr>
      <th class="col-1">주문번호</th>
      <th class="col-2"></th>
      <th class="col-4">상품정보</th>
      <th class="col-1">수량</th>
      <th class="col-2">판매가</th>
      <th class="col-2">주문상태</th>
    </tr>
  </thead>
  <tbody>
     <tr>
      <th class="text-center align-middle">
      	<h6>211131P10135229</h6>
      	<h6>(2021.11.31)</h6>
      </th>
      <td>
      	<img src="${pageContext.request.contextPath}/resources/images/female_shirt_1.jpg" class="card-img-top" style="width: 8rem;" alt="">
      </td>
      <td>
      <div>
      	<h6 class="fw-bold">NICK&NICOLE N_21SUMMER 2021 S/S</h6>
      	<h6>엠브로더리 코튼 셔츠 화이트</h6>    	
      	<h6>&nbsp;</h6>
      	<h6>&nbsp;</h6>
      	<h6 class="text-muted">Color: ⬜White / Size: M(95)</h6>
   	  </div>
      </td>
      <td>
    	<div class="d-flex justify-content-center" style="margin-top: 50%;">
	    	<div class="me-1 fs-5">1</div>	
	   	</div>
      </td>
      <td class="text-center align-middle">\ 56,000</td>
      <td class="text-center align-middle">
      	<h6>입금완료</h6>
      	<h6>(2021.11.31)</h6>
      </td>
    </tr>

    <tr>
      <th class="text-center align-middle">
      	<h6>211131P10412368</h6>
      	<h6>(2021.11.31)</h6>
      </th>
      <td>
      	<img src="${pageContext.request.contextPath}/resources/images/female_shirt_2.jpg" class="card-img-top" style="width: 8rem;" alt="">
      </td>
      <td>
      <div>
      	<h6 class="fw-bold">AVAN AD307 2020 F/W</h6>
      	<h6>로얄블루 오버핏 울 체크셔츠</h6>    	
      	<h6>&nbsp;</h6>
      	<h6>&nbsp;</h6>
      	<h6 class="text-muted">Color: 🟦Blue / Size: L(100)</h6>
   	  </div>
      </td>
      <td>
    	<div class="d-flex justify-content-center" style="margin-top: 50%;">
	    	<div class="me-1 fs-5">1</div>	
	   	</div>
      </td>
      <td class="text-center align-middle">\ 35,900</td>
      <td class="text-center align-middle">
      	<h6>배송완료</h6>
      	<h6>(2021.11.31)</h6>
      </td>
    </tr>

    <tr>
      <th class="text-center align-middle">
      	<h6>211131P10136490</h6>
      	<h6>(2021.11.31)</h6>
      </th>
      <td>
      	<img src="${pageContext.request.contextPath}/resources/images/female_shirt_3.jpg" class="card-img-top" style="width: 8rem;" alt="">
      </td>
      <td>
      <div>
      	<h6 class="fw-bold">AVAN 20FW35 2020 ALL</h6>
      	<h6>SPRING OVERSIZED SHIRT GREEN</h6>    	
      	<h6>&nbsp;</h6>
      	<h6>&nbsp;</h6>
      	<h6 class="text-muted">Color: 🟩Green / Size: L(100)</h6>
   	  </div>
      </td>
      <td>
    	<div class="d-flex justify-content-center" style="margin-top: 50%;">
	    	<div class="me-1 fs-5">1</div>	
	   	</div>
      </td>
      <td class="text-center align-middle">\ 45,200</td>
      <td class="text-center align-middle">
      	<h6>배송완료</h6>
      	<h6>(2021.11.31)</h6>
      </td>
    </tr>

  </tbody>
</table>

<div class="d-flex justify-content-center mt-4">
	<h3 class="mx-3 paginator" id="changeSize1" onclick="page1()" style="font-size: calc(0.8rem + .6vw);">1페이지</h3>
	<h3 class="paginator"  onclick="page2()" id="changeSize2" style="font-size: calc(0.325rem + .6vw);">2페이지</h3>
</div>
</div>

<!-- 프로필 -->
<div id="profilePage" style="display: none;">
	<h5>내 정보</h5>
	<hr class="my-3">
	<div class="d-flex my-3">
		<div class="col-2 text-center">
			<h6>아이디</h6>
		</div>
		<div class="col-10">
			<h6>${member.mid}</h6>
		</div>
	</div>
	<div class="d-flex my-3">
		<div class="col-2 text-center">
			<h6>비밀번호</h6>
		</div>
		<div class="col-10">
			<h6 class="btn btn-outline-dark btn-sm">비밀번호 변경하기</h6>
		</div>
	</div>
	<div class="d-flex my-3">
		<div class="col-2 text-center">
			<h6>이메일</h6>
		</div>
		<div class="col-10">
			<h6>${member.memail}</h6>
		</div>
	</div>
	<div class="d-flex my-3">
		<div class="col-2 text-center">
			<h6>이름</h6>
		</div>
		<div class="col-10">
			<h6>${member.mname}</h6>
		</div>
	</div>
    <div class="d-flex my-3">
      <div class="col-2 text-center">
        <h6>전화번호</h6>
      </div>
      <div class="col-10">
        <h6>${member.mtel}</h6>
      </div>
    </div>
	<div class="d-flex my-3">
		<div class="col-2 text-center">
			<h6>생년월일</h6>
		</div>
		<div class="col-10">
			<h6>1993. 06. 02.</h6>
		</div>
	</div>
	<hr>
	<div class="d-flex my-3">
		<div class="col-2 text-center" style="margin-top: 5vh;">
			<h6>이메일 / SMS</h6>
			<h6>수신 동의여부</h6>
		</div>
		<div class="col-10">
			<h6>THE HANDSOME에서 제공하는 서비스 수신동의여부를 선택해주세요.</h6>
			<h6>선택하시면 THE HANDSOME에서 진행하는 공지 및 이벤트소식을 받아보실 수 있습니다.</h6>
			<h6 style="color: #c3c4c7;">단, 가입 및 주문/결제와 재입고 알림등에 관련된 이메일과 SMS는 동의여부와 관계없이 발송됩니다.</h6>
			<!-- 수신여부 체크 -->
			<div class="d-flex mt-4">
				<div class="d-flex me-5">
					<h6 class="me-3">•이메일</h6>
					<div class="form-check me-3">
					  <input class="form-check-input" type="radio" name="flexRadioDefault1" id="flexRadioDefault1" checked>
					  <label class="form-check-label" for="flexRadioDefault1">
					    예
					  </label>
					</div>
					<div class="form-check me-3">
					  <input class="form-check-input" type="radio" name="flexRadioDefault1" id="flexRadioDefault2">
					  <label class="form-check-label" for="flexRadioDefault2">
					    아니오
					  </label>
					</div>
				</div>
				<div class="d-flex">
					<h6 class="me-3">•SMS</h6>
					<div class="form-check me-3">
					  <input class="form-check-input" type="radio" name="flexRadioDefault2" id="flexRadioDefault1" checked>
					  <label class="form-check-label" for="flexRadioDefault1">
					    예
					  </label>
					</div>
					<div class="form-check">
					  <input class="form-check-input" type="radio" name="flexRadioDefault2" id="flexRadioDefault2">
					  <label class="form-check-label" for="flexRadioDefault2">
					    아니오
					  </label>
					</div>
				</div>
			</div>

			
		</div>
	</div>
	<hr>
</div>


<!-- 쿠폰 목록 -->
<div id="couponPage" style="display: none;">
	<h5>쿠폰 목록</h5>
	<table class="table table-striped" id="page1" style="display: block;">
	  <thead class="text-center">
	    <tr>
	      <th class="col-2">종류</th>
	      <th class="col-2">쿠폰번호</th>
	      <th class="col-4">내용</th>
	      <th class="col-1">할인</th>
	      <th class="col-2">유효기간</th>
	      <th class="col-1">사용일자</th>
	    </tr>
	  </thead>
	  <tbody>
	  	<c:forEach var="coupon" items="${couponlist}">
		  <p>${coupon}</p>
		
	    <tr>
	      <th class="text-center align-middle">
	      	<h6>${coupon.cname}</h6>
	      </th>
	      <td class="text-center align-middle">
	      	<h6>${coupon.ccode}</h6>
	      </td>
	      <td class="align-middle">
			<h6>•${coupon.ccontent}</h6>
	      </td>
	      <td class="text-center align-middle">
	    	<h6>${coupon.crate}</h6>
	      </td>
	      <td class="text-center align-middle">
	      	<h6>${coupon.creleasedate} ~</h6>
	      	<h6>${coupon.cexpiredate}</h6>
	      </td>
	      <td class="text-center align-middle">
	      ${coupon.cstatus}
	      ${coupon.creleasedate}
	      	<c:if test="${coupon.cstatus == 0}">
	      		<h6>미사용</h6>
	      	</c:if>
	      	<c:if test="${coupon.cstatus == 1}">
	      		<h6>${coupon.creleasedate}</h6>
	      	</c:if>
	      	<c:if test="${coupon.cstatus == 2}">
	      		<h6>기간만료</h6>
	      	</c:if>
	      	
	      </td>
	    </tr>
		</c:forEach>
		
<!-- 	    <tr>
	      <th class="text-center align-middle">
	      	<h6>신규회원 전용</h6>
	      	<h6>정상 15% 쿠폰</h6>
	      </th>
	      <td class="text-center align-middle">
	      	<h6>BT2-021-092-3HU-HSB-6G1</h6>
	      </td>
	      <td>
	      	<h6>•THE HANDSOME에 신규가입하신 회원님께 드리는 혜택이며, 정상 상품 구매 시 15% 할인이 적용됩니다.</h6>
	      	<h6>•아울렛 제외 / 오프라인 매장 불가</h6>    	
	      </td>
	      <td class="text-center align-middle">
			<h6>15%</h6>
	      </td>
	      <td class="text-center align-middle">
	      	<h6>2021. 09. 23. ~</h6>
	      	<h6>2021. 10. 23.</h6>
	      </td>
	      <td class="text-center align-middle">
	      	<h6>2021. 10. 01.</h6>
	      </td>
	    </tr>
	
	    <tr>
	      <th class="text-center align-middle">
	      	<h6>신규회원 전용</h6>
	      	<h6>아울렛 5% 쿠폰</h6>
	      </th>
	      <td>
	      	<h6>OU2-021-092-3HA-Y28-W9Z</h6>
	      </td>
	      <td>
	      <div>	
	      	<h6>•THE HANDSOME에 신규가입하신 회원님께 드리는 혜택이며, 아울렛 상품 구매 시 5% 할인이 적용됩니다.</h6>
	      	<h6>•오프라인 매장 불가</h6>  
	   	  </div>
	      </td>
	      <td class="text-center align-middle">
			<h6>5%</h6>
	      </td>
	      <td class="text-center align-middle">
	      	<h6>2021. 09. 23. ~</h6>
	      	<h6>2021. 10. 23.</h6>
	      </td>
	      <td class="text-center align-middle">
	      	<h6>미사용</h6>
	      </td>
	    </tr>
	 -->
	  </tbody>
	</table>

</div>

</div>
</div>


</body>
</html>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>