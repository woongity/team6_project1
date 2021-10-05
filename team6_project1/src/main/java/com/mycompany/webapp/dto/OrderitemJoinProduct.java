package com.mycompany.webapp.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class OrderitemJoinProduct {
	String pname;
	int pquantity;
	String pimage1;
	String pbrand;
	String pcolor;
	String psize;
	String pcode;
	String oid;
	int oprice;
}