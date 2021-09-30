<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<style scoped>
	.modalFont {
		font-size: 0.8rem;
	}
	
	.upper-image {
		transition: opacity 0.8s;
		opacity: 1;
	}
	
	.upper-image:hover {
	  opacity: 0.3;
	}
	

</style>

<div class="d-flex justify-content-center">
	<div class="col-8">
	<div class="row">
	<!-- image 1 -->
	<div class="text-center ps-0 pe-1" style="width: 242px;">
	  <a id="getModalBtn1"><img src="${pageContext.request.contextPath}/resources/images/male_shirt_1.jpg" class="card-img-top upper-image" id="homeImage1" alt=""></a>
	  <%-- <a id="getModalBtn1"><img src="${pageContext.request.contextPath}/resources/images/male_shirt_11.jpg" class="card-img-top upper-image" id="homeImage2" alt=""></a> --%>
	  <div class="card-body">
	    <h5 class="card-title">AVAN</h5>
	    <p class="card-text">미니멀 오버핏 폴리 셔츠 화이트</p>
   	    <p class="card-text">\ 36,000</p>
   	    <p style="color: darkKhaki;">NEW</p>
	  </div>
	</div>
		<!-- image 2 -->
	<div class="text-center ps-0 pe-1" style="width: 242px;">
	  <a id="getModalBtn2"><img src="${pageContext.request.contextPath}/resources/images/male_shirt_2.jpg" class="card-img-top upper-image" alt=""></a>
	  <div class="card-body">
	    <h5 class="card-title">AVAN</h5>
	    <p class="card-text">미니멀 오버핏 폴리 셔츠 블랙</p>
   	    <p class="card-text">\ 25,200</p>
   	    <p class="text-secondary">SOLD OUT</p>
	  </div>
	</div>
	<!-- image 3 -->
	<div class="text-center ps-0 pe-1" style="width: 242px;">
	  <a id="getModalBtn3"><img src="${pageContext.request.contextPath}/resources/images/male_shirt_3.jpg" class="card-img-top upper-image" alt=""></a>
	  <div class="card-body">
	    <h5 class="card-title">AVAN</h5>
	    <p class="card-text">미니멀 오버핏 폴리 셔츠 베이지</p>
	    <p class="card-text">\ 26,000</p>
   	    <p style="color: darkKhaki;">BEST</p>
	  </div>
	</div>
	<!-- image 4 -->
	<div class="text-center ps-0 pe-1" style="width: 242px;">
	  <a id="getModalBtn4"><img src="${pageContext.request.contextPath}/resources/images/male_shirt_4.jpg" class="card-img-top upper-image" alt=""></a>
	  <div class="card-body">
	    <h5 class="card-title">AVAN</h5>
	    <p class="card-text">미니멀 오버핏 폴리 셔츠 블루</p>
	    <p class="card-text">\ 35,200</p>
   	    <p style="color: indianRed;">SALE</p>
	  </div>
	</div>
	<!-- image 1 -->
	<div class="text-center ps-0 pe-1" style="width: 242px;">
	  <a id="getModalBtn1"><img src="${pageContext.request.contextPath}/resources/images/male_shirt_1.jpg" class="card-img-top upper-image" id="homeImage1" alt=""></a>
	  <%-- <a id="getModalBtn1"><img src="${pageContext.request.contextPath}/resources/images/male_shirt_11.jpg" class="card-img-top upper-image" id="homeImage2" alt=""></a> --%>
	  <div class="card-body">
	    <h5 class="card-title">AVAN</h5>
	    <p class="card-text">미니멀 오버핏 폴리 셔츠 화이트</p>
   	    <p class="card-text">\ 36,000</p>
   	    <p style="color: darkKhaki;">NEW</p>
	  </div>
	</div>
		<!-- image 2 -->
	<div class="text-center ps-0 pe-1" style="width: 242px;">
	  <a id="getModalBtn2"><img src="${pageContext.request.contextPath}/resources/images/male_shirt_2.jpg" class="card-img-top upper-image" alt=""></a>
	  <div class="card-body">
	    <h5 class="card-title">AVAN</h5>
	    <p class="card-text">미니멀 오버핏 폴리 셔츠 블랙</p>
   	    <p class="card-text">\ 25,200</p>
   	    <p class="text-secondary">SOLD OUT</p>
	  </div>
	</div>
	<!-- image 3 -->
	<div class="text-center ps-0 pe-1" style="width: 242px;">
	  <a id="getModalBtn3"><img src="${pageContext.request.contextPath}/resources/images/male_shirt_3.jpg" class="card-img-top upper-image" alt=""></a>
	  <div class="card-body">
	    <h5 class="card-title">AVAN</h5>
	    <p class="card-text">미니멀 오버핏 폴리 셔츠 베이지</p>
	    <p class="card-text">\ 26,000</p>
   	    <p style="color: darkKhaki;">BEST</p>
	  </div>
	</div>
	<!-- image 4 -->
	<div class="text-center ps-0 pe-1" style="width: 242px;">
	  <a id="getModalBtn4"><img src="${pageContext.request.contextPath}/resources/images/male_shirt_4.jpg" class="card-img-top upper-image" alt=""></a>
	  <div class="card-body">
	    <h5 class="card-title">AVAN</h5>
	    <p class="card-text">미니멀 오버핏 폴리 셔츠 블루</p>
	    <p class="card-text">\ 35,200</p>
   	    <p style="color: indianRed;">SALE</p>
	  </div>
	</div>
</div>
</div>
	<!-- shirt1 Modal-->
	<div class="modal fade" id="getModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title fw-bold" id="exampleModalLabel">쇼핑백</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="" style="max-width: 100%;">
				  <!-- carousel -->
				  <div style="max-width: fit-content;">
					<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel" data-bs-interval="false">
					  <div class="carousel-indicators">
					    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
					    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
					    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
					  </div>
					  <div class="carousel-inner">
					    <div class="carousel-item active">
					      <img src="${pageContext.request.contextPath}/resources/images/male_shirt_1.jpg" class="card-img-top" alt="">
					    </div>
					    <div class="carousel-item">
					      <img src="${pageContext.request.contextPath}/resources/images/male_shirt_2.jpg" class="card-img-top" alt="">
					    </div>
					    <div class="carousel-item">
					      <img src="${pageContext.request.contextPath}/resources/images/male_shirt_3.jpg" class="card-img-top" alt="">
					    </div>
					  </div>
					  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
					    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
					    <span class="visually-hidden">Previous</span>
					  </button>
					  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
					    <span class="carousel-control-next-icon" aria-hidden="true"></span>
					    <span class="visually-hidden">Next</span>
					  </button>
					</div>
					</div>
				  <div class="card-body">
				  	<div class="d-flex justify-content-between">
				    	<h6 style="margin-top: 8px;">Color&nbsp;&nbsp;</h6>	
				    	<div class="d-flex">
					    	<p class="btn modalFont">⬜White</p>
					    	<p class="btn modalFont">🟦Blue</p>	
					    	<p class="btn modalFont">⬛Black</p>	
				    	</div>  	
				  	</div>
				  	<div class="d-flex justify-content-between">
					    <h6 style="margin-top: 8px;">Size&nbsp;&nbsp;&nbsp;</h6>
	   				    	<div class="d-flex">
						    	<p class="btn modalFont">M(95)</p>
						    	<p class="btn modalFont">L(100)</p>	
						    	<p class="btn modalFont">XL(105)</p>	
					    	</div>
					</div>
				  	<div class="d-flex justify-content-between">
					    <h6 style="margin-top: 8px;">Quantity</h6>
	   				    	<div class="d-flex">
						    	<div class="me-1 btn btn-sm" onclick='changeQuantity("minus")'>-</div>
						    	<p id="countId">1</p>		
						    	<div class="me-1 btn btn-sm" onclick='changeQuantity("plus")'>+</div>	
					    	</div>
					</div>
				    <hr class="my-2">
				    <div class="d-flex justify-content-between">
   				    	<h5 class="card-title">Total</h5>
   				    	<div class="d-flex">
   				    		<h5>\</h5>
   				    		<h5 class="card-title ms-3" id="totalId">36000</h5>
   				    		<h5 id="tempId" style="display: none;">36000</h5>
			    		</div>
				  	</div>
				  <hr class="my-2">
				  <div class="d-flex justify-content-center mt-2">
					<div class="btn btn-dark btn-sm col-6" data-bs-dismiss="modal">쇼핑백 담기</div>
				  </div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<!-- shirt2 Modal-->
	<div class="modal fade" id="getModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content" style="filter: brightness(30%);">
				<div class="modal-header">
					<h5 class="modal-title fw-bold" id="exampleModalLabel">쇼핑백</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="card" style="max-width: fit-content;">
				  <img src="${pageContext.request.contextPath}/resources/images/male_shirt_2.jpg" class="" style="" alt="">
				  <div class="card-body">
				  
<!-- 				  	<div class="d-flex justify-content-between">
				    	<h6 style="margin-top: 8px;">Color&nbsp;&nbsp;</h6>	
				    	<div class="d-flex">
					    	<p class="btn modalFont">⬜White</p>
					    	<p class="btn modalFont">🟦Blue</p>	
					    	<p class="btn modalFont">⬛Black</p>	
				    	</div>  	
				  	</div>
				  	<div class="d-flex justify-content-between">
					    <h6 style="margin-top: 8px;">Size&nbsp;&nbsp;&nbsp;</h6>
	   				    	<div class="d-flex">
						    	<p class="btn modalFont">M(95)</p>
						    	<p class="btn modalFont">L(100)</p>	
						    	<p class="btn modalFont">XL(105)</p>	
					    	</div>
					</div>
				  	<div class="d-flex justify-content-between">
					    <h6 style="margin-top: 8px;">Quantity</h6>
	   				    	<div class="d-flex">
						    	<div class="me-1 btn btn-sm">-</div>
						    	<p class="btn modalFont">1</p>		
						    	<div class="me-1 btn btn-sm">+</div>	
					    	</div>
					</div>
				    <hr class="my-2">
				    <div class="d-flex justify-content-between">
   				    	<h5 class="card-title">Total</h5>
   				    	<h5 class="card-title">\ 25,200</h5>
				  	</div> 
				  <hr class="my-2">
				  <div class="d-flex justify-content-center mt-2">
					<div class="btn btn-dark btn-sm col-6" data-bs-dismiss="modal">쇼핑백 담기</div>
				  </div> -->
				  
				  <!-- 품절상품 안내 -->
				  <h5>&nbsp;</h5>
				  <h5 class="mt-3 text-center">해당 상품은 일시적으로</h5>
				  <h5 class="mb-3 text-center">품절되었습니다.</h5>
				  <h5>&nbsp;</h5>
  				  <div class="d-flex justify-content-center mt-2">
					<div class="btn btn-dark btn-sm col-6" data-bs-dismiss="modal">뒤로 가기</div>
				  </div>
				  
				</div>
			</div>
		</div>
	</div>
	</div>
	<!-- shirt3 Modal-->
	<div class="modal fade" id="getModal3" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title fw-bold" id="exampleModalLabel">쇼핑백</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="card" style="max-width: fit-content;">
				  <img src="${pageContext.request.contextPath}/resources/images/male_shirt_3.jpg" class="card-img-top" alt="">
				  <div class="card-body">
				  	<div class="d-flex justify-content-between">
				    	<h6 style="margin-top: 8px;">Color&nbsp;&nbsp;</h6>	
				    	<div class="d-flex">
					    	<p class="btn modalFont">⬜White</p>
					    	<p class="btn modalFont">🟦Blue</p>	
					    	<p class="btn modalFont">⬛Black</p>	
				    	</div>  	
				  	</div>
				  	<div class="d-flex justify-content-between">
					    <h6 style="margin-top: 8px;">Size&nbsp;&nbsp;&nbsp;</h6>
	   				    	<div class="d-flex">
						    	<p class="btn modalFont">M(95)</p>
						    	<p class="btn modalFont">L(100)</p>	
						    	<p class="btn modalFont">XL(105)</p>	
					    	</div>
					</div>
				  	<div class="d-flex justify-content-between">
					    <h6 style="margin-top: 8px;">Quantity</h6>
	   				    	<div class="d-flex">
						    	<div class="me-1 btn btn-sm">-</div>
						    	<p class="btn modalFont">1</p>		
						    	<div class="me-1 btn btn-sm">+</div>	
					    	</div>
					</div>
				    <hr class="my-2">
				    <div class="d-flex justify-content-between">
   				    	<h5 class="card-title">Total</h5>
   				    	<h5 class="card-title">\ 26,000</h5>
				  	</div>
				  <hr class="my-2">
				  <div class="d-flex justify-content-center mt-2">
					<div class="btn btn-dark btn-sm col-6" data-bs-dismiss="modal">쇼핑백 담기</div>
				  </div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<!-- shirt4 Modal-->
	<div class="modal fade" id="getModal4" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title fw-bold" id="exampleModalLabel">쇼핑백</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="" style="max-width: 100%;">
				  <img src="${pageContext.request.contextPath}/resources/images/male_shirt_4.jpg" class="card-img-top" alt="">
					
				  <div class="card-body">
				  	<div class="d-flex justify-content-between">
				    	<h6 style="margin-top: 8px;">Color&nbsp;&nbsp;</h6>	
				    	<div class="d-flex">
					    	<p class="btn modalFont">⬜White</p>
					    	<p class="btn modalFont">🟦Blue</p>	
					    	<p class="btn modalFont">⬛Black</p>	
				    	</div>  	
				  	</div>
				  	<div class="d-flex justify-content-between">
					    <h6 style="margin-top: 8px;">Size&nbsp;&nbsp;&nbsp;</h6>
	   				    	<div class="d-flex">
						    	<p class="btn modalFont">M(95)</p>
						    	<p class="btn modalFont">L(100)</p>	
						    	<p class="btn modalFont">XL(105)</p>	
					    	</div>
					</div>
				  	<div class="d-flex justify-content-between">
					    <h6 style="margin-top: 8px;">Quantity</h6>
	   				    	<div class="d-flex">
						    	<div class="me-1 btn btn-sm">-</div>
						    	<p class="btn modalFont">1</p>		
						    	<div class="me-1 btn btn-sm">+</div>	
					    	</div>
					</div>
				    <hr class="my-2">
				    <div class="d-flex justify-content-between">
   				    	<h5 class="card-title">Total</h5>
   				    	<h5 class="card-title">\ 35,200</h5>
				  	</div>
				  <hr class="my-2">
				  <div class="d-flex justify-content-center mt-2">
					<div class="btn btn-dark btn-sm col-6" data-bs-dismiss="modal">쇼핑백 담기</div>
				  </div>
				</div>
			</div>
		</div>
	</div>
	</div>
	
</div>


<c:forEach var="item" items="${producArray}">
	<img src="${pageContext.request.contextPath}/resources/handsome_img/${item.pthumbnail}"/>
	<p>${item}</p>
	<p>${item.pid}</p>
	<p>${item.pbrand}</p>
	<p>${item.pname}</p>
	<p>${item.pprice}</p>
</c:forEach>
<script>
	// modal controll
	$('#getModalBtn1').click(function(e){
	e.preventDefault();
	$('#getModal1').modal("show");
	});
	
	$('#getModalBtn2').click(function(e){
		e.preventDefault();
		$('#getModal2').modal("show");
	});
	
	$('#getModalBtn3').click(function(e){
		e.preventDefault();
		$('#getModal3').modal("show");
	});
	
	$('#getModalBtn4').click(function(e){
		e.preventDefault();
		$('#getModal4').modal("show");
	});
	
	function changeQuantity(operator) {
		const countId = document.getElementById("countId")
		const totalId = document.getElementById("totalId")
		const tempId = document.getElementById("tempId")
		let count = countId.innerText
		let total = totalId.innerText
		let temp = tempId.innerText
		
		if (operator == "plus") {
			count = parseInt(count) + 1
			total = parseInt(total) + parseInt(temp)
		} else if (operator == "minus" && count > 1) {
			count = parseInt(count) - 1
			total = parseInt(total) - parseInt(temp)
		}
		
		countId.innerText = count
		totalId.innerText = total
	}
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
