package com.group4.miroffice.user;

import java.util.Date;

//import org.springframework.security.core.userdetails.UserDetails;

import com.group4.miroffice.dto.Role;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
//import jakarta.validation.constraints.NotBlank;
//import jakarta.validation.constraints.Pattern;
import lombok.Data;

@Data
public class Users {
	@NotNull(message = "사원번호를 입력해주세요.")
	private int empNo;
	private int deptNo;
	private String empPw;
	@NotEmpty(message = "사원 이름을 입력해주세요.")
	private String empName;
	private Date empHiredate;
	private String empRank;
	@NotEmpty(message = "전화번호를 입력해주세요.")
	// @Pattern(regexp = "/^[0-9]*$/", message = "숫자만 입력 가능합니다.")
	private String empPhone;
	private int empSal;
	private String empAddress;
	private String empAddress2;
	@NotEmpty(message = "이메일을 입력해주세요.")
	@Email
	private String empEmail;
	private Date empBirth;
	private String empPhoto;
	private Role empRole;
	private int empDayoff;
	private String empJob;

	private Boolean empApprove;
	
	
}
