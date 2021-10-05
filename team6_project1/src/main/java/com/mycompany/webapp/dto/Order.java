package com.mycompany.webapp.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Order {
	private String oid;
    private String otime;
	private String mid;
	private String oname;
	private String otel;
	private String oaddress;
	private String ocomment;
    private String opaymentmethod;
    private char ostatus;
}