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
	@Override
	public String toString() {
		return "Product [pcode=" + pcode + ", pname=" + pname + ", pcolor=" + pcolor + ", psize=" + psize + ", pimage1="
				+ pimage1 + ", pimage2=" + pimage2 + ", pimage3=" + pimage3 + ", pcolorimage=" + pcolorimage
				+ ", pprice=" + pprice + ", pbrand=" + pbrand + ", pstock=" + pstock + "]";
	}
}