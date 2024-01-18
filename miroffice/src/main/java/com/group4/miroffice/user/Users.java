package com.group4.miroffice.user;

import java.util.Date;

//import org.springframework.security.core.userdetails.UserDetails;

import com.group4.miroffice.dto.Role;

//import jakarta.validation.constraints.NotBlank;
//import jakarta.validation.constraints.Pattern;
import lombok.Data;

@Data
public class Users {

	private int empNo;
	private int deptNo;
	private String empPw;
	private String empName;
	private Date empHiredate;
	private String empRank;
	private String empPhone;
	private int empSal;
	private String empAddress;
	private String empAddress2;
	private String empEmail;
	private Date empBirth;
	private String empPhoto;
	private Role empRole;
	private int empDayoff;
	private String empJob;

	private Boolean empApprove;
}
