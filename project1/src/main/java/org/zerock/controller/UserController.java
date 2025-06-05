package org.zerock.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.domain.MemberDTO;
import org.zerock.persistence.UserDAO;

@Controller
public class UserController {

	//아이디와 비밀번호 저장 DAO 가져오기 
	@Autowired
	private UserDAO userDAO;
	
	//여기는 회원가입 정보 
	@PostMapping("/login")
	public String login(MemberDTO user) {
		userDAO.insertUser(user);
		return "redirect:/login.jsp";
	};
	
	
	//로그인 저장된 것 확인하는 컨트롤
	@PostMapping("/user") //로그인 페이지에 있는 form태그 가져오는 것
	public String login(@RequestParam("id") String id,
	    				@RequestParam("password") String password,
	    				HttpSession session) {

		// 관리자 로그인 처리
		if ("liveair".equals(id) && "0000".equals(password)) {
			session.setAttribute("admin", true); // 관리자 표시
			return "redirect:/LiveAirMain.jsp"; 
		}

		// 일반 사용자 로그인 처리
		MemberDTO user = userDAO.getUserByUsernameAndPassword(id, password);
		if (user != null) {
			session.setAttribute("user", user);
			return "redirect:/LiveAirMain.jsp"; //로그인 성공하면 메인페이지
		} else {
			return "redirect:/user.jsp?error=true"; //로그인 실패하면 다시 로그인 페이지 
		}
	}

	
	
	
	
	
	
	
	
}
