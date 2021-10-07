package com.mycompany.webapp.dto;

import lombok.Data;

@Data
public class CartitemJoinProduct {
   private String pcode;
   private String pimage1;
   private String pcolorimage;
   private String pbrand;
   private String pname;
   private String pcolor;
   private String psize;
   private int pprice;
   private int pquantity;
}