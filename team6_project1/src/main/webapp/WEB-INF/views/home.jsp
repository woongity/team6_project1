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
	
<%-- 	<c:forEach var="item" begin="0" end="3" items="${productArray}" varStatus="status">
	<p>${item.pcode}</p>
	<p>${item.pbrand}</p>
	<p>${item.pname}</p>
	<p>${item.pprice}</p>
	<p>${item.pimage1}</p>
	<p>${item.pimage2}</p>
	<p>${item.pimage3}</p>
	<p>${item.pstock}</p>
	<p>${status.index}</p>
	<p>${item.pcode}</p>
	</c:forEach>  --%>


	<c:forEach var="item" begin="0" end="11" items="${productArray}" varStatus="status">


	<!-- 상품리스트 -->
	<div class="text-center ps-0 pe-1" style="width: 16.5vw;">
	  <a id="getModalBtn${status.index}"><img src="${item.pimage1}" class="card-img-top upper-image" id="homeImage1" alt=""></a>
	  
	  <div class="card-body">
	    <h5 class="card-title">${item.pbrand}</h5>
	    <p class="card-text">${item.pname}</p>
	    <p class="card-text">${item.pcode}</p>
   	    <p class="card-text">\ ${item.pprice}</p>
	   	<c:if test="${item.pstock < 1}">
		    <p class="text-secondary">SOLD OUT</p>
		</c:if>
	   	<c:if test="${item.pstock > 0 && item.pstock < 6}">
		    <p style="color: darkKhaki;">BEST</p>
		</c:if>
	   	<c:if test="${item.pstock > 5 && item.pstock < 10}">
		    <p style="color: indianRed;">SALE</p>
		</c:if>
	   	<c:if test="${item.pstock > 9}">
		    <p style="color: darkKhaki;">NEW</p>
		</c:if>
	  </div>
	</div>

	<!-- 상품 Modal-->
	<div class="modal fade" id="getModal${status.index}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title fw-bold" id="exampleModalLabel">쇼핑백</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="" style="max-width: 100%;">
				  <!-- 상품 Modal - Carousel -->
				  <div style="max-width: fit-content;">
					<div id="carouselExampleIndicators${status.index}" class="carousel slide" data-bs-ride="carousel" data-bs-interval="false">
					  <div class="carousel-indicators">
					    <button type="button" data-bs-target="#carouselExampleIndicators${status.index}" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
					    <button type="button" data-bs-target="#carouselExampleIndicators${status.index}" data-bs-slide-to="1" aria-label="Slide 2"></button>
					    <button type="button" data-bs-target="#carouselExampleIndicators${status.index}" data-bs-slide-to="2" aria-label="Slide 3"></button>
					  </div>
					  <div class="carousel-inner">
					    <div class="carousel-item active">
					      <img src="${item.pimage1}" class="card-img-top" alt="">
					    </div>
					    <div class="carousel-item">
					      <img src="${item.pimage2}" class="card-img-top" alt="">
					    </div>
					    <div class="carousel-item">
					      <img src="${item.pimage3}" class="card-img-top" alt="">
					    </div>
					  </div>
					  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators${status.index}" data-bs-slide="prev">
					    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
					    <span class="visually-hidden">Previous</span>
					  </button>
					  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators${status.index}" data-bs-slide="next">
					    <span class="carousel-control-next-icon" aria-hidden="true"></span>
					    <span class="visually-hidden">Next</span>
					  </button>
					</div>
					</div>
				
				<form action="put" method="post">
				    	<input type="text" id="pcode" name="pcode" class="form-control" value="${item.pcode}">
<%-- 				    	<input type="text" id="param3" name="color" class="form-control" value="${item.pcolor}" >
				    	<input type="text" id="param3" name="size" class="form-control" value="${item.psize}"> --%>

				  <div class="card-body">
				  	<div class="d-flex justify-content-between">
				    	<h6 style="margin-top: 8px;">Color&nbsp;&nbsp;</h6>	
				    	<div class="d-flex">
				    	<!-- Color 선택 -->
 						<div class="form-check">
						  <input class="form-check-input" type="radio" name="color" id="colorId${status.index}" value="EK">
						  <label class="form-check-label" for="colorId${status.index}">
						    ${item.pcolor}
						  </label>
						</div>
<%-- 						<div class="form-check mx-3">
						  <input class="form-check-input" type="radio" name="color" id="colorId${status.index + 1000}" value="BB">
						  <label class="form-check-label" for="colorId${status.index + 1000}">
						    BBB
						  </label>
						</div> --%>
					    	<%-- <img alt="" src="${item.pcolorimage}" style="width: 16px; height: 16px;"> --%>
				    	</div>  	
				  	</div>
				  	<div class="d-flex justify-content-between">
					    <h6 style="margin-top: 8px;">Size&nbsp;&nbsp;&nbsp;</h6>
	   				    	<div class="d-flex">
								<!-- Size 선택 -->
		 						<div class="form-check">
								  <input class="form-check-input" type="radio" name="size" id="sizeId${status.index}" value="64">
								  <label class="form-check-label" for="sizeId${status.index}">
								    ${item.psize}
								  </label>
								</div>
<%-- 								<div class="form-check mx-3">
								  <input class="form-check-input" type="radio" name="size" id="sizeId${status.index + 1000}" value="22">
								  <label class="form-check-label" for="sizeId${status.index + 1000}">
								    2
								  </label>
								</div>	 --%>
					    	</div>
					</div>
				    	<input type="text" id="param3" name="quantity" class="form-control" value="1">
				    	<input type="text" id="param3" name="price" class="form-control" value="${item.pprice}">
				  	<div class="d-flex justify-content-between">
					    <h6 style="margin-top: 8px;">Quantity</h6>
	   				    	<div class="d-flex">
						    	<div class="me-1 btn btn-sm" onclick='changeQuantity${status.index}("minus")'>-</div>
						    	<p id="countId${status.index}">1</p>		
						    	<div class="me-1 btn btn-sm" onclick='changeQuantity${status.index}("plus")'>+</div>	
					    	</div>
					</div>
				    <hr class="my-2">
				    <div class="d-flex justify-content-between">
   				    	<h5 class="card-title">Total</h5>
   				    	<div class="d-flex">
   				    		<h5>\</h5>
   				    		<h5 class="card-title ms-3" id="totalId${status.index}">${item.pprice}</h5>
   				    		<h5 id="tempId${status.index}" style="display: none;">${item.pprice}</h5>
			    		</div>
				  	</div>
				  <hr class="my-2">
				  <div class="d-flex justify-content-center mt-2">
					<input class="btn btn-dark btn-sm col-6" data-bs-dismiss="modal" value="쇼핑백 담기" type="submit">
					<!-- onclick="putShoppingBag${status.index}()" -->
				  </div>
				</div>
				</form>
				
			</div>
		</div>
	</div>
	</div>
	
	<script>
	// modal controll
	$('#getModalBtn${status.index}').click(function(e){
	e.preventDefault();
	$('#getModal${status.index}').modal("show");
	});
	
	function changeQuantity${status.index}(operator) {
		const countId = document.getElementById("countId${status.index}")
		const totalId = document.getElementById("totalId${status.index}")
		const tempId = document.getElementById("tempId${status.index}")
		let count = countId${status.index}.innerText
		let total = totalId${status.index}.innerText
		let temp = tempId${status.index}.innerText
		
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
	
/*  	function putShoppingBag${status.index}() {
		let color = ""
		let size = "";
		
		console.log(${status.index})
		const pcode = "asdf"
		const isCheckedColor = document.getElementById("colorId${status.index}").checked;
		const isCheckedSize = document.getElementById("sizeId${status.index}").checked;
		const quntity = 1
		const price = 1

		console.log(${status.index})
		console.log(isCheckedColor)
		console.log(isCheckedSize)
		
		if (isCheckedColor) {
			color = $("#colorId${status.index}").val()
		}
		if (isCheckedSize) {
			size = $("#sizeId${status.index}").val()
		}


		console.log("PUT")
		console.log(color)
		console.log(size)
		
		$.ajax({
			url:"put",
			method:"post",
			data: {
				pcode,
				color, 
				size,
				quntity,
				price

			}
		})
		.done(() => {
			console.log("DONE")
		});
	} */
	</script>

	</c:forEach>

</div>
</div>
</div>
<%-- 	<!-- Sold out Modal-->
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
	</div> --%>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
