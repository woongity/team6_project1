package com.mycompany.webapp.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
@AllArgsConstructor
public class CartitemJoinProduct {
	private String mid;
	@NonNull
	private String pcode;
	@NonNull
	private String pcolor;
	@NonNull
	private String psize;
	@NonNull
	private int pquantity;
	@NonNull
	private String pname;
	@NonNull
	private String pimage1;
	private String pimage2;
	private String pimage3;
	private String pcolorimage;
	@NonNull
	private int pprice;
	@NonNull
	private String pbrand;
	private int pstock;
	@Override
	public String toString() {
		return "CartitemJoinProduct [mid=" + mid + ", pcode=" + pcode + ", pcolor=" + pcolor + ", psize=" + psize
				+ ", pquantity=" + pquantity + ", pname=" + pname + ", pimage1=" + pimage1 + ", pimage2=" + pimage2
				+ ", pimage3=" + pimage3 + ", pcolorimage=" + pcolorimage + ", pprice=" + pprice + ", pbrand=" + pbrand
				+ ", pstock=" + pstock + "]";
	}

}
