<%@ page contentType="text/html; charset=UTF-8"%>

<style scoped>
	.footer {
		height: 130px;
	}
	.pop {
		transition: 0.1s;
		cursor: pointer;
	}
	.pop:active {
	  transform: scale(0.1);
	  opacity: 0.5;
	}
</style>

<div>&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<!-- 하단 고정 footer -->
<div class="d-flex justify-content-center mb-3">
	<footer class="text-dark mt-5 col-8">
		<div class="footer text-center align-middle">
			<a href="/" class="text-decoration-none text-dark"><div class="fs-6 mb-2 fw-bold">| THE | HANDSOME |</div></a>
			<div class="fs-6 mb-2">🔰Hyundai IT&E 2th Team6 Mini Project 1</div>
			<div class="fs-6 mb-2">
				<a href="https://github.com/woongity" class="text-decoration-none text-dark">🧑🏻Taewoong</a>
				<a href="https://github.com/hongsam123" class="text-decoration-none text-dark">👧🏻Eunsol</a> 
				<a href="https://github.com/dpsk331" class="text-decoration-none text-dark">👩🏻Yena</a> 
				<a href="https://github.com/blossom4" class="text-decoration-none text-dark">👦🏻Youngshin</a>
			</div>
			<!-- SNS icons -->
			<div class="d-flex justify-content-center mb-2">
				<a class="me-2"><img src="${pageContext.request.contextPath}/resources/images/github.svg" alt="" class="pop" style="width: 24px;"></a>
				<a class="me-2"><img src="${pageContext.request.contextPath}/resources/images/youtube.svg" alt="" class="pop" style="width: 24px;"></a>
				<a class="me-2"><img src="${pageContext.request.contextPath}/resources/images/instagram.svg" alt="" class="pop" style="width: 24px;"></a>
				<a><img src="${pageContext.request.contextPath}/resources/images/facebook.svg" alt="" class="pop" style="width: 24px;"></a>
			</div>
		</div>
	</footer>
</div>
	