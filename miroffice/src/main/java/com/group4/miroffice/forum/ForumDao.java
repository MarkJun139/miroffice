package com.group4.miroffice.forum;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ForumDao {
	
	List<ForumDto> forumList(Map<String, Object> map);
	
	List<ForumDto> forumListAdmin(Map<String, Object> map);
	
	List<ForumDto> forumNotice(int forumno);
	
	ForumDto forumOne(int forumno);
	
	int forumWrite(ForumDto dto);

	int forumEdit(ForumDto dto);
	
	int forumDelete(int forumno);
	
	int forumCountup(int forumno);
	
	int fileUpload(Map<String, Object> map);
}
