package com.mycompany.webapp.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
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