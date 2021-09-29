package com.mycompany.webapp.dto;

import java.util.Date;

import lombok.Data;
import lombok.NonNull;

@Data
public class OrderDto {
    private int oid;
    private String mid;
    private String pid;
    private int oquantity;
    private int oprice;
    private String datetime;
    private char opaymentmethod;
	@Override
	public String toString() {
		return "OrderDto [oid=" + oid + ", mid=" + mid + ", pid=" + pid + ", oquantity=" + oquantity + ", oprice="
				+ oprice + ", datetime=" + datetime + ", opaymentmethod=" + opaymentmethod + "]";
	}
}