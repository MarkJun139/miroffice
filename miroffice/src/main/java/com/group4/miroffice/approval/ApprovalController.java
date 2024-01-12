package com.group4.miroffice.approval;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.group4.miroffice.config.SecurityUser;
import com.group4.miroffice.user.UserService;
import com.group4.miroffice.user.Users;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/main")
public class ApprovalController {
	
	@Autowired
	ApprovalService service;

	@Autowired
	UserService us;
	
	
	@GetMapping("/approval")
	public String approval(Model m, @AuthenticationPrincipal SecurityUser userLog, @RequestParam(value="status", defaultValue="1") String status) {
		int st = Integer.parseInt(status);
		System.out.println(st);
		if(st == 1) {
			List<ApprovalDto> al = service.approvalList(99);
			
			for(ApprovalDto res: al){
				System.out.println(res.getEmpNo());
				Users user = us.findById(res.getEmpNo());
				String uName = user.getEmpName();
				res.setEmpName(uName);
			}
			Users dto = userLog.getUsers();
			List<Users> ul = us.findMyDeptEmp(dto.getDeptNo());
			
			Iterator<Users> it = ul.iterator();
			while(it.hasNext()) {
				Users item = it.next();
				if(item.getEmpNo() == dto.getEmpNo()) {
					it.remove();
				}
			}

			System.out.println("lis"+al);
			
			m.addAttribute("list", al);
			m.addAttribute("ulist", ul);
			return "approval/list";
		}
		if(st == 2) {
			Users dto = userLog.getUsers();
			
			List<ApprovalDto> al = service.approval(dto.getEmpNo());
			
			for(ApprovalDto res: al){
				System.out.println(res.getEmpNo());
				Users user = us.findById(res.getEmpNo());
				String uName = user.getEmpName();
				res.setEmpName(uName);
			}
				
			System.out.println("lis"+al);
			
			m.addAttribute("list", al);
			
		}
		
		return "approval/mylist";

	}
//	
//	@GetMapping("/approval/list")
//	public String approvalList(Model m, @AuthenticationPrincipal SecurityUser userLog) {
//
//		return "approval/list";
//	}
	
	@PostMapping("/approval/oneapprove/{no}")
	public ResponseEntity<List<Users>> approvalOneApprove(@PathVariable(name="no") int no) {
		ApprovalDto al = service.approvalListOne(no);

		Map<String, Integer> map = new HashMap<>();
		map.put("u1", al.getAppAdmin1());
		map.put("u2", al.getAppAdmin2());
		map.put("u3", al.getAppAdmin3());
		
		List<Users> ul = us.findMyApproveEmp(map);
		
		int index = 0;
		for(Users dto: ul) {
			if (index == 0) {
				dto.setEmpApprove(al.getAppApprove1());
			}
			else if (index == 1) {
				dto.setEmpApprove(al.getAppApprove2());;
			}
			else if (index ==2) {
				dto.setEmpApprove(al.getAppApprove3());
			}
			index++;
		}
		
		System.out.println("하이하이" + ul);
		return ResponseEntity.ok(ul);
	}

	@PostMapping("/approval/one/{no}")
	public ResponseEntity<ApprovalDto> ApprovalListOne(@PathVariable(name="no") int no) {
		ApprovalDto al = service.approvalListOne(no);
		
		System.out.println("에이피"+al);
		
		return ResponseEntity.ok(al);
	}
	
	@PostMapping("/approval/submit")
	public String approvalSubmit(@ModelAttribute ApprovalDto dto, RedirectAttributes rttr, @AuthenticationPrincipal SecurityUser user) throws Exception {
//		System.out.println("submit입니다"+dto);
		Users userD = user.getUsers();
//		System.out.println("submit유저에오"+userD);
		
		dto.setEmpNo(userD.getEmpNo());
		dto.setDeptNo(userD.getDeptNo());
		System.out.println("submit입니다"+dto);
		service.approvalSubmit(dto);
		return "redirect:/main/approval";
	}
	
//	@GetMapping("/userload")
//	public Users userLoad(@AuthenticationPrincipal SecurityUser user) {
//		Users dto = user.getUsers();
//		return dto;
//	}
	
	@GetMapping("/teamleader/approval/current")
	public String approvalCurrent() {
		return "teamleader/approval/current";
	}
	
	@PostMapping("/teamleader/approval/yes")
	public String approvalYes() {
		return "redirect:/main/teamleader/approval/current";
	}
	
	@PostMapping("/teamleader/approval/no")
	public String approvalNo() {
		return "redirect:/main/teamleader/approval/current";
	}
	

	@GetMapping("/admin/approval")
	public String adminApprovalList(Model m) {
		List<ApprovalDto> al = service.approvalList(99);
		
		for(ApprovalDto res: al){
			System.out.println(res.getEmpNo());
			Users user = us.findById(res.getEmpNo());
			String uName = user.getEmpName();
			res.setEmpName(uName);
		}
		
		System.out.println("lis"+al);
		m.addAttribute("list", al);
		
		return "admin/approval/list";
	}
	
	@PostMapping("/admin/approval/one/{no}")
	public ResponseEntity<ApprovalDto> adminApprovalListOne(@PathVariable(name="no") int no) {
		ApprovalDto al = service.approvalListOne(no);
		
		System.out.println("sone"+al);
		
		return ResponseEntity.ok(al);
	}
	

	@GetMapping("/admin/approval/write")
	public String adminApprovalWrite2() {
		return "admin/approval/write";
	}
	
	
	@PostMapping("/admin/approval/write")
	public String adminApprovalWrite(@ModelAttribute ApprovalDto dto, RedirectAttributes rttr) throws Exception {
		System.out.println(dto);
		service.adminApprovalWrite(dto);
		return "redirect:/main/admin/approval";
	}
	
	
	@PostMapping("/admin/approval/edit")
	public String adminApprovalEdit(@ModelAttribute ApprovalDto dto) {
		System.out.println("준식"+dto);
		System.out.println(service.adminApprovalEdit(dto));
		return "redirect:/main/admin/approval";
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
