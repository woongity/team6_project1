package com.mycompany.webapp.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Member {
	private String mid;
	private String mname;
	private String mpassword;
	private String maddress;
	private String mtel;
	private String memail;
	private int menabled;
	private String mrole;
}
