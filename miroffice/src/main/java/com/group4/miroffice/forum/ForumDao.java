package com.group4.miroffice.forum;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ForumDao {
	
	List<ForumDto> forumList(int deptno);
	
	ForumDto forumOne(int forumno);
	
	int forumWrite(ForumDto dto);
	
	int forumCountup(int forumno);
}
