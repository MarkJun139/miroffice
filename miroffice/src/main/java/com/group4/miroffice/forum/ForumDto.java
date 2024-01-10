package com.group4.miroffice.forum;

import java.util.Date;

import lombok.Data;

@Data
public class ForumDto {

	private int forum_no;
	private int emp_no;
	private int dept_no;
	private String forum_title;
	private String forum_text;
	private Date forum_date;
	private int forum_count;
	private boolean forum_notice;
	private String forum_files;
}
