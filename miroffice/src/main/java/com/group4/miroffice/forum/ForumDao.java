package com.group4.miroffice.forum;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface ForumDao {
	
	@Select("select * from forum where dept_no = #{deptno}")
	List<ForumDto> forumList(int deptno);
	
	@Select("select * from forum where forum_no = #{forumno}")
	ForumDto forumOne(int forumno);
}
