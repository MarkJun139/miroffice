package com.group4.miroffice.forum;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.group4.miroffice.config.SecurityUser;
import com.group4.miroffice.user.UserService;
import com.group4.miroffice.user.Users;

import jakarta.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/main")
public class ForumController {

	@Autowired
	ForumService service;
	
	@Autowired
	CommentService cservice;
	
	@Autowired
	UserService us;
	
	@Autowired
	DeptService ds;

	
	@PostMapping("/forum")
	public String formpost() {
		return "redirect:/main/forum";
	}
	
	@GetMapping("/forum")
	public String forumList(Model m, @AuthenticationPrincipal SecurityUser userLog,
			@RequestParam(value="page", defaultValue="1") String page,
			@RequestParam(value="type", defaultValue="") String type,
			@RequestParam(value="keyword", defaultValue="") String keyword) {
		
		
		int pg;
		if(page == "0") {
			pg = 1;
		}
		else {
			pg = Integer.parseInt(page);			
		}
		Users dto = userLog.getUsers();
		
		System.out.println("페이지"+page);
		int minPage = (pg*10)-10;
		int maxPage = 10;
		Map<String, Object> map = new HashMap<>();
		map.put("min", minPage);
		map.put("max", maxPage);
		map.put("deptno", dto.getDeptNo());
	

		map.put("type", type);
		map.put("keyword", "%" + keyword + "%");

		
		List<ForumDto> fl = service.forumList(map);
		
		List<ForumDto> f2 = service.forumNotice(dto.getDeptNo());
		
		for(ForumDto res: fl) {
			Users user = us.findById(res.getEmpNo()); 
			String uName = user.getEmpName();
			String uRank = user.getEmpRank();
			res.setEmpName(uName);
			res.setEmpRank(uRank);
			int cs = cservice.commentCount(res.getForumNo());
			res.setCommentCount(cs);
		}
		for(ForumDto res2: f2) {
			Users user = us.findById(res2.getEmpNo());
			String uName = user.getEmpName();
			String uRank = user.getEmpRank();
			res2.setEmpName(uName);
			res2.setEmpRank(uRank);
			int cs = cservice.commentCount(res2.getForumNo());
			res2.setCommentCount(cs);
			
		}
		
		System.out.println(dto.getDeptNo());
		System.out.println(fl);
		m.addAttribute("list", fl);
		m.addAttribute("nlist", f2);
		m.addAttribute("page", pg);
		
		return "forum/list";
	}
	

	@GetMapping("/forumadmin")
	public String forumListAdmin(Model m,
			@RequestParam(value="page", defaultValue="1") String page,
			@RequestParam(value="type", defaultValue="") String type,
			@RequestParam(value="keyword", defaultValue="") String keyword) {
		
		
		int pg;
		if(page == "0") {
			pg = 1;
		}
		else {
			pg = Integer.parseInt(page);			
		}
		
		System.out.println("페이지"+page);
		int minPage = (pg*10)-10;
		int maxPage = 10;
		Map<String, Object> map = new HashMap<>();
		map.put("min", minPage);
		map.put("max", maxPage);
	

		map.put("type", type);
		map.put("keyword", "%" + keyword + "%");

		
		List<ForumDto> fl = service.forumListAdmin(map);
				
		for(ForumDto res: fl) {
			Users user = us.findById(res.getEmpNo()); 
			String uName = user.getEmpName();
			String uRank = user.getEmpRank();
			res.setDeptName(ds.deptName(res.getDeptNo()));
			res.setEmpName(uName);
			res.setEmpRank(uRank);
			int cs = cservice.commentCount(res.getForumNo());
			res.setCommentCount(cs);
		}

	
		System.out.println(fl);
		m.addAttribute("list", fl);
		m.addAttribute("page", pg);
		
		return "forum/listadmin";
	}
	
	@GetMapping("/forum/{no}")
	public String forumList(Model m, @PathVariable(name="no") int no) {
		
		service.forumCountup(no);
		List<CommentDto> cdto = cservice.commentList(no);
		
		for(CommentDto res: cdto) {
			Users user = us.findById(res.getEmpNo());
			res.setEmpName(user.getEmpName());
			res.setEmpRank(user.getEmpRank());
			res.setEmpPhoto(user.getEmpPhoto());
		}
		
		
		ForumDto fl = service.forumOne(no);
		
		Users user = us.findById(fl.getEmpNo());
		
		fl.setEmpName(user.getEmpName());
		fl.setEmpRank(user.getEmpRank());	
		fl.setEmpPhoto(user.getEmpPhoto());	
		System.out.println("그냥"+ fl);
		System.out.println("코멭트"+cdto);
		m.addAttribute("list", fl);
		m.addAttribute("clist", cdto);
		
		return "forum/one";
	}

	
	@GetMapping("/forum/write")
	public String forumWrite2() {
		return "forum/write";
	}
	
	@PostMapping("/forum/write")
	public String forumWrite(@ModelAttribute ForumDto dto, RedirectAttributes rttr, @RequestParam(value="files", required=false) MultipartFile files) throws Exception {
		Users user = us.findById(dto.getEmpNo());
		
		user.getDeptNo();
		dto.setDeptNo(user.getDeptNo());
		System.out.println(dto);

		Map<String, Object> map = service.fileUpload(files);
		if(map != null) {
			String f1 = (map.get("forumFiles")).toString();
			String f2 = (map.get("forumOfiles")).toString();
			dto.setForumFiles(f1);
			dto.setForumOfiles(f2);
			System.out.println("드신날"+dto);
		}
		service.forumWrite(dto);

	
		
		return "redirect:/main/forum";
	}



	@PostMapping("/forum/delete/{no}")
	public String forumDelete(@PathVariable(name="no") int no, Model m) {
		
		service.forumDelete(no);
		
		
		return "redirect:/main/forum";
		
	}
	
	@PostMapping("/forum/deleteadmin/{no}")
	public String forumDelete2(@PathVariable(name="no") int no, Model m) {
		
		service.forumDelete(no);
		
		
		return "redirect:/main/forumadmin";
		
	}
	
	
	@PostMapping("/forum/edit")
	public String forumEdit2(@ModelAttribute ForumDto dto, RedirectAttributes rttr, @RequestParam(value="files", required=false) MultipartFile files) throws Exception {
		Users user = us.findById(dto.getEmpNo());

		user.getDeptNo();
		dto.setDeptNo(user.getDeptNo());
		System.out.println("정체가뭐니"+dto);
		
		System.out.println("시발"+ dto.getForumNotice());

		
		Map<String, Object> map = service.fileUpload(files);
		if(map != null) {
			String f1 = (map.get("forumFiles")).toString();
			String f2 = (map.get("forumOfiles")).toString();
			dto.setForumFiles(f1);
			dto.setForumOfiles(f2);
			System.out.println("드신날"+dto);
		}
		
		
		service.forumEdit(dto);
		
		
		return "redirect:/main/forum";
	}
	

	@PostMapping("/forum/edit/{no}")
	public String forumEdit(@PathVariable(name="no") int no, Model m) {
		
		ForumDto al = service.forumOne(no);
		
		m.addAttribute("list", al);
		
		
		System.out.println("에이피"+al);
		
		return "forum/edit";
		
	}
	
	@RequestMapping("/file/download/{file}/{file2}")
	public void fileDownload(@PathVariable(value="file") String file, @PathVariable(value="file2") String file2, HttpServletResponse response) throws IOException {
		System.out.println(file);
		String path = System.getProperty("user.dir")+"/src/main/webapp/upload/file/";
		File f = new File(path, file);
		// 파일명 인코딩
		String encodedFileName = new String (file2.getBytes("UTF-8"), "ISO-8859-1");

		// file 다운로드 설정
		response.setContentType("application/download");
		response.setContentLength((int)f.length());
		response.setHeader("Content-Disposition", "attatchment;filename=\"" + encodedFileName + "\"");
		
		// 다운로드 시 저장되는 이름은 Response Header의 "Content-Disposition"에 명시
		OutputStream os = response.getOutputStream();
		
		FileInputStream fis = new FileInputStream(f);
		FileCopyUtils.copy(fis, os);
		
		// fis.close();
		// os.close();
		
	}
	

	
}