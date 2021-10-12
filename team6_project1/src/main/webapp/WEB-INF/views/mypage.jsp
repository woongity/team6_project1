<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	// 쇼핑내역 페이지
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
	// 내 정보 페이지
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
	// 쿠폰함 페이지
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

</script>

</head>
<body>

<div class="d-flex justify-content-center">
<div class="col-8">

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
<!-- 기간별 조회 -->
<div class="d-flex justify-content-center my-3">
	<form action="/mypage" method="get">
		<input type="date" id="fromtime" name="fromtime">
		<span class="mx-2">~</span>
		<input type="date" id="totime" name="totime">
		<input class="btn btn-outline-dark btn-sm" type="submit" value="조회">
	</form>
	<a class="btn btn-dark btn-sm mx-2" href="${pageContext.request.contextPath}/mypage">전체</a>
</div>
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
  	<c:set var="historyCount" value="0" />
  	<c:set var="couponCount" value="0" />

    <!-- 쇼핑내역 정보 -->
    <c:forEach var="item" items="${orderedList}" varStatus="oistatus">
    <c:set var="historyCount" value="${historyCount + 1}" />
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
   <!-- 쇼핑백에 상품이 없을 경우 -->
    <c:if test="${historyCount == 0}">
    <tr>
      <td colspan="12" class="text-center align-middle" style="height: 160px; width: 75vw;">
      	<h4>쇼핑내역이 없습니다.</h4>
      </td>
    </tr>
    </c:if>
  </tbody>
</table>

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
			<h6>2021. 07. 31.</h6>
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
			<c:set var="couponCount" value="${couponCount + 1}" />
	    <tr>
	      <th class="text-center align-middle">
	      	<h6>&nbsp;</h6>
	      	<h6>${coupon.cname}</h6>
	      	<h6>&nbsp;</h6>
	      </th>
	      <td class="text-center align-middle">
	      	<h6>${coupon.ccode}</h6>
	      </td>
	      <td class="align-middle">
			<h6>•${coupon.ccontent}</h6>
	      </td>
	      <td class="text-center align-middle">
	    	<h6>${coupon.crate}%</h6>
	      </td>
	      <td class="text-center align-middle">
	      	<h6>${coupon.creleasedate} ~</h6>
	      	<h6>${coupon.cexpiredate}</h6>
	      </td>      
	      <td class="text-center align-middle">
					<h6>미사용</h6>
	      </td>
	    </tr>
		</c:forEach>
	   <!-- 발급받은 쿠폰이 없을 경우 -->
	    <c:if test="${couponCount == 0}">
	    <tr>
	      <td colspan="12" class="text-center align-middle" style="height: 160px; width: 75vw;">
	      	<h4>발급받은 쿠폰이 없습니다.</h4>
	      </td>
	    </tr>
	    </c:if>
	  </tbody>
	</table>
	
</div>
	<div class="d-flex justify-content-center mt-5">
  		<a href="${pageContext.request.contextPath}/list/view" class="btn btn-outline-dark col-3 me-3">쇼핑 계속하기</a>
  		<a href="${pageContext.request.contextPath}/cart/list" class="btn btn-dark col-3 me-3">쇼핑백 보기</a>
	</div>
</div>
</div>


</body>
</html>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>