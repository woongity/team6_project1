package com.mycompany.webapp.aspect;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import com.mycompany.webapp.exception.UnauthorizedException;
import com.mycompany.webapp.exception.NotAuthenticatedUserException;

@Component
@Aspect
public class LoginCheckAop {
	private static final Logger logger = LoggerFactory.getLogger(LoginCheckAop.class);

	//로그인을 하고 접근이 필요한 페이지에 로그인을 하지 않았을 때 NotAuthenticatedUserException에러를 생성하고 로그인 페이지로 이동
	@Around("@annotation(LoginChecking)")
	public Object loginCheckAdvice(ProceedingJoinPoint joinPoint) throws Throwable {
		logger.info("loginCheckAdvice실행");
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if(authentication.getName() == "anonymousUser") {
			throw new NotAuthenticatedUserException();
		}
		Object result = joinPoint.proceed();
		return result;
	}
	
	//로그인을 하지 않은 상태에서 잘못된 접근을 했을 때 401에러 페이지 이동
	@Around("@annotation(LoginChecking401)")
	public Object loginCheck401Advice(ProceedingJoinPoint joinPoint) throws Throwable {
		logger.info("loginCheck401Advice실행");
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if(authentication.getName() == "anonymousUser") {
			throw new UnauthorizedException();
		}
		Object result = joinPoint.proceed();
		return result;
	}
}
