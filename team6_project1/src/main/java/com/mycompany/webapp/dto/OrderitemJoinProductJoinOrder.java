package com.mycompany.webapp.dto;

import lombok.Data;

@Data
public class OrderitemJoinProductJoinOrder {
	private String pname;
	private int pquantity;
	private String pimage1;
	private String pbrand;
	private String pcolorimage;
	private String pcolor;
	private String psize;
	private String pcode;
	private String oid;
	private int oprice;
	private String ostatus;
	private String otime;
}
