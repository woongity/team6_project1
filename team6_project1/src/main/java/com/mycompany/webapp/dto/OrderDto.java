package com.mycompany.webapp.dto;

import java.util.Date;

import lombok.Data;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor

public class OrderDto {
    @NonNull
	int oid;
    @NonNull
	String mid;
    @NonNull
	String pid;
    @NonNull
	int oquantity;
    @NonNull
	int oprice;
    String datetime;
    @NonNull
	char opaymentmethod;
}
