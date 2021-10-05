package com.mycompany.webapp.dto;

import lombok.Data;

@Data
public class CartitemJoinProduct {
	private String pcode;
	private String pimage1; //Product Table
	private String pbrand; //Product Table
	private String pname; //Product Table
	private String pcolor;
	private String psize;
	private int pprice; //Product Table
	private int pquantity;
}