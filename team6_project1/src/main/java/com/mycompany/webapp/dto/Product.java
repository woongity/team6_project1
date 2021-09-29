package com.mycompany.webapp.dto;

import lombok.Data;

@Data
public class Product {
	private String pid;
	private int pprice; 
	private String pname;
	private String pthumbnail;
	private String psize;
	private String pcolor;
	private String pbrand;
	private int pstock;
	@Override
	public String toString() {
		return "Product [pid=" + pid + ", pprice=" + pprice + ", pname=" + pname + ", pthumbnail=" + pthumbnail
				+ ", psize=" + psize + ", pcolor=" + pcolor + ", pbrand=" + pbrand + ", pstock=" + pstock + "]";
	}
}
