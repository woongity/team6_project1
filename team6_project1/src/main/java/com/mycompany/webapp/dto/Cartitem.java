package com.mycompany.webapp.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Cartitem {
	private String mid;
	private String pcode;
	private String pcolor;
	private String psize;
	private int pquantity;
}
