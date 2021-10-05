package com.mycompany.webapp.exception;

public class NotAuthenticatedUserException extends RuntimeException{
	public NotAuthenticatedUserException() {
		super("로그인이 필요합니다");
	}
	public NotAuthenticatedUserException(String message) {
		super(message);
	}
}
