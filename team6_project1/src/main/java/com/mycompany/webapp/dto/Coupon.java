package com.mycompany.webapp.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
@AllArgsConstructor
@NoArgsConstructor
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
	@NonNull
	private String creleasedate;
	private String cexpiredate;
	private String ecode;
	@NonNull
	private char cstatus;
}
