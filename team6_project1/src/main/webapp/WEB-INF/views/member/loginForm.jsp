<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div class="d-flex justify-content-center">
<div class="col-4">
	<h3>로그인</h3>
	<hr class="">
	<div class="card-body">
		<c:if test="${SPRING_SECURITY_LAST_EXCEPTION != null}">
			<div class="alert alert-danger mb-2" role="alert">
				<c:if test="${SPRING_SECURITY_LAST_EXCEPTION.message == 'Bad credentials'}">
					아이디 또는 비밀번호가 틀립니다.
				</c:if>
			  	<c:if test="${fn:contains(SPRING_SECURITY_LAST_EXCEPTION.message, 'principal exceeded')}">
					인증 횟수가 초과되었습니다.
				</c:if>
			</div>
		</c:if>
		<form method="post" action="${pageContext.request.contextPath}/login">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<div class="form-group mb-4">
			    <label for="mid" class="fs-6 mb-2">아이디</label>
			    <input type="text" class="form-control" id="mid" name="mid">
			</div>
			<div class="form-group mb-2">
				<label for="mpassword" class="fs-6 mb-2">비밀번호</label>
				<input type="password" class="form-control" id="mpassword" name="mpassword">
			</div>		
			<div class="form-group form-check">
				<input type="checkbox" class="form-check-input" id="exampleCheck1" checked>
				<label class="form-Check-label text-muted" for="exampleCheck1">아이디 저장</label>
			</div>				
			<div class="d-flex justify-content-center">
				<button type="submit" class="btn btn-dark mt-4 col-6">로그인</button>
			</div>
		
			
		</form>	
	</div>
</div>
</div>

<h3>&nbsp;</h3>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>