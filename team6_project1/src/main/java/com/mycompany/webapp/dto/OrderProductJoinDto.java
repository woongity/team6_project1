package com.mycompany.webapp.dto;

import java.util.Date;

import lombok.Data;

@Data
public class OrderProductJoinDto {
	private String mid;
	private int oid;
	private String pname;
	private int oquantity;
	private String pthumbnail;
	private int oprice;
	private String otime;
	@Override
	public String toString() {
		return "OrderProductJoinDto [mid=" + mid + ", oid=" + oid + ", oquantity=" + oquantity + ", pthumbnail="
				+ pthumbnail + ", oprice=" + oprice + ", otime=" + otime  + "]";
	}
}
