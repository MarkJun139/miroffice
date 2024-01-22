package com.group4.miroffice.forum;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ForumService {
	@Autowired
	ForumDao dao;
	
	public List<ForumDto> forumList(int deptno){
		return dao.forumList(deptno);
	}
	
	public ForumDto forumOne(int forumno) {
		return dao.forumOne(forumno);
	}
	
	public int forumWrite(ForumDto dto) {
		return dao.forumWrite(dto);
	}
	
	public int forumEdit(ForumDto dto) {
		return dao.forumEdit(dto);
	}
	
	public int forumCountup(int forumno) {
		return dao.forumCountup(forumno);
	}
	
	public int forumDelete(int forumno) {
		return dao.forumDelete(forumno);
	}
}
