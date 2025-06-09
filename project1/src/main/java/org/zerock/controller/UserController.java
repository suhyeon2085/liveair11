package org.zerock.controller;


import java.io.Console;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.domain.MemberDTO;
import org.zerock.domain.ReservationDTO;
import org.zerock.persistence.UserDAO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class UserController {
	
	//아이디와 비밀번호 저장 DAO 가져오기 
	private UserDAO userDAO;
		
	//main페이지
	@RequestMapping("/")
	public String mainPage()
	{ return "LiveAirMain"; }
	
	//login페이지 이동, 아직 회원정보가 없으므로 매개변수x, login페이지로 이동하므로 void 사용
	@RequestMapping("/login")
	public void loginPage() {}
	
	//join(회원가입) 페이지 이동, 회원정보 없으므로 매개변수x, void로 join.jsp로 바로 이동
	@RequestMapping("/join")
	public void joinPage() {}
	
	//login버튼 누르면 이쪽으로 와서 계정 검증 후 dto를 가지고 있음
	@PostMapping("/main")
	public String loginProcess(@RequestParam("id") String id, @RequestParam("password") String pw, HttpSession session)
	{
		MemberDTO user = userDAO.loginCheck(id, pw);
		session.setAttribute("user", user);

		return "/LiveAirMain";
	}
	
	//메인화면에서 바로 조회화면으로 이동
	@GetMapping("/check")
	public void reserveCheck(HttpSession session, Model model)
	{
		MemberDTO dto = (MemberDTO) session.getAttribute("user");
		ReservationDTO reserve = userDAO.reserveCheck(dto.getId());
		
		model.addAttribute("reserve", reserve);
	}

	@PostMapping("/joinToLogin")
	public String joinToLogin(MemberDTO dto)
	{
		int result = 0;
		result = userDAO.join(dto);
		
		if (result == 1)
		{
			return "/login";
		}
		else {
			return "/join";
		}

	}
}
