<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<style scoped>
	
	#mainBg {
		z-index: -10;
		position: absolute;
		width: 67vw;
	}


</style>

<div class="d-flex justify-content-center">
	<div class="col-8">
		<img alt="mainBackgroundImage" src="${pageContext.request.contextPath}/resources/images/bg_2.jpg" id="mainBg" class="mb-5">
			<div class="ms-5" style="margin-top: 22vh; margin-bottom: 11vh;">
				<h1 class="mb-4">| LIGHT LUXE |</h1>
				<h5>OZ-SECOND Collection with Actress Eunse Kee</h5>
				<h5>WE 21FW Coupon Event</h5>
				
				<div class="mt-5">
					<a href="/listView"><div class="btn btn-outline-dark col-2 mt-5">SHOP NOW</div></a>
					<a href="/eventpage"><div class="btn btn-dark col-2 mt-5">EVENT</div></a>
				</div>
			</div>
			

	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
