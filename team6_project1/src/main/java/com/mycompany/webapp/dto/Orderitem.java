package com.mycompany.webapp.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Orderitem {
	private String oid;
	private String pcode;
	private String pcolor;
	private String psize;
	private int pquantity;
}