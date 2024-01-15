package com.group4.miroffice.forum;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.group4.miroffice.config.SecurityUser;
import com.group4.miroffice.user.UserService;
import com.group4.miroffice.user.Users;

@Controller
@RequestMapping("/main")
public class ForumController {

	@Autowired
	ForumService service;
	
	@Autowired
	UserService us;
	
	@GetMapping("/forumlist")
	public String forumList(Model m, @AuthenticationPrincipal SecurityUser userLog, @RequestParam(value="status", defaultValue="1") String status) {
		Users dto = userLog.getUsers();
		List<ForumDto> fl = service.forumList(dto.getDeptNo());
		
		for(ForumDto res: fl) {
			Users user = us.findById(res.getEmpNo()); 
			String uName = user.getEmpName();
			String uRank = user.getEmpRank();
			res.setEmpName(uName);
			res.setEmpRank(uRank);
		}
		
		System.out.println(dto.getDeptNo());
		System.out.println(fl);
		m.addAttribute("list", fl);
		
		return "forum/list";
	}
	
	@PostMapping("/forum/one/{no}")
	public String forumList(Model m, @PathVariable(name="no") int no) {
		ForumDto fl = service.forumOne(no);
		
		System.out.println(fl);
		m.addAttribute("list", fl);
		
		
		return "forum/one";
	}
	
}
