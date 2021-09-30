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

	<c:forEach var="item" items="${orderedHistory}">
		<p>${item.pthumbnail}</p>
		<img src="${pageContext.request.contextPath}/resources/handsome_img/${item.pthumbnail}"/>
	</c:forEach>

<div class="d-flex justify-content-center">
<div class="col-8">
<h5>마이 페이지</h5>

<!-- 마이페이지 버튼 -->
<div class="my-3 d-flex justify-content-center">
	<div class="btn btn-outline-dark col-2 me-1">쇼핑 내역</div>
	<div class="btn btn-dark col-2 me-1">내 정보</div>
	<div class="btn btn-dark col-2">쿠폰함</div>
</div>

<!-- 쇼핑내역 -->
<div id="orderHistory" style="display: block;">
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
    <tr>
      <th class="text-center align-middle">
      	<h6>211231P10845117</h6>
      	<h6>(2021.12.31)</h6>
      </th>
      <td>
      	<img src="${pageContext.request.contextPath}/resources/images/male_shirt_1.jpg" class="card-img-top" style="width: 8rem;" alt="">
      </td>
      <td>
      <div>
      	<h6 class="fw-bold">AVAN AD201 2021 ALL</h6>
      	<h6>미니멀 오버핏 폴리 셔츠 화이트</h6>    	
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
      <td class="text-center align-middle">\ 36,000</td>
      <td class="text-center align-middle">
      	<h6>입금완료</h6>
      	<h6>(2021.12.31)</h6>
      </td>
    </tr>

    <tr>
      <th class="text-center align-middle">
      	<h6>211231P10845117</h6>
      	<h6>(2021.12.31)</h6>
      </th>
      <td>
      	<img src="${pageContext.request.contextPath}/resources/images/male_shirt_4.jpg" class="card-img-top" style="width: 8rem;" alt="">
      </td>
      <td>
      <div>
      	<h6 class="fw-bold">AVAN AD201 2021 ALL</h6>
      	<h6>미니멀 오버핏 폴리 셔츠 블루</h6>    	
      	<h6>&nbsp;</h6>
      	<h6>&nbsp;</h6>
      	<h6 class="text-muted">Color: 🟦Blue / Size: XL(105)</h6>
   	  </div>
      </td>
      <td>
    	<div class="d-flex justify-content-center" style="margin-top: 50%;">
	    	<div class="me-1 fs-5">1</div>	
	   	</div>
      </td>
      <td class="text-center align-middle">\ 35,200</td>
      <td class="text-center align-middle">
      	<h6>입금완료</h6>
      	<h6>(2021.12.31)</h6>
      </td>
    </tr>

    <tr>
      <th class="text-center align-middle">
      	<h6>210928P10234057</h6>
      	<h6>(2021.09.28)</h6>
      </th>
      <td>
      	<img src="${pageContext.request.contextPath}/resources/images/male_shirt_2.jpg" class="card-img-top" style="width: 8rem;" alt="">
      </td>
      <td>
      <div>
      	<h6 class="fw-bold">AVAN AD201 2021 ALL</h6>
      	<h6>미니멀 오버핏 폴리 셔츠 블랙</h6>    	
      	<h6>&nbsp;</h6>
      	<h6>&nbsp;</h6>
      	<h6 class="text-muted">Color: ⬛Black / Size: L(100)</h6>
   	  </div>
      </td>
      <td>
    	<div class="d-flex justify-content-center" style="margin-top: 50%;">
	    	<div class="me-1 fs-5">1</div>	
	   	</div>
      </td>
      <td class="text-center align-middle">\ 35,200</td>
      <td class="text-center align-middle">
      	<h6>입금완료</h6>
      	<h6>(2021.09.28)</h6>
      </td>
    </tr>

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
      	<h6>SPRING OVERSIZED SHIRT GREEN
</h6>    	
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


</div>
</div>


</body>
</html>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>