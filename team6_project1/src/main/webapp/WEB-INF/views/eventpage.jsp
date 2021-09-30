<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="d-flex justify-content-center">
		<div class="col-8">
			<h5>이벤트</h5>
			<div class="" style="height: 100px;"></div>
			<div class="d-flex justify-content-center">
				<a class="btn btn-dark col-2" href="javascript:joinEvent()">쿠폰
					발급받기</a>
			</div>
			<div class="" style="height: 100px;"></div>
		</div>
	</div>
	<script>
	function joinEvent() {
    	$.ajax({
       		url:"joinEvent"
   		}).done((data) => {
   			if(data.result==="success"){
   				console.log(data.result);	
   			}else{
   				alert("발급에 실패하였습니다.");
   				window.location.reload();
   			}
    	});
 	}
</script>
</body>
</html>


<%@ include file="/WEB-INF/views/common/footer.jsp"%>