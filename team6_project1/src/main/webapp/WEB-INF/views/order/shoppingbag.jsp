<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div class="d-flex justify-content-center">
<div class="col-8">
<h3>쇼핑백</h3>
<table class="table table-striped">
  <thead class="text-center">
    <tr>
      <th class="col-2">전체</th>
      <th class="col-6">상품정보</th>
      <th class="col-2">수량</th>
      <th class="col-2">판매가</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row" class="d-flex">
      	<div class="form-check mx-2">
		  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
		  <label class="form-check-label" for="flexCheckDefault">
		  </label>
		</div>
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
	    	<div class="me-1 btn btn-sm">-</div>
	    	<div class="me-1 fs-5">1</div>	
	    	<div class="me-1 btn btn-sm">+</div>	
	   	</div>
      </td>
      <td class="text-center align-middle">\ 36,000</td>
    </tr>

    <tr>
      <th scope="row" class="d-flex">
      	<div class="form-check mx-2">
		  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
		  <label class="form-check-label" for="flexCheckDefault">
		  </label>
		</div>
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
	    	<div class="me-1 btn btn-sm">-</div>
	    	<div class="me-1 fs-5">1</div>	
	    	<div class="me-1 btn btn-sm">+</div>	
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
<div class="d-flex justify-content-center mt-3">
	<%-- <a href="${pageContext.request.contextPath}/order/orderPage">
		<div class="btn btn-dark col-3" onclick="insert()">주문하기</div>
	</a> --%>
	<button class="btn btn-dark col-3" onclick="insert()">주문하기</button>
</div>

<script>
	function insert() {

	  let orderProduct = [
		  {"pimage1":"http://newmedia.thehandsome.com/CM/2B/SS/CM2B0KTO404W_OW_W01.jpg/dims/resize/684x1032/","pname":"오픈 칼라 니트 스웨터","pcolor":"OW","psize":"85","pquantity":1,"pprice":10000},
		  {"pimage1":"http://newmedia.thehandsome.com/CM/2B/SS/CM2B0KTO405W_BK_W01.jpg/dims/resize/684x1032/","pname":"캐시미어 니트 탑","pcolor":"BK","psize":"85","pquantity":2,"pprice":20000}
		  ];

	   $.ajax({
	     url: "orderInfo",
	     method: "post",
	     traditional: true,
	     data: {
	    	 orderProduct: JSON.stringify(orderProduct)
	     },
	     datatype:"json"
	   }).done(()=> {
		   window.location.href="${pageContext.request.contextPath}/order/orderPage";
	   });
}
</script>

</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>