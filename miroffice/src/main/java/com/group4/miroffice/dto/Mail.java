package com.group4.miroffice.dto;

import lombok.Data;

@Data
public class Mail {
	
	private String to; // 수신자
	private String title; // 제목
	private String message; // 내용
}
