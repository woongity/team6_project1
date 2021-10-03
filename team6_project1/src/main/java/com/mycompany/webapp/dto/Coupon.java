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
	private String ccontent;
	private String creleasedate;
	private String cexpiredate;
	private int cstatus;
	private String ecode;
}
