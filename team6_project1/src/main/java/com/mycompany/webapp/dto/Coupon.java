package com.mycompany.webapp.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Coupon {
	private String ccode;
	private String mid;
	private String cname;
	private int crate;
	private char cstatus;
	@Override
	public String toString() {
		return "Coupon [ccode=" + ccode + ", mid=" + mid + ", cname=" + cname + ", crate=" + crate + ", cstatus="
				+ cstatus + "]";
	}
}
