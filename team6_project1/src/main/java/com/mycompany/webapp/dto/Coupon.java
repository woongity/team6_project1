package com.mycompany.webapp.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
@AllArgsConstructor
public class Coupon {
	@NonNull
	private String ccode;
	@NonNull
	private String mid;
	@NonNull
	private String cname;
	@NonNull
	private int crate;
	private String ccontent;
	private String creleasedate;
	private String cexpiredate;
	@NonNull
	private char cstatus;
	private String ecode;
}
