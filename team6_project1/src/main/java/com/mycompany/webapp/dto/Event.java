package com.mycompany.webapp.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

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
	@Override
	public String toString() {
		return "Event [ecode=" + ecode + ", ename=" + ename + ", eimage=" + eimage + ", econtent=" + econtent
				+ ", eopendate=" + eopendate + ", eenddate=" + eenddate + ", egrosscoupon=" + egrosscoupon
				+ ", estockcoupon=" + estockcoupon + "]";
	}
}
