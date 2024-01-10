package com.group4.miroffice.admin;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	// 사원 등록
	@PostMapping("/admin/emp/addemp")
	public String AdminEmpAdd(@RequestParam("empHiredate") String empHiredate, @RequestParam("deptNo") int dept, Admin admin) {

		
		String empNoYear = empHiredate.substring(2,4);
		
		int dno = admin.getDeptNo();
		String deptNo;
		if(dno <= 10) {
			deptNo = "0" + dno;
		} else {
			deptNo = dno + "";
		}
		String empCount = adminService.getEmpCount(dept);
		String empNo = empNoYear + deptNo + empCount;
		
		admin.setEmpNo(Integer.parseInt(empNo));
		admin.setEmpDayoff(0);
		admin.setEmpPw("1234");
		admin.setEmpPhone("asd");
		
		System.out.println(empCount);
		System.out.println("사원 등록 ");
		System.out.println("등록 정보 " + admin);
		
		adminService.addEmp(admin);
		
		return "redirect:/main/admin/emp/list";
	}
	
	@GetMapping("/admin/emp/edit/{id}")
	public String AdminEmpEdit(@PathVariable(name = "id") int id) {
		return "admin/emp/edit";
	}
	
}
