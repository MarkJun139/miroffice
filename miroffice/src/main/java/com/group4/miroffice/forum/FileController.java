package com.group4.miroffice.forum;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletResponse;

@Controller
//@RequestMapping("/main")
public class FileController {

//	@RequestMapping(value = "/file/upload", method = {RequestMethod.POST, RequestMethod.GET})
//	public String fileUpload(Model m,  
//	        @RequestParam(value="upload", required = false) ArrayList<MultipartFile> fileload) throws IOException{
//
//	    
//	    //upload 경로 설정(tomcat realpath)
//	    String fuploadPath = req.getServletContext().getRealPath("/upload/editor");
//	    
//	    
//		ArrayList<String> originalFileNameList = new ArrayList<String>();
//		//서버에 파일을 저장할 때에는 파일명을 시간값으로 변경
//	    //DB에 저장할 때에는 원본 파일명과 시간값을 모두 저장
//	    //filename 취득
//		for(MultipartFile file: fileload) {
//			String originalFileName = file.getOriginalFilename();
//			originalFileNameList.add(originalFileName);
//			
//			String fileName = UUID.randomUUID() + "_" + originalFileName;
//			
//			File newFile = new File(fuploadPath + fileName);
//			
//			file.transferTo(newFile);
//			
//			m.addAttribute("list", originalFileNameList);
//			return "as";
//			
//		}
//	}
//	
//		
//		// 파일 목록 보여주기
//		@RequestMapping("/fileDownloadList")
//		public ModelAndView fileDownloadList(ModelAndView mv) {
//			File path = new File("/Library/springWorkspace/upload/");
//			String[] fileList = path.list();
//			
//			mv.addObject("fileList", fileList);
//			mv.setViewName("upload/fileDownloadListView");
//			
//			return mv;
//		}
//		
//		// 파일 다운로드 
//		@RequestMapping("/fileDownload/{file}")
//		public void fileDownload(@PathVariable String file, 
//									HttpServletResponse response) throws IOException {
//			
//			File f = new File("/Library/springWorkspace/upload/", file);
//			// 파일명 인코딩
//			String encodedFileName = new String (file.getBytes("UTF-8"), "ISO-8859-1");
//
//			// file 다운로드 설정
//			response.setContentType("application/download");
//			response.setContentLength((int)f.length());
//			response.setHeader("Content-Disposition", "attatchment;filename=\"" + encodedFileName + "\"");
//			
//			// 다운로드 시 저장되는 이름은 Response Header의 "Content-Disposition"에 명시
//			OutputStream os = response.getOutputStream();
//			
//			FileInputStream fis = new FileInputStream(f);
//			FileCopyUtils.copy(fis, os);
//			
//			// fis.close();
//			// os.close();
//			
//		}
//	
}
