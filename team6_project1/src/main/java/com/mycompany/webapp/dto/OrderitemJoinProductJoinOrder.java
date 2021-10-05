package com.mycompany.webapp.dto;

import lombok.Data;

@Data
public class OrderitemJoinProductJoinOrder {
	String pname;
	int pquantity;
	String pimage1;
	String pbrand;
	String pcolorimage;
	String pcolor;
	String psize;
	String pcode;
	String oid;
	int oprice;
	String ostatus;
	String otime;
}
