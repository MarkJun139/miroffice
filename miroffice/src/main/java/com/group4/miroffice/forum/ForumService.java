package com.group4.miroffice.forum;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class ForumService {
	@Autowired
	ForumDao dao;

	
	public List<ForumDto> forumList(Map<String, Object> map){
		return dao.forumList(map);
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
	
	public Map<String, Object> fileUpload(MultipartFile files) throws IOException {
		
	    String fuploadPath = System.getProperty("user.dir")+"\\src\\main\\webapp\\upload\\file\\";
	    
	    
		
		//서버에 파일을 저장할 때에는 파일명을 시간값으로 변경
	    //DB에 저장할 때에는 원본 파일명과 시간값을 모두 저장
	    //filename 취득
		String originalFileName = files.getOriginalFilename();
		
		if(originalFileName != "") {
			String fileName = UUID.randomUUID() + "_" + originalFileName;
			
			File newFile = new File(fuploadPath + fileName);
			
			files.transferTo(newFile);
			
			Map<String, Object> map = new HashMap<>();
			map.put("forumOfiles", originalFileName);
			map.put("forumFiles", fileName);
			System.out.println("여기서 오류가난독?");
			return map;
		}
		else {
			return null;
		}
		
		
		
	}
}
