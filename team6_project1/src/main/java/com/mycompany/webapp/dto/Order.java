package com.mycompany.webapp.dto;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@AllArgsConstructor
public class Order {
	private int oid;
    private String otime;
	private String mid;
	private String oname;
	private String otel;
	private String oaddress;
	private String ocomment;
    private String opaymentmethod;
    private char ostatus;
}