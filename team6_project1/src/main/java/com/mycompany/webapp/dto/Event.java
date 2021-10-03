package com.mycompany.webapp.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Event {
	private String ecode;
	private String ename;
	private String eimage;
	private String econtent;
	private String eopendate;
	private String eenddate;
	private int egrosscoupon;
	private int estockcoupon;
}
