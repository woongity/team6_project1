package com.mycompany.webapp.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Product {
	private String pcode;
	private String pname;
	private String pcolor;
	private String psize;
	private String pimage1;
	private String pimage2;
	private String pimage3;
	private String pcolorimage;
	private int pprice;
	private String pbrand;
	private int pstock;
}