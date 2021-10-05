package com.mycompany.webapp.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
<<<<<<< Updated upstream
=======
import lombok.NoArgsConstructor;
>>>>>>> Stashed changes
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor
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
<<<<<<< Updated upstream
	@NonNull
	private char cstatus;
	private String ecode;
=======
	private String ecode;
	@NonNull
	private char cstatus;
	@Override
	public String toString() {
		return "Coupon [ccode=" + ccode + ", mid=" + mid + ", cname=" + cname + ", crate=" + crate + ", ccontent="
				+ ccontent + ", creleasedate=" + creleasedate + ", cexpiredate=" + cexpiredate + ", ecode=" + ecode
				+ ", cstatus=" + cstatus + "]";
	}
>>>>>>> Stashed changes
}
