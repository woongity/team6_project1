<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<style>
    .pop {
      transition: 0.4s;
      cursor: pointer;
    }
    .pop:active {
    transform: rotate;
    opacity: 0.5;
    }
</style>

<div class="d-flex justify-content-center">
<div class="col-8">
<h3>쇼핑백</h3>
<table class="table table-striped">
  <thead class="text-center">
    <tr>
      <th class="col-2">전체</th>
      <th class="col-4">상품정보</th>
      <th class="col-2">수량</th>
      <th class="col-2">판매가</th>
      <th class="col-2">선택</th>
    </tr>
  </thead>
  <tbody>
  <c:set var="count" value="0" />   
  <c:set var="totalPrice" value="0" />
  <c:forEach var="item" items="${cartitems}" varStatus="status">
    <tr>
      <th scope="row" class="d-flex">
      	<div class="form-check mx-2">
		  <input class="form-check-input" type="checkbox" value="" id="item${status.index}Id">
		  <label class="form-check-label" for="item${status.index}Id">
		  </label>
		</div>
      	<img src="${item.pimage1}" class="card-img-top" style="width: 7rem;" alt="">
      </th>
      <td>
      	<h6 class="fw-bold">${item.pbrand}</h6>
      	<h6>${item.pname}</h6>    	
      	<h6>&nbsp;</h6>
      	<h6>&nbsp;</h6>
        <div class="d-flex justify-content-between">
        	<h6 class="text-muted">Color:<span><img src="${item.pcolorimage}" class="mx-1" style="width: 20px; height: 20px;"></span>${item.pcolor} / Size: ${item.psize}</h6>
            <h6 class="btn text-primary" id="optionModalBtn${status.index}" style="text-underline-position: under; text-decoration: underline;">option</h6>
        </div>
      </td>
      
          <!-- 상품 Modal-->
          <div class="modal fade" id="optionModal${status.index}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-sm" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title fw-bold" id="exampleModalLabel">옵션변경</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="" style="max-width: 100%;">
                
                
                <c:forEach var="product" items="${productMap}" varStatus="pmindex">
                
                <!-- 상품 Modal - Carousel -->
                  <div style="max-width: fit-content;">
                    <div id="carouselExampleIndicators${status.index}csep${pmindex.index}" class="carousel slide" data-bs-ride="carousel" data-bs-interval="false">
                      <div class="carousel-indicators">
                        <button type="button" data-bs-target="#carouselExampleIndicators${status.index}csep${pmindex.index}" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators${status.index}csep${pmindex.index}" data-bs-slide-to="1" aria-label="Slide 2"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators${status.index}csep${pmindex.index}" data-bs-slide-to="2" aria-label="Slide 3"></button>
                      </div>
                      
                      <div class="carousel-inner">
                        <c:if test="${item.pcode == product.value.pcode}">
                        <!-- Carousel image 1 -->
                        <div class="carousel-item active">
                          <c:forEach var="i" items="${product.value.pimage1TreeSet}" begin="0" end="${fn:length(product.value.pimage1TreeSet) - 1}" varStatus="c1i">
                            <c:if test="${item.pimage1 == i}">
                              <img src="${i}" class="card-img-top" alt="" id="carousel1image${status.index}sep${pmindex.index}sep${c1i.index}" style="display: block;">
                            </c:if>
                            <c:if test="${item.pimage1 != i}">
                              <img src="${i}" class="card-img-top" alt="" id="carousel1image${status.index}sep${pmindex.index}sep${c1i.index}" style="display: none;">
                            </c:if>
                          </c:forEach>
                        </div>
                        
                        
                       <!-- Carousel image 2 -->
                        <div class="carousel-item">
                          <c:forEach var="i" items="${product.value.pimage2TreeSet}" begin="0" end="${fn:length(product.value.pimage2TreeSet) - 1}" varStatus="c2i">
                            <c:if test="${item.pimage2 == i}">
                              <img src="${i}" class="card-img-top" alt="" id="carousel2image${status.index}sep${pmindex.index}sep${c2i.index}" style="display: block;">
                            </c:if>
                            <c:if test="${item.pimage2 != i}">
                              <img src="${i}" class="card-img-top" alt="" id="carousel2image${status.index}sep${pmindex.index}sep${c2i.index}" style="display: none;">
                            </c:if>
                          </c:forEach>
                        </div>
                        
                        <!-- Carousel image 3 -->
                        <div class="carousel-item">
                          <c:forEach var="i" items="${product.value.pimage3TreeSet}" begin="0" end="${fn:length(product.value.pimage3TreeSet) - 1}" varStatus="c3i">
                            <c:if test="${item.pimage3 == i}">
                              <img src="${i}" class="card-img-top" alt="" id="carousel3image${status.index}sep${pmindex.index}sep${c3i.index}" style="display: block;">
                            </c:if>
                            <c:if test="${item.pimage3 != i}">
                              <img src="${i}" class="card-img-top" alt="" id="carousel3image${status.index}sep${pmindex.index}sep${c3i.index}" style="display: none;">
                            </c:if>
                          </c:forEach>
                        </div> 
                        </c:if>
                      </div>

                      <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators${status.index}csep${pmindex.index}" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
                      </button>
                      <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators${status.index}csep${pmindex.index}" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden">Next</span>
                      </button>
                    </div>
                  </div>
                  
                <!-- Color 선택 -->
                <div class="d-flex justify-content-between">
                  
                  <div class="">                 
                <!-- Color / Size option -->
                <c:if test="${item.pcode == product.value.pcode}">
                <div class="card-body">
                  <!-- Color -->
                  <h6 style="margin-top: 8px;">Color&nbsp;&nbsp;</h6>
                  <c:forEach var="ipc" items="${product.value.pcolorTreeSet}" varStatus="ipcstatus">
                    <c:if test="${item.pcolor == ipc}">
                      <input class="form-check-input" type="radio" name="color${status.index}sep${pmindex.index}" id="colorId${status.index}sep${pmindex.index}sep${ipcstatus.index}" value="${ipc}" onclick="changeColor${status.index}sep${pmindex.index}sep${ipcstatus.index}()" checked>
                    </c:if>
                    <c:if test="${item.pcolor != ipc}">
                      <input class="form-check-input" type="radio" name="color${status.index}sep${pmindex.index}" id="colorId${status.index}sep${pmindex.index}sep${ipcstatus.index}" value="${ipc}" onclick="changeColor${status.index}sep${pmindex.index}sep${ipcstatus.index}()">
                    </c:if>
                    <label class="form-check-label" for="colorId${status.index}sep${pmindex.index}">
                      <p onclick="changeColor${status.index}sep${pmindex.index}sep${ipcstatus.index}()">${ipc}</p>
                    </label>
                    
                    <script>
                    	// 색깔 input value 변경
                    	function changeColor${status.index}sep${pmindex.index}sep${ipcstatus.index}() {
                    		const isChecked = document.getElementById("colorId${status.index}sep${pmindex.index}sep${ipcstatus.index}").checked
                    		const checkedId = document.getElementById("colorId${status.index}sep${pmindex.index}sep${ipcstatus.index}")
							const cimage = document.getElementById("carousel1image${status.index}sep${pmindex.index}sep${ipcstatus.index}")
                                      		
                    		const cimageArray1 = new Array();
                            const cimageArray2 = new Array();
                            const cimageArray3 = new Array();
                            
                    		for (let i = 0; i < ${fn:length(product.value.pimage1TreeSet)}; i++) {
                              cimageArray1[i] = "carousel1image${status.index}sep${pmindex.index}sep" + i
                            }
                            for (let i = 0; i < ${fn:length(product.value.pimage2TreeSet)}; i++) {
                              cimageArray2[i] = "carousel2image${status.index}sep${pmindex.index}sep" + i
                            }
                            for (let i = 0; i < ${fn:length(product.value.pimage3TreeSet)}; i++) {
                              cimageArray3[i] = "carousel3image${status.index}sep${pmindex.index}sep" + i
                            } 
                    		
                    		
                    		if (isChecked) {
                    			$('input[name=new_pcolor]').attr('value', checkedId.value);
                    			
                    			for (let i = 0; i < ${fn:length(product.value.pimage1TreeSet)}; i++) {
                                    const tempId1 = cimageArray1[i]
                                    const tempId2 = cimageArray2[i]
                                    const tempId3 = cimageArray3[i]
                                   
                                    
                                    if (i == ${ipcstatus.index}) {
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
                  <div>
                    <c:forEach var="ipci" items="${product.value.pcolorimageTreeSet}">
                      <img src="${ipci}" class="ms-3" style="width: 20px; height: 20px;">
                    </c:forEach>
                  </div>
                  
                  <h6 style="margin-top: 8px;">Size&nbsp;&nbsp;</h6>
                  <!-- Size -->
                  <c:forEach var="ips" items="${product.value.psizeTreeSet}" varStatus="ipsstatus">
                    <c:if test="${item.psize == ips}">
                      <input class="form-check-input" type="radio" name="size${status.index}sep${pmindex.index}" id="sizeId${status.index}sep${pmindex.index}sep${ipsstatus.index}" value="${ips}" onclick="changeSize${status.index}sep${pmindex.index}sep${ipsstatus.index}()" checked>
                    </c:if>
                    <c:if test="${item.psize != ips}">
                      <input class="form-check-input" type="radio" name="size${status.index}sep${pmindex.index}" id="sizeId${status.index}sep${pmindex.index}sep${ipsstatus.index}" value="${ips}" onclick="changeSize${status.index}sep${pmindex.index}sep${ipsstatus.index}()">
                    </c:if>
                    <label class="form-check-label" for="sizeId${status.index}sep${pmindex.index}">
                      <p onclick="changeSize${status.index}sep${pmindex.index}sep${ipsstatus.index}()">${ips}</p>
                    </label>
                    
                    <script>
                      function changeSize${status.index}sep${pmindex.index}sep${ipsstatus.index}() {
                        const sisChecked = document.getElementById("sizeId${status.index}sep${pmindex.index}sep${ipsstatus.index}").checked
                        const scheckedId = document.getElementById("sizeId${status.index}sep${pmindex.index}sep${ipsstatus.index}")

                        console.log(sisChecked)
                        console.log(scheckedId)
                        console.log(scheckedId.value)

                        
                        if (sisChecked) {
                          $('input[name=new_psize]').attr('value', scheckedId.value);
                        }
                      }
                    </script>
                  </c:forEach>
                  </div>
                </c:if>
                  </div>
                </div>
                
                </c:forEach>
                
                <div>
                <!-- 색상변경요청 정보 input -->
                <form action="option" method="post">
                  <input type="text" id="pcode" name="pcode" class="form-control" value="${item.pcode}" style="display: none;">
                  <input type="text" id="origin_pcolor" name="origin_pcolor" class="form-control" value="${item.pcolor}" style="display: none;">
                  <input type="text" id="origin_psize" name="origin_psize" class="form-control" value="${item.psize}" style="display: none;">
                  <input type="text" id="new_pcolor1" name="new_pcolor" class="form-control" value="${item.pcolor}" style="display: none;">
                  <input type="text" id="new_psize1" name="new_psize" class="form-control" value="${item.psize}" style="display: none;">
                  <input type="text" id="new_pquantity1" name="new_pquantity" class="form-control" value="${item.pquantity}" style="display: none;">
                  <div class="d-flex justify-content-center my-3">
                    <input class="btn btn-dark btn-sm col-6" value="변경하기" type="submit">
                  </div>
                  
                </form>
                </div>
                 </div>
                </div>
                </div>
              </div>

          
      <td>
    	<div class="d-flex justify-content-center" style="margin-top: 35%;">
          <div class="me-2 btn btn-sm fs-5" onclick='changeQuantity${status.index}("minus")'>-</div>
          <p class="fs-5 mt-1" id="countId${status.index}">${item.pquantity}</p>
          <div class="ms-2 btn btn-sm fs-5" onclick='changeQuantity${status.index}("plus")'>+</div>
	   	</div>
        <div class="d-flex justify-content-center">
        <!-- 수량변경 input -->
        <form action="option" method="post">
          <input type="text" id="pcode" name="pcode" class="form-control" value="${item.pcode}" style="display: none;">
          <input type="text" id="origin_pcolor" name="origin_pcolor" class="form-control" value="${item.pcolor}" style="display: none;">
          <input type="text" id="origin_psize" name="origin_psize" class="form-control" value="${item.psize}" style="display: none;">
          <input type="text" id="new_pcolor2" name="new_pcolor" class="form-control" value="${item.pcolor}" style="display: none;">
          <input type="text" id="new_psize2" name="new_psize" class="form-control" value="${item.psize}" style="display: none;">
          <input type="text" id="new_pquantity2" name="new_pquantity" class="form-control" value="${item.pquantity}" style="display: none;">
          <input class="btn btn-sm" value="[ 변경 ]" type="submit">
        </form>
          
        </div>
        
      </td>

      <td class="text-center align-middle">
        <span>\</span>
        <span id="totalId${status.index}">${item.pprice * item.pquantity}</span>
      </td>
      <td class="text-center align-middle">
        <!-- 상품 삭제 -->
        <form action="deleteitem" method="post">
          <input type="text" id="pcode" name="pcode" class="form-control" value="${item.pcode}" style="display: none;">
          <input type="text" id="pcolor" name="pcolor" class="form-control" value="${item.pcolor}" style="display: none;">
          <input type="text" id="psize" name="psize" class="form-control" value="${item.psize}" style="display: none;">
          <div class="btn btn-sm" id="deleteModalBtn${status.index}">[ 삭제 ]</div>
          <!-- <input class="btn btn-sm col-6" value="[ 삭제 ]" type="submit"> -->
  
          <!-- 삭제 확인 Modal -->
          <div class="modal" id="getDeleteModal${status.index}" tabindex="-1">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title">▶ 알림</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body d-flex justify-content-start">
                  <h5>정말 삭제하시겠습니까?</h5> 
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
          </form>
      </td> 
    </tr>
    <h5 id="tempId${status.index}" style="display: none;">${item.pprice}</h5>
    <script>
    
   	// optionModal
	$('#optionModalBtn${status.index}').click(function(e){
		e.preventDefault();
		$('#optionModal${status.index}').modal("show");
	});    
   	
    // deleteModal
	$('#deleteModalBtn${status.index}').click(function(e){
		e.preventDefault();
		$('#getDeleteModal${status.index}').modal("show");
	});

	// 상품 수량조절
	function changeQuantity${status.index}(operator) {
		const countId = document.getElementById("countId${status.index}")
		const totalId = document.getElementById("totalId${status.index}")
		const tempId = document.getElementById("tempId${status.index}")
		const finalCountId = document.getElementById("finalCountValue")
		const finalTotalId1 = document.getElementById("finalTotalValue1")
		const finalTotalId2 = document.getElementById("finalTotalValue2")
		
		let count = countId${status.index}.innerText
		let total = totalId${status.index}.innerText
		let temp = tempId${status.index}.innerText
		let finalCount = finalCountValue.innerText
		let finalTotal1 = finalTotalValue1.innerText
		let finalTotal2 = finalTotalValue2.innerText
		
		if (operator == "plus") {
			count = parseInt(count) + 1
			total = parseInt(total) + parseInt(temp)
			finalCount = parseInt(finalCount) + 1
			finalTotal1 = parseInt(finalTotal1) + parseInt(temp)
			finalTotal2 = parseInt(finalTotal2) + parseInt(temp)
		} else if (operator == "minus" && count > 1) {
			count = parseInt(count) - 1
			total = parseInt(total) - parseInt(temp)
			finalCount = parseInt(finalCount) - 1
			finalTotal1 = parseInt(finalTotal1) - parseInt(temp)
			finalTotal2 = parseInt(finalTotal2) - parseInt(temp)
		}

		$('input[name=new_pquantity]').attr('value', count);
			
		countId.innerText = count
		totalId.innerText = total
		finalCountId.innerText = finalCount
		finalTotalId1.innerText = finalTotal1
		finalTotalId2.innerText = finalTotal2
	}
    
    </script>
    <c:set var="count" value="${count + item.pquantity}" />
    <c:set var="totalPrice" value="${totalPrice + (item.pquantity * item.pprice)}" />
    </c:forEach>
 
     <!-- 쇼핑백에 상품이 없을 경우 -->
    <c:if test="${count == 0}">
    <tr>
      <td colspan="12" class="text-center align-middle" style="height: 160px;">
      	<h4>쇼핑백에 상품이 담겨있지 않습니다.</h4>
      </td>
    </tr>
    </c:if>
    
    <!-- 쇼핑백 상품 합계 -->
    <tr>
      <td colspan="3"></td>
      <td colspan="3">
      <div class="pe-5">
      	<div class="d-flex justify-content-between mt-2">
	      	<div class="fs-5">총</div>
            <div>
              <span class="fw-bold fs-5 ms-2" id="finalCountValue" style="color: darkKhaki">${count}</span><span class="fs-5"> 개 상품</span>
            </div>
      	</div>
      	<div class="d-flex justify-content-between mt-3">
	      	<h6>상품 합계</h6>
            <div class="d-flex">
              <h6>\&nbsp;</h6>
  	      	  <h6 id="finalTotalValue1">${totalPrice}</h6>           
            </div>  	
      	</div>
      	<div class="d-flex justify-content-between mb-2">
	      	<h6>배송비</h6>
	      	<h6>\ 0</h6>	      	
      	</div>
      	<div class="d-flex justify-content-between">
        	<div class="fs-5">합계</div>
            <div>
              <span class="fs-5">\ </span><span class="fw-bold fs-5" id="finalTotalValue2" style="color: darkKhaki">${totalPrice}</span>
            </div>
        		      	
      	</div>
 	  </div>
      </td>
    </tr>
  </tbody>
</table>
<div class="d-flex justify-content-center mt-5">
  <a href="${pageContext.request.contextPath}/list/view" class="btn btn-outline-dark col-3 me-3">쇼핑 계속하기</a>	
  <form action="${pageContext.request.contextPath}/order/orderPage" method="post" class="col-3">
    <c:forEach var="result" items="${cartitems}" varStatus="rstatus">
      <input type="text" id="orderPcode" name="orderPcode" class="form-control" value="${result.pcode}" style="display: none;">
      <input type="text" id="orderPcolor" name="orderPcolor" class="form-control" value="${result.pcolor}" style="display: none;">
      <input type="text" id="orderPsize" name="orderPsize" class="form-control" value="${result.psize}" style="display: none;">
    </c:forEach>
    <c:if test="${count == 0}">
    <input class="btn btn-dark" value="주문하기" type="submit" style="width: 100%;" disabled>
    </c:if>
    <c:if test="${count != 0}">
    <input class="btn btn-dark" value="주문하기" type="submit" style="width: 100%;">
    </c:if>
  </form>
</div>


</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>