package com.group4.miroffice.approval;

import java.io.File;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

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
	public String adminApprovalList() {
		return "admin/approval/list";
	}
	
	@GetMapping("/admin/approval/write")
	public String adminApprovalWrite() {
		return "admin/approval/write";
	}
	
	@PostMapping("/admin/approval/submit")
	public String adminApprovalSubmit(ApprovalDto dto) {
		System.out.println(dto);
		return "admin/approval/write";
	}
	
	@PutMapping("/admin/approval/edit")
	public String adminApprovalEdit() {
		return "admin/approval/edit";
	}
	
	@DeleteMapping("/admin/approval/delete")
	public String adminApprovalDelete() {
		return "admin/approval";
	}
	
	
	@PostMapping("/file/upload")
	public ModelAndView image(MultipartHttpServletRequest request) throws Exception {
		
		ModelAndView mav = new ModelAndView("jsonView");

		MultipartFile uploadFile = request.getFile("upload");

		String originalFileName = uploadFile.getOriginalFilename();

		String ext = originalFileName.substring(originalFileName.indexOf("."));

		String newFileName = UUID.randomUUID() + ext;

		String realPath = request.getServletContext().getRealPath("/");

		System.out.println("쿵짞"+ realPath);
		String savePath = realPath + "upload/" + newFileName;
  
		String uploadPath = "./upload/" + newFileName; 

		File file = new File(savePath);

		uploadFile.transferTo(file);

		mav.addObject("uploaded", true);
		mav.addObject("url", uploadPath);

		return mav;
	}
}
