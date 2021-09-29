package com.mycompany.webapp.dto;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@AllArgsConstructor
@RequiredArgsConstructor
public class OrderDto {
    private int oid;
    @NonNull
    private String mid;
    @NonNull
    private String pcode;
    @NonNull
    private String pcolor;
    @NonNull
    private String psize;
    @NonNull
    private String otime;
    @NonNull
    private char opaymentmethod;
    @NonNull
    private int oquantity;
    @NonNull
    private int oprice;
	@Override
	public String toString() {
		return "OrderDto [oid=" + oid + ", mid=" + mid + ", pcode=" + pcode + ", pcolor=" + pcolor + ", psize=" + psize
				+ ", otime=" + otime + ", opaymentmethod=" + opaymentmethod + ", oquantity=" + oquantity + ", oprice="
				+ oprice + "]";
	}
}