package com.group4.miroffice.forum;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/main")
public class FileController {

	@Autowired
	ForumService sv;
	
	@RequestMapping(value = "/files/upload", method = {RequestMethod.POST, RequestMethod.GET})
	public String fileUpload(Model m,  
	        ArrayList<MultipartFile> fileload, int forumno,
	        HttpServletRequest req) throws IOException{

	    
	    //upload 경로 설정(tomcat realpath)

		
		return "";
	}
	
		
		// 파일 목록 보여주기
		@RequestMapping("/fileDownloadList")
		public ModelAndView fileDownloadList(ModelAndView mv) {
			File path = new File("/Library/springWorkspace/upload/");
			String[] fileList = path.list();
			
			mv.addObject("fileList", fileList);
			mv.setViewName("upload/fileDownloadListView");
			
			return mv;
		}
		
		// 파일 다운로드 

	
}
