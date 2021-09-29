package com.mycompany.webapp.dto;

import lombok.Data;

@Data
public class CartbagDto {
	private String mid;
	private String pid;
	private int pquantity;
	@Override
	public String toString() {
		return "CartbagDto [mid=" + mid + ", pid=" + pid + ", pquantity=" + pquantity + "]";
	}
}
