package com.group4.miroffice.forum;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main")
public class ForumController {

	@GetMapping("/forumlist")
	public String forumList() {
		return "forum/list";
	}
	
}
