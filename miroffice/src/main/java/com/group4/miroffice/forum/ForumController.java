package com.group4.miroffice.forum;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.group4.miroffice.config.SecurityUser;
import com.group4.miroffice.user.UserService;
import com.group4.miroffice.user.Users;

@Controller
@RequestMapping("/main")
public class ForumController {

	@Autowired
	ForumService service;
	
	@Autowired
	CommentService cservice;
	
	@Autowired
	UserService us;
	
	@GetMapping("/forum")
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
	
	@GetMapping("/forum/{no}")
	public String forumList(Model m, @PathVariable(name="no") int no) {
		
		service.forumCountup(no);
		
		ForumDto fl = service.forumOne(no);
		
		Users user = us.findById(fl.getEmpNo());
		
		fl.setEmpName(user.getEmpName());
		fl.setEmpRank(user.getEmpRank());		
		System.out.println("그냥"+ fl);
		m.addAttribute("list", fl);
		
		return "forum/one";
	}

	
	@GetMapping("/forum/write")
	public String forumWrite2() {
		return "forum/write";
	}
	
	@PostMapping("/forum/write")
	public String forumWrite(@ModelAttribute ForumDto dto, RedirectAttributes rttr) throws Exception {
		Users user = us.findById(dto.getEmpNo());

		user.getDeptNo();
		dto.setDeptNo(user.getDeptNo());
		System.out.println(dto);

		service.forumWrite(dto);
		
		
		return "redirect:/main/forum";
	}
	
	
	@PostMapping("/forum/comment")
	public ResponseEntity<CommentDto> forumComment() {
		return ResponseEntity.ok(dto);
	}

	
}