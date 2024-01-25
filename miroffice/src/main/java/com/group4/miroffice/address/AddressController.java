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
	public String Address(Model m, @RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "pageSize", defaultValue = "10") int pageSize) {

		List<Address> addresses = service.getPaginatedAddresses(page, pageSize);
		int totalPages = service.getTotalPages(pageSize);

		List<String> deptName = service.deptName();

		m.addAttribute("usersInfo", addresses);
		m.addAttribute("totalPages", totalPages);
		m.addAttribute("deptName", deptName);

		return "address/address";
	}

	@PostMapping("/address")
	public String SearchAddress(@RequestParam("deptName") String deptName, Model m,
			@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "pageSize", defaultValue = "10") int pageSize) {

		if (deptName.equals("all")) {

			List<Address> addresses = service.getPaginatedAddresses(page, pageSize);
			int totalPages = service.getTotalPages(pageSize);

			m.addAttribute("usersInfo", addresses);
			m.addAttribute("totalPages", totalPages);
			
		} else {
			List<Address> addresses = service.searchAddressesByDept(deptName, page, pageSize);
			int serchInfo = service.SearchtTotalPages(deptName, pageSize);

			m.addAttribute("usersInfo", addresses);
			m.addAttribute("totalPages", serchInfo);
			
		}
		List<String> deptN = service.deptName();

		m.addAttribute("deptName", deptN);

		return "address/address";
	}

}
