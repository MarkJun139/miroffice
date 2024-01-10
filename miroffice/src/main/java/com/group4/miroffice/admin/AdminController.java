package com.group4.miroffice.admin;

import java.awt.Image;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.group4.miroffice.dto.Admin;
import com.group4.miroffice.dto.Dept;
import com.group4.miroffice.dto.Main;
import com.group4.miroffice.dto.Users;

@Controller
@RequestMapping("/main")
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	
	
	@GetMapping("/admin/emp/list")
	public String AdminEmpList(Model m) {
		
		List<Main> empList =  adminService.empList();
		
		m.addAttribute("empList", empList);
		
		return "admin/emp/list";
	}
	
	@GetMapping("/admin/emp/add")
	public String AdminEmpAddForm(Model m) {
		List<Dept> deptList = adminService.deptList();
		
		m.addAttribute("deptList", deptList);
		
		return "admin/emp/add";
	}
	
	// 이미지 테스트
	/*
	 * @PostMapping("/admin/emp/img") public String
	 * imageTest(@RequestPart("empPhotoFile") MultipartFile file) throws IOException
	 * {
	 * 
	 * String dir = "src/main/resources/static/images/emp_photo/";
	 * 
	 * Path uploadPath = Paths.get(dir); if (!Files.exists(uploadPath)) {
	 * Files.createDirectories(uploadPath); }
	 * 
	 * String filePath = dir + file.getOriginalFilename(); Path destination =
	 * Paths.get(filePath); Files.write(destination, file.getBytes());
	 * 
	 * System.out.println(file); System.out.println(file.getName());
	 * System.out.println(file.getContentType());
	 * System.out.println(file.getOriginalFilename());
	 * 
	 * return "redirect:/main/admin/emp/list"; }
	 */
	
	@PostMapping("/admin/emp/addemp")
	public String AdminEmpAdd(@RequestParam("empHiredate") String hiredate,@RequestParam("deptNo") int deptno, @RequestPart("empPhotoFile") MultipartFile file,Admin admin) throws IOException {
		
		String empNoYear = hiredate.substring(2,4);
		int dno = admin.getDeptNo();
		String deptNo;
		if(dno <= 10) {
			deptNo = "0" + dno;
		} else {
			deptNo = dno + "";
		}
		String empCount = adminService.getEmpCount(deptno);
		String empNo = empNoYear + deptNo + empCount;
		
		// ----- // 
		
		String fileType = file.getOriginalFilename();
	    String extension = "";
	    int lastDotIndex = fileType.lastIndexOf('.');
	    
	    if (lastDotIndex > 0) {
	        extension = fileType.substring(lastDotIndex + 1).toLowerCase();
	    }
		List<String> imageContainType = Arrays.asList("jpg", "jpeg", "png");
		
		if(imageContainType.contains(extension)) {
			String dir = "src/main/resources/static/images/emp_photo/"; // 사원 이미지 경로
			String fileName = empNo + "." + extension; // 파일 이름
			
			Path uploadPath = Paths.get(dir); // 폴더 없으면 생성
	        if (!Files.exists(uploadPath)) {
	            Files.createDirectories(uploadPath);
	        }
	        // 파일 저장
			String filePath = dir + fileName;
	        Path destination = Paths.get(filePath);
	        Files.write(destination, file.getBytes());
	        admin.setEmpPhoto("/emp_photo/" + fileName);
		}
		// ----- //
		
		System.out.println("사원 등록 ");
		System.out.println("등록 정보 " + admin);
		
		admin.setEmpNo(Integer.parseInt(empNo));
		admin.setEmpDayoff(0);
		
		admin.setEmpPw("1234");
		
		
		adminService.addEmp(admin);
		
		return "redirect:/main/admin/emp/list";
	}

	
	
	@GetMapping("/admin/emp/edit/{id}")
	public String AdminEmpEdit(@PathVariable(name = "id") int id, Model m) {
		List<Dept> deptList = adminService.deptList();
		Admin emp = adminService.empInfo(id);	
		
		m.addAttribute("emp", emp);
		m.addAttribute("deptList", deptList);
		
		return "admin/emp/edit";
	}
	
	@PutMapping("/admin/emp/editemp")
	public String AdminEmpUpdate(@RequestPart("empPhotoFile") MultipartFile file, Admin admin) {
		
		
		
		return "redirect:/main/admin/emp/list";
	}
	
	
	@DeleteMapping("/admin/emp/delete/{id}")
	public String AdminEmpDelete(@PathVariable(name = "id") int id) throws IOException {
		
		String empPhoto = adminService.getEmpPhoto(id);
		Path path = Paths.get("src/main/resources/static/images" + empPhoto);
		Files.deleteIfExists(path);
		
		adminService.deleteEmp(id);
		return "redirect:/main/admin/emp/list";
	}
}
