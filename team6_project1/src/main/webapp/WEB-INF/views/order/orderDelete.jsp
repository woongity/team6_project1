<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div class="d-flex justify-content-center">
<div class="col-8">

<h3>주문취소</h3>
<hr style="margin-bottom: 23vh;">
<h4 class="text-center" style="margin-bottom: 23vh;">✖ 요청하신 상품주문이 취소되었습니다.</h4>

<div class="d-flex justify-content-center mt-4">
	<a href="${pageContext.request.contextPath}/listView" class="btn btn-outline-dark col-3 me-3">쇼핑 계속하기</a>
	<a href="${pageContext.request.contextPath}/orderedHistory" class="btn btn-dark col-3">쇼핑 내역보기</a>
</div>

</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>