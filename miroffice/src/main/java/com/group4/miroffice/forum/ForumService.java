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
	
	public List<ForumDto> forumListAdmin(Map<String, Object> map){
		return dao.forumListAdmin(map);
	}
	
	public List<ForumDto> forumNotice(int forumno){
		return dao.forumNotice(forumno);
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
		//업로드 경로 설정
	    String fuploadPath = System.getProperty("user.dir")+"/src/main/webapp/upload/file/";
	    
		//원본 파일 이름 취득
		String originalFileName = files.getOriginalFilename();
		
		//받아온 파일 이름이 존재할 때
		if(originalFileName != "") {
			//파일이름에 범용 고유 식별자인 UUID를 사옹하여 같은 이름의 파일을 업로드해도 다른 파일명으로 저장됨
			String fileName = UUID.randomUUID() + "_" + originalFileName;
			
			//새 파일 형식을 만듦(경로+파일이름)
			File newFile = new File(fuploadPath + fileName);
			
			//업로드 파일을 해당 경로에 해당 이름으로 생성
			files.transferTo(newFile);
			
			//컨트롤러에 파일 원본 이름과 업로드된 파일 이름을 return 해주어 DB에 저장할 수 있게 함
			Map<String, Object> map = new HashMap<>();
			map.put("forumOfiles", originalFileName);
			map.put("forumFiles", fileName);
			return map;
		}
		else {
			//파일을 업로드 하지 않았을 때
			return null;
		}
	}
	
}
