package com.group4.miroffice.approval;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/main")
public class ApprovalController {
	
	@Autowired
	ApprovalService service;

	@GetMapping("/approval")
	public String approval() {
		return "approval/list";
	}
	
	@PostMapping("/approval/submit")
	public String approvalSubmit() {
		service.approvalSubmit(null);
		return "approval/submit";
	}
	
	@GetMapping("/approval/current")
	public String approvalCurrent() {
		return "approval/current";
	}
	
	@PostMapping("/approval/yes")
	public String approvalYes() {
		return "approval/current";
	}
	
	@PostMapping("/approval/no")
	public String approvalNo() {
		return "approval/current";
	}
	

	@GetMapping("/admin/approval")
	public String adminApprovalList(Model m) {
		List<ApprovalDto> al = service.approvalList(99);
		System.out.println("s"+al);
		m.addAttribute("list", al);
		
		return "admin/approval/list";
	}
	

	@RequestMapping("/admin/approval/write2")
	public String adminApprovalWrite2() {
		return "admin/approval/write2";
	}
	
	
	@RequestMapping("/admin/approval/write")
	public String adminApprovalWrite(@ModelAttribute ApprovalDto dto, RedirectAttributes rttr) throws Exception {
		System.out.println(dto);
		service.adminApprovalWrite(dto);
		return "admin/approval/write2";
	}
	
	
	@PutMapping("/admin/approval/edit")
	public String adminApprovalEdit() {
		return "admin/approval/edit";
	}
	
	@DeleteMapping("/admin/approval/delete")
	public String adminApprovalDelete() {
		return "admin/approval";
	}

	@ResponseBody
	@RequestMapping(value = "/file/upload", method = {RequestMethod.POST, RequestMethod.GET})
	public String fileUpload(Model model,  
	        @RequestParam(value="upload", required = false) MultipartFile fileload,
	        HttpServletRequest req) {
		
		//서버에 파일을 저장할 때에는 파일명을 시간값으로 변경
	    //DB에 저장할 때에는 원본 파일명과 시간값을 모두 저장
	    //filename 취득
		String originalFileName = fileload.getOriginalFilename();
		String ext = originalFileName.substring(originalFileName.indexOf("."));
		String fileName = UUID.randomUUID() + ext;
	    
	    //upload 경로 설정(tomcat realpath)
	    String fuploadPath = req.getServletContext().getRealPath("/upload/editor");
	 
	    //폴더 경로 설정
	    String newfilename = fileName;
	    
	    //업로드 수행	    
	    File file = new File(fuploadPath + "/" + newfilename);
	    
	    try {
	        //실제 파일이 업로드 되는 부분
	        FileUtils.writeByteArrayToFile(file, fileload.getBytes() );	        
	        return "{ \"uploaded\" : true, \"url\" : \"http://localhost:8080/upload/editor/" + newfilename + "\" }";
	    } catch (IOException e) {
	        // TODO Auto-generated catch block
	    	return "{ \"uploaded\" : false, \"error\": { \"message\": \"업로드 중 에러가 발생했습니다. 다시 시도해 주세요.\" } }";
	    }
	}
	
//	@PostMapping("/file/upload")
//	public ModelAndView image(MultipartHttpServletRequest request) throws Exception {
//		
//		ModelAndView mav = new ModelAndView("jsonView");
//
//		MultipartFile uploadFile = request.getFile("upload");
//
//		String originalFileName = uploadFile.getOriginalFilename();
//
//		String ext = originalFileName.substring(originalFileName.indexOf("."));
//
//		String newFileName = UUID.randomUUID() + ext;
//
//		String realPath = request.getServletContext().getRealPath("/");
//
//		System.out.println("쿵짞"+ realPath);
//		String savePath = realPath + "upload/" + newFileName;
//  
//		String uploadPath = "./upload/" + newFileName; 
//
//		File file = new File(savePath);
//
//		uploadFile.transferTo(file);
//
//		mav.addObject("uploaded", true);
//		mav.addObject("url", uploadPath);
//
//		return mav;
//	}
}
