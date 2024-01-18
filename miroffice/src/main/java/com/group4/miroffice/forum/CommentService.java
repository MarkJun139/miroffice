package com.group4.miroffice.forum;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentService {
	@Autowired
	CommentDao dao;
	
	public List<CommentDto> commentList(int forumno){
		return dao.commentList(forumno);
	}
	
	public int commentCount(int forumno) {
		return dao.commentCount(forumno);
	}

	public int commentWrite(CommentDto dto) {
		return dao.commentWrite(dto);
	}
	
	public int commentDelete(int commentno) {
		return dao.commentDelete(commentno);
	}
}
