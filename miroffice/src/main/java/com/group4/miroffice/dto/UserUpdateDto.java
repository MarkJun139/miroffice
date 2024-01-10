package com.group4.miroffice.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@AllArgsConstructor
@Getter
@Setter
public class UserUpdateDto {
	
	private String empPhone;
    private String empAddress;
    private String empAddress2;
    private String empEmail;
    private String empPhoto;
    private String empPw;
  
}
