<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style scoped>
	.couponBtn2 {
		background-color: #d1e7ff;
		border-color:  #d1e7ff;
	}
	.couponBtn2:hover {
		background-color: black;
    border-color: black;
    color: white;
	}
</style>
</head>
<body>

	<div class="d-flex justify-content-center">
		<div class="col-8">
			<h3>이벤트 2</h3>
			<hr class="my-3">
			<div class="d-flex justify-content-center mt-5">
				<div class="col-6" style="margin-left: 5vw;">
					<div class="d-flex justify-content-center">
						<img alt="coupon2" src="${pageContext.request.contextPath}/resources/images/coupon2.png">
					</div>
					
					<div class="d-flex justify-content-center mt-3">
						<a class="btn couponBtn2 btn-lg col-6 fw-bold" href="javascript:joinEvent()">쿠폰 발급받기</a>
					</div>
				</div>
				
				<div class="col-6">
					<div class="mt-5">
						<h5 class="mb-3">▶ NOTICE</h5>
						<h6>•쿠폰은 이벤트 종료 후 일괄 발급됩니다.</h6>
						<h6>•선착순 이벤트이므로 조기 소진될 수 있습니다.</h6>
						<h6>•중복 발급은 불가능합니다.</h6>
					</div>
				</div>
			</div>
		</div>
	</div>
	
		<!-- 쿠폰 발급 성공 Modal -->
	<div class="modal fade" id="event21Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title fw-bold" id="exampleModalLabel">▶ 알림: SUCCESS</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body fw-bold">🎉축하해요 이벤트 쿠폰을 성공적으로 발급 받으셨어요.</div>
	      <div class="modal-footer">
        <button type="button" class="btn btn-dark">쿠폰 확인하기</button>
        <button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal">닫기</button>
      </div>
			</div>
		</div>
	</div>
	
	<!-- 쿠폰 수량 초과 Modal -->
	<div class="modal fade" id="event22Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title fw-bold" id="exampleModalLabel">▶ 알림: FAIL</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body fw-bold">😥이벤트 쿠폰이 이미 소진되었어요.</div>
	      <div class="modal-footer">
        <button type="button" class="btn btn-dark">쿠폰 확인하기</button>
        <button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal">닫기</button>
      </div>
			</div>
		</div>
	</div>
	
	<!-- 쿠폰 중복발급 실패 Modal -->
	<div class="modal fade" id="event23Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title fw-bold" id="exampleModalLabel">▶ 알림: FAIL</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body fw-bold">✖이벤트 쿠폰은 한 장만 발급 받으실 수 있어요.</div>
	      <div class="modal-footer">
        <button type="button" class="btn btn-dark">쿠폰 확인하기</button>
        <button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal">닫기</button>
      </div>
			</div>
		</div>
	</div>
	
	<script>
	function joinEvent() {
	  	$.ajax({
	     		url:"/event2/join"
	 		}).done((data) => {
	 			if(data.result=="success"){
	 				console.log(data.result);
	 				$('#event21Modal').modal("show");
	 			}else if(data.result=="outOfStock"){
	 				$('#event22Modal').modal("show");
	 			}else{
	 				$('#event23Modal').modal("show");
	 			}
	 			
	 	
	  	});
	 	}
	</script>
</body>
</html>


<%@ include file="/WEB-INF/views/common/footer.jsp"%>