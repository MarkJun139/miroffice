package com.group4.miroffice.forum;

import java.util.Date;

import lombok.Data;

@Data
public class ForumDto {

	private int forumNo;
	private int empNo;
	private int deptNo;
	private String forumTitle;
	private String forumText;
	private Date forumDate;
	private int forumCount;
	private Boolean forumNotice;
	private String forumFiles;
	private String forumOfiles;
	
	private String empName;
	private String empRank;
	private String empPhoto;
	private int commentCount;
}
