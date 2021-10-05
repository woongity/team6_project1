package com.mycompany.webapp.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class CartitemJoinAllProduct {
   private String mid;
   private String pcode;
   private String pcolor;
   private String psize;
   private int pquantity;
   private String pname;
   private String pimage1;
   private String pimage2;
   private String pimage3;
   private String pcolorimage;
   private int pprice;
   private String pbrand;
   private int pstock;
   
   @Override
   public String toString() {
      return "CartitemJoinProduct [mid=" + mid + ", pcode=" + pcode + ", pcolor=" + pcolor + ", psize=" + psize
            + ", pquantity=" + pquantity + ", pname=" + pname + ", pimage1=" + pimage1 + ", pcolorimage="
            + pcolorimage + ", pprice=" + pprice + ", pbrand=" + pbrand + ", pstock=" + pstock + "]";
   }
}