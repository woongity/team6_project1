package com.mycompany.webapp.exception;

public class UnauthorizedException extends RuntimeException{
	public UnauthorizedException() {
		super("잘못된 접근입니다");
	}
	public UnauthorizedException(String message) {
		super(message);
	}
}
