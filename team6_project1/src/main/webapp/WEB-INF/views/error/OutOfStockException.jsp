<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>


<div class="d-flex justify-content-center">
<div class="col-8">

<h3>주문 실패</h3>
<hr style="margin-bottom: 15vh;">
<h4 class="text-center">✖ ${message}</h4>
<h4 class="text-center mt-5" style="margin-bottom: 23vh;">선택하신 색상과 사이즈가 일시적으로 품절되었습니다.</h4>
<div class="d-flex justify-content-center mt-4">
	<a href="${pageContext.request.contextPath}/list/view" class="btn btn-outline-dark col-3 me-3">쇼핑 계속하기</a>
	<a href="${pageContext.request.contextPath}/cart/list" class="btn btn-dark col-3">쇼핑백 보기</a>
</div>

</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>