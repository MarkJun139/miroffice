package com.group4.miroffice.admin;

import java.awt.Image;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.group4.miroffice.dto.Admin;
import com.group4.miroffice.dto.Dept;
import com.group4.miroffice.dto.Main;
import com.group4.miroffice.user.Users;

@Controller
@RequestMapping("/main")
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	
	// ---------------- 사원 관리 ---------------- //
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
	
	@PostMapping("/admin/emp/addemp")
	public String AdminEmpAdd(@RequestParam("empHiredate") String hiredate,@RequestParam("deptNo") int deptno, @RequestPart("empPhotoFile") MultipartFile file,Admin admin) throws IOException {
		try {
		// 입사일 6자리
		LocalDate simple = LocalDate.parse(hiredate);
		String simplePW = simple.format(DateTimeFormatter.ofPattern("yyMMdd"));
		System.out.println(simplePW);
		// --- 
				
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
		int checkEmpNo = Integer.parseInt(empNo);
		while(adminService.isEmpNo(checkEmpNo) > 0) {
			checkEmpNo += 1;
		}
		empNo = checkEmpNo + "";
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
	        // 사진 저장
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
		
		admin.setEmpPw(simplePW);
		
		
		adminService.addEmp(admin);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
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
	public String AdminEmpUpdate(@RequestPart("empPhotoFile") MultipartFile file,@RequestParam("empNo") int empNo , Admin admin) throws IOException {
		try {
			
		
		// 기존 사진
		String empPhoto = adminService.getEmpPhoto(empNo);
		// 사진이 업로드 됐을 때
		if(!file.isEmpty()) {
			// 기존 사진 삭제
			Path path = Paths.get("src/main/resources/static/images" + empPhoto);
			Files.deleteIfExists(path);
			
			// 사진 업로드 // 
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
		        // 사진 저장
				String filePath = dir + fileName;
		        Path destination = Paths.get(filePath);
		        Files.write(destination, file.getBytes());
		        admin.setEmpPhoto("/emp_photo/" + fileName);
			}
			
		} else { // 사진이 업로드 안됐을 때
			admin.setEmpPhoto(empPhoto);
		}
		adminService.empUpdate(admin);
		System.out.println("사원 정보 수정 : " + admin);
		} catch (Exception e) {
			System.out.println("사원 정보 수정 실패");
			e.getMessage();
		}
		
		
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
	
	@DeleteMapping("/admin/emp/deletecheck")
	public ResponseEntity<String> AdminEmpDeleteCheck(@RequestParam("empDelCheck") List<String> checkList) {
		try {
			System.out.println(checkList);
			adminService.deleteEmpCheck(checkList);
			for(String empNo : checkList) {
				
				String empPhoto = adminService.getEmpPhoto(Integer.parseInt(empNo));
				Path path = Paths.get("src/main/resources/static/images" + empPhoto);
				Files.deleteIfExists(path);
				
			}	
			
			return ResponseEntity.ok("삭제 성공");
		} catch(Exception e) {
			System.out.println(e.getMessage());
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("삭제 실패");
		}
	}
	
	// ---------------- 사원 관리 ---------------- //
	
	// ---------------- 부서 관리 ---------------- //
	
	
	@GetMapping("/admin/dept/list")
	public String AdminDeptList(Model m) {
		
		List<Dept> deptList = adminService.deptList();
		m.addAttribute("deptList",deptList);
		
		return "admin/dept/list";
	}
	@GetMapping("/checkDeptNo")
	public ResponseEntity<Integer> deptCheck(@RequestParam("deptno") int deptNo) {
		int i = adminService.isDeptNo(deptNo);
		return ResponseEntity.ok(i);
	}
	
	@PostMapping("/admin/dept/adddept")
	public String AdminDeptAdd(@RequestParam("deptNo") int deptNo, Dept dept) {
		
		int check = adminService.isDeptNo(deptNo);
		
		try {
			adminService.addDept(dept);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "redirect:/main/admin/dept/list";
	}
	
	@PutMapping("/admin/dept/update")
	public ResponseEntity<String> AdminDeptUpdate(@RequestBody Dept dept) {
		System.out.println(dept);
		try {
			adminService.updateDept(dept);
			return ResponseEntity.ok("" + dept);
			
		} catch(Exception e) {
			System.out.println("데이터베이스 예외 발생: " + e.getMessage());
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("수정 실패");
		}		
	}
	
	@PostMapping("/admin/dept/delete") // 삭제
	public String AdminDeptDelete(@RequestParam("deptno") int deptNo ) {
		 
		adminService.deleteDept(deptNo);
		
		return "redirect:/main/admin/dept/list";
	}
	
	@PostMapping("/admin/dept/deletecheck") // 삭제
	public ResponseEntity<String> AdminDeptDeleteCheck(@RequestParam("deptDelCheck") List<Integer> checkList ) {
		try {
	        adminService.deleteCheck(checkList);
	        System.out.println(checkList);
	        return ResponseEntity.ok("삭제 성공");
	    } catch (Exception e) {  
	        System.out.println("데이터베이스 예외 발생: " + e.getMessage());
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("삭제 실패");
	    }
	}
	
	// --------------------------------------//
	
}
