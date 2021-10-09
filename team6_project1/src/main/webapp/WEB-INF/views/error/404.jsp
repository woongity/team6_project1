<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Error Header -->
<%@ include file="/WEB-INF/views/common/errorHeader.jsp"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
</head>
<body>
<!-- error/404 화면 기본구성 -->
<div class="container" style="margin-top: 15vh;">
    <div class="mb-3 d-flex justify-content-center">
			<div style="font-size: 7vh">404 Not Found Error</div>
    </div>
    <div class="d-flex justify-content-center">
    	<a href="/"><img id="errorBlackCat" style="display: block;" alt="error_cat" 
    									 src="${pageContext.request.contextPath}/resources/images/error_cat.png" onmouseover="mouseOver()"></a>
			<a href="/"><img id="errorWhiteCat" style="display: none;" alt="error_cat2" 
											 src="${pageContext.request.contextPath}/resources/images/error_cat2.png" onmouseout="mouseOut()"></a>
    </div>
    <div class="mb-3 text-center">
			<h2>There is no content</h2>
			<h2>Please go back :)</h2>
    </div>
</div>
  
 <script>
	// 마우스 올렸을 때	
	function mouseOver() {
		const image1 = document.getElementById("errorBlackCat");
		const image2 = document.getElementById("errorWhiteCat");
		const bgColor = document.body.style
		const textColor = document.body.style
		
		image1.style.display = "none";
		image2.style.display = "block";
		bgColor.backgroundColor = "black";
		textColor.color = "white";
	}
	// 마우스 치웠을 때
	function mouseOut() {
		const image1 = document.getElementById("errorBlackCat");
		const image2 = document.getElementById("errorWhiteCat");
		const bgColor = document.body.style
		const textColor = document.body.style
		
		image1.style.display = "block";
		image2.style.display = "none";
		bgColor.backgroundColor = "white";
		textColor.color = "black";
	}
</script>
</body>
</html>