package com.group4.miroffice.forum;

import java.util.Date;

import lombok.Data;

@Data
public class CommentDto {
	public int commentNo;
	public int forumNo;
	public int empNo;
	public String commentText;
	public Date commentDate;
	
	public String empName;
	public String empRank;
	public String empPhoto;
	
}
