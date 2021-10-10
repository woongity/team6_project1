package com.mycompany.webapp.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class OrderitemJoinProduct {
	private String pname;
	private int pquantity;
	private String pimage1;
	private String pcolorimage;
	private String pbrand;
	private String pcolor;
	private String psize;
	private String pcode;
	private String oid;
	private int oprice;
}