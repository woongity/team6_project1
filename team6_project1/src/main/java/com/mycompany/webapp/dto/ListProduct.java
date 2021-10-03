package com.mycompany.webapp.dto;

import java.util.HashMap;
import java.util.TreeSet;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@AllArgsConstructor
@RequiredArgsConstructor
public class ListProduct {
	private String pcode;
	private String pname;
	private final TreeSet<String> pcolorTreeSet;
	private final TreeSet<String> psizeTreeSet;
	private final TreeSet<String> pimage1TreeSet;
	private final TreeSet<String> pimage2TreeSet;
	private final TreeSet<String> pimage3TreeSet;
	private final TreeSet<String> pcolorimageTreeSet;
	private int pprice;
	private String pbrand;
	final private HashMap<String,Integer> pstock;
}