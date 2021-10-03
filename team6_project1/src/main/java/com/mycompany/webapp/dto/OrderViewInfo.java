package com.mycompany.webapp.dto;


import lombok.Data;

@Data
public class OrderViewInfo {
	private String oname;
    
	private String otel;
 
	private String oaddress;

	private String ocomment;

    private String opaymentmethod;
}