package com.mycompany.webapp.exception;

public class OutOfStockExceptionHandler extends RuntimeException{
	public OutOfStockExceptionHandler() {
		super("재고가 없습니다.");
	}
	public OutOfStockExceptionHandler(String message) {
		super(message);
	}
}
