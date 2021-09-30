<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:forEach var="item" items="${orderedHistory}">
		<p>${item.pthumbnail}</p>
		<img src="${pageContext.request.contextPath}/resources/handsome_img/${item.pthumbnail}"/>
	</c:forEach>

<div class="d-flex justify-content-center">
<div class="col-8">
<h5>이벤트</h5>
	
	<div class="" style="height: 100px;"></div>
	<div class="d-flex justify-content-center">
		<div class="btn btn-dark col-2">쿠폰 발급받기</div>
	</div>
	<div class="" style="height: 100px;"></div>

</div>
</div>


</body>
</html>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>