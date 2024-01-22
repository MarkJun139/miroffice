package com.group4.miroffice.forum;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.group4.miroffice.user.UserService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/main")
public class CommentController {

	
	@Autowired
	CommentService cservice;
	
	@Autowired
	UserService us;
	
//	@PostMapping("/comment/write")
//	public String commentWrite(@ModelAttribute CommentDto dto, RedirectAttributes rttr) throws Exception {
//		System.out.println("냐냠냠"+dto);
//
//		cservice.commentWrite(dto);
//		return "";
//		}

	@PostMapping("/comment/write")
	public ResponseEntity<?> commentWrite(Model m, @RequestBody CommentDto dto, RedirectAttributes rttr, HttpServletRequest req) throws Exception {
		
		cservice.commentWrite(dto);
		System.out.println("디티오" +dto);
	
		List<CommentDto> dtolist = cservice.commentList(dto.getForumNo());
	
		m.addAttribute("clist", dtolist);
		return new ResponseEntity<>("Success", HttpStatus.OK);
	}
	
	@PostMapping("/comment/edit")
	public ResponseEntity<?> commentEdit(Model m, @RequestBody CommentDto dto, RedirectAttributes rttr, HttpServletRequest req) throws Exception {
		
		cservice.commentEdit(dto);
		System.out.println("디티오" +dto);
	
		List<CommentDto> dtolist = cservice.commentList(dto.getForumNo());
	
		m.addAttribute("clist", dtolist);
		return new ResponseEntity<>("Success", HttpStatus.OK);
	}
	
	@PostMapping("/comment/delete")
	public ResponseEntity<?> commentDelete(Model m, @RequestParam(value="id") int id, @RequestParam(value="fid") int fid, RedirectAttributes rttr, HttpServletRequest req) throws Exception {
		
	
		System.out.println(cservice.commentDelete(id));
		
		List<CommentDto> dtolist = cservice.commentList(fid);
	
		m.addAttribute("clist", dtolist);
		return new ResponseEntity<>("Success", HttpStatus.OK);
	}
	
//	@PostMapping("/comment/write2")
//	public ResponseEntity<String> commentWrite2(Model m, @RequestBody CommentDto dto, RedirectAttributes rttr, HttpServletRequest req) throws Exception {
//		
//		cservice.commentWrite(dto);
//		System.out.println("디티오" +dto);
//	
//		List<CommentDto> dtolist = cservice.commentList(dto.getForumNo());
//	
//		String run = "" + dto.getForumNo();
//		m.addAttribute("list", dtolist);
//		return new ResponseEntity<>(run, HttpStatus.OK);
//	}
}
