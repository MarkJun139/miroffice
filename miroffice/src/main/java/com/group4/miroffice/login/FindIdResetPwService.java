package com.group4.miroffice.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
//import org.springframework.mail.SimpleMailMessage;
//import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.group4.miroffice.dto.Mail;
import com.group4.miroffice.user.Users;

@Service
public class FindIdResetPwService {

	@Autowired
	FindIdResetPwDao dao;

	@Autowired
	protected JavaMailSender mailSender;

	public Users findId(Users user) {
		return dao.findId(user);
	}

	public String findPassword(Users user) {
		return dao.findPassword(user);
	}

	public int resetPassword(String password, String name, int no) {
		return dao.resetPassword(password, name, no);
	}

	public void sendMail(String temppw, String name, String email) throws Exception {

		Mail mail = new Mail();
		mail.setTo(email);
		mail.setTitle("[미르 오피스] 임시 비밀번호 전송"); // 메일 제목
		mail.setMessage("안녕하세요 미르 오피스 입니다. 사원님의 임시 비밀번호는" + temppw + "입니다. 로그인 후 비밀 번호 변경 바랍니다."); // 메일 내용

		SimpleMailMessage message = new SimpleMailMessage();
		message.setSubject(mail.getTitle());
		message.setText(mail.getMessage());
		message.setTo(email);
		mailSender.send(message);

		System.out.println("메일 전송 완료");
	}

}
