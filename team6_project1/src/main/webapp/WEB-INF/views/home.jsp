<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

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
    	<!-- 전체 상품리스트 -->
      <c:forEach var="item" begin="31" end="42" items="${productArray}" varStatus="status">
        <div class="text-center ps-0 pe-1" style="width: 16.5vw;">
          <a id="getModalBtn${status.index}">
          	<img src="<c:forEach var="i" items="${item.pimage1TreeSet}" begin="0" end="0">${i}</c:forEach>" 
          			 class="card-img-top upper-image" id="homeImage1" alt="item">
          </a>
          <div class="card-body">
            <h5 class="card-title">${item.pbrand}</h5>
            <p class="card-text">${item.pname}</p>
            <p class="card-text">${item.pcode}</p>
            <p class="card-text">\ ${item.pprice}</p>         
            <!-- 재고계산 -->
            <c:set var="count" value="0" />
            <c:forEach var="i" items="${item.pstock}" begin="0" end="${fn:length(item.pstock) - 1}">
              <c:set var="count" value="${count + i.value}" />
            </c:forEach>
            <c:if test="${count < 1}">
              <p class="text-secondary">SOLD OUT</p>
            </c:if>
            <c:if test="${count > 0 && count < 10}">
              <p style="color: darkKhaki;">BEST</p>
            </c:if>
            <c:if test="${count > 9 && count < 20}">
              <p style="color: indianRed;">SALE</p>
            </c:if>
            <c:if test="${count > 19}">
              <p style="color: darkKhaki;">NEW</p>
            </c:if>
          </div>
        </div>

				<!-- 상품 Modal-->
        <c:if test="${count > 0}"> 
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
                        <!-- Carousel image 1 -->
                        <div class="carousel-item active">
                          <c:forEach var="i" items="${item.pimage1TreeSet}" begin="0" end="${fn:length(item.pimage1TreeSet) - 1}" varStatus="c1i">
                            <c:if test="${c1i.index == 0}">
                              <img src="${i}" class="card-img-top" alt="" id="carousel1image${status.index}sep${c1i.index}" style="display: block;">
                            </c:if>
                            <c:if test="${c1i.index > 0}">
                              <img src="${i}" class="card-img-top" alt="" id="carousel1image${status.index}sep${c1i.index}" style="display: none;">
                            </c:if>
                          </c:forEach>
                        </div>
                        <!-- Carousel image 2 -->
                        <div class="carousel-item">
                          <c:forEach var="i" items="${item.pimage2TreeSet}" begin="0" end="${fn:length(item.pimage2TreeSet) - 1}" varStatus="c2i">
                            <c:if test="${c2i.index == 0}">
                              <img src="${i}" class="card-img-top" alt="" id="carousel2image${status.index}sep${c2i.index}" style="display: block;">
                            </c:if>
                            <c:if test="${c2i.index > 0}">
                              <img src="${i}" class="card-img-top" alt="" id="carousel2image${status.index}sep${c2i.index}" style="display: none;">
                            </c:if>
                          </c:forEach>
                        </div>
                        <!-- Carousel image 3 -->
                        <div class="carousel-item">
                          <c:forEach var="i" items="${item.pimage3TreeSet}" begin="0" end="${fn:length(item.pimage3TreeSet) - 1}" varStatus="c3i">
                            <c:if test="${c3i.index == 0}">
                              <img src="${i}" class="card-img-top" alt="" id="carousel3image${status.index}sep${c3i.index}" style="display: block;">
                            </c:if>
                            <c:if test="${c3i.index > 0}">
                              <img src="${i}" class="card-img-top" alt="" id="carousel3image${status.index}sep${c3i.index}" style="display: none;">
                            </c:if>
                          </c:forEach>
                        </div>
                      </div>
                      <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators${status.index}" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
                      </button>
                      <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators${status.index}" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden">Next</span>
                      </button>
                    </div>
                  </div>
									<!-- Color 선택 -->
                  <form action="put" method="post">
                    <input type="text" id="pcode" name="pcode" class="form-control" value="${item.pcode}" style="display: none;">
                    <div class="card-body">
                      <div class="d-flex justify-content-between">
                        <h6 style="margin-top: 8px;">Color&nbsp;&nbsp;</h6>
                        <div class="d-flex">
                          <c:forEach var="i" items="${item.pcolorTreeSet}" begin="0" end="${fn:length(item.pcolorTreeSet) - 1}" varStatus="icstatus">
                            <div class="form-check me-3">
                              <c:if test="${icstatus.index == 0}">
                                <input class="form-check-input" type="radio" name="color" id="colorId${status.index}sep${icstatus.index}" value="${i}" onclick="changeImage${status.index}sep${icstatus.index}()" checked>
                              </c:if>
                              <c:if test="${icstatus.index > 0}">
                                <input class="form-check-input" type="radio" name="color" id="colorId${status.index}sep${icstatus.index}" value="${i}" onclick="changeImage${status.index}sep${icstatus.index}()">
                              </c:if>
                              <label class="form-check-label" for="colorId${status.index}">
                                <p onclick="changeImage${status.index}sep${icstatus.index}()">${i}</p>
                              </label>
                            </div>
							              <script>
															// 색상버튼 변경시 carousel 이미지 변경하는 함수
															function changeImage${status.index}sep${icstatus.index}() {
																const isChecked = document.getElementById("colorId${status.index}sep${icstatus.index}").checked
																const isCheckedIndex = document.getElementById("colorId${status.index}sep${icstatus.index}")
																
																const cimage = document.getElementById("carousel1image${status.index}sep${icstatus.index}")	
																const cimageArray1 = new Array();
																const cimageArray2 = new Array();
																const cimageArray3 = new Array();
																
																
																for (let i = 0; i < ${fn:length(item.pcolorTreeSet)}; i++) {
																	cimageArray1[i] = "carousel1image${status.index}sep" + i
																}
																for (let i = 0; i < ${fn:length(item.pcolorTreeSet)}; i++) {
																	cimageArray2[i] = "carousel2image${status.index}sep" + i
																}
																for (let i = 0; i < ${fn:length(item.pcolorTreeSet)}; i++) {
																	cimageArray3[i] = "carousel3image${status.index}sep" + i
																}								
																	
																if (isChecked) {		
																	for (let i = 0; i < ${fn:length(item.pcolorTreeSet)}; i++) {
																		const tempId1 = cimageArray1[i]
																		const tempId2 = cimageArray2[i]
																		const tempId3 = cimageArray3[i]
																		if (i == ${icstatus.index}) {
																			document.getElementById(tempId1).style.display = "block"
																			document.getElementById(tempId2).style.display = "block"
																			document.getElementById(tempId3).style.display = "block"
																		} else {
																			document.getElementById(tempId1).style.display = "none"
																			document.getElementById(tempId2).style.display = "none"
																			document.getElementById(tempId3).style.display = "none"
																		}
																	}
																		
																}
															}
														</script>
                          </c:forEach>
                        </div>
                      </div>
                      <!-- 색상 이미지 -->
                      <div class="d-flex justify-content-end mb-2">
                        <c:forEach var="i2" items="${item.pcolorimageTreeSet}" begin="0" end="${fn:length(item.pcolorimageTreeSet) - 1}">
                          <img alt="" src="${i2}" class="mx-3" style="width: 24px; height: 24px;">
                        </c:forEach>
                      </div>
                      <!-- Size 선택 -->
                      <div class="d-flex justify-content-between">
                        <h6 style="margin-top: 8px;">Size&nbsp;&nbsp;&nbsp;</h6>
                        <div class="d-flex">
                          <c:forEach var="i" items="${item.psizeTreeSet}" begin="0" end="${fn:length(item.psizeTreeSet) - 1}" varStatus="isstatus">
                            <div class="form-check me-3">
                              <c:if test="${isstatus.index == 0}">
                                <input class="form-check-input" type="radio" name="size" id="sizeId${status.index}sep${isstatus.index}" value="${i}" onclick="changeSize${status.index}sep${isstatus.index}()" checked>
                              </c:if>
                              <c:if test="${isstatus.index > 0}">
                                <input class="form-check-input" type="radio" name="size" id="sizeId${status.index}sep${isstatus.index}" value="${i}" onclick="changeSize${status.index}sep${isstatus.index}()">
                              </c:if>
                              <label class="form-check-label" for="sizeId${status.index}sep${isstatus.index}">
                              	<p onclick="changeSize${status.index}sep${isstatus.index}()">${i}</p>
                              </label>
                            </div>                           
                          </c:forEach>
                        </div>
                      </div>
                        <input type="text" name="quantity" class="form-control" value="1" style="display: none;">
                        <input type="text" name="price" class="form-control" value="${item.pprice}" style="display: none;">
                      <!-- ㅛㅜ햘 선택 -->
                      <div class="d-flex justify-content-between">
                        <h6 style="margin-top: 8px;">Quantity</h6>
                        <div class="d-flex">
                          <div class="me-1 btn btn-sm" onclick='changeQuantity${status.index}("minus")'>-</div>
                          <p id="countId${status.index}">1</p>
                          <div class="me-1 btn btn-sm" onclick='changeQuantity${status.index}("plus")'>+</div>
                        </div>
                      </div>
                      <hr class="my-2">
                      <!-- 가격 합계 -->
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
                      </div>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </c:if>
        <!-- 품절상품 Modal -->
        <c:if test="${count < 1}">
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
                        <!-- Carousel image 1 -->
                        <div class="carousel-item active">
                          <c:forEach var="i" items="${item.pimage1TreeSet}" begin="0" end="0">
                            <img src="${i}" class="card-img-top" alt="">
                          </c:forEach>
                        </div>
                        <!-- Carousel image 2 -->
                        <div class="carousel-item">
                          <c:forEach var="i" items="${item.pimage2TreeSet}" begin="0" end="0">
                            <img src="${i}" class="card-img-top" alt="">
                          </c:forEach>
                        </div>
                        <!-- Carousel image 3 -->
                        <div class="carousel-item">
                          <c:forEach var="i" items="${item.pimage3TreeSet}" begin="0" end="0">
                            <img src="${i}" class="card-img-top" alt="">
                          </c:forEach>
                        </div>
                      </div>

                      <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators${status.index}" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
                      </button>
                      <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators${status.index}" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden">Next</span>
                      </button>
                    </div>
                  </div>
                  <!-- 품절상품 안내 -->
                  <div class="card-body">
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
        </c:if>
			  <script>
				// Modal창 관리
				$('#getModalBtn${status.index}').click(function(e){
				e.preventDefault();
				$('#getModal${status.index}').modal("show");
				});
				
				// 상품 수량조절
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
					
					$('input[name=quantity]').attr('value', count);
						
					countId.innerText = count
					totalId.innerText = total
				}	
				</script>
      </c:forEach>
    </div>
  </div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>