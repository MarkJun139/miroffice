package com.group4.miroffice.forum;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CommentDao {
	
	List<CommentDto> commentList(int forumno);
	
	int commentCount(int forumno);
	
	int commentWrite(CommentDto dto);
	
	int commentDelete(int commentno);
	
	int commentEdit(CommentDto dto);
}
