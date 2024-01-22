package com.group4.miroffice.address;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.group4.miroffice.dto.Address;

@Controller
@RequestMapping("/main")
public class AddressController {
	
	@Autowired
	private AddressService service;
	
	@GetMapping("/address")
	public String Address(Model m) {
		
		List<Address> usersInfo = service.usersInfo();
		
		List<String> deptName = service.deptName();
		
		m.addAttribute("usersInfo", usersInfo);
		m.addAttribute("deptName", deptName);
		
		return "address/address";
	}
	
	@PostMapping("/address")
	public String SearchAddress(@RequestParam("deptName") String deptName, Model m) {
		
		List<Address> searchAddress = service.searchAddress(deptName);
		
		List<String> deptN = service.deptName();
		
		m.addAttribute("usersInfo", searchAddress);
		m.addAttribute("deptName", deptN);
		
		return "address/address";
	}

}
