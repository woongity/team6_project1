package com.mycompany.webapp.dto;

import lombok.Data;

@Data
public class OrderitemJoinProductJoinOrder {
	String pname;
	int pquantity;
	String pimage1;
	String pbrand;
	String pcolor;
	String psize;
	String pcode;
	String oid;
	int oprice;
	String ostatus;
	String otime;
	@Override
	public String toString() {
		return "OrderitemJoinProduct [pname=" + pname + ", pquantity=" + pquantity + ", pimage1=" + pimage1
				+ ", pbrand=" + pbrand + ", pcolor=" + pcolor + ", psize=" + psize + ", pcode=" + pcode + ", oid=" + oid
				+ ", oprice=" + oprice + ", ostatus=" + ostatus + ", otime=" + otime + "]";
	}	
}
