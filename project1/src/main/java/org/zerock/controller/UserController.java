package org.zerock.controller;


import java.io.Console;
import java.io.IOException;
import java.io.PrintWriter;


import javax.servlet.http.HttpServletResponse;

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
		
	//main페이지 	//main페이지 로그인 여부 판단해서 "div"문단 삭제하기 
	@RequestMapping("/")
	public String mainPage(HttpSession session, Model model) {
	    MemberDTO user = (MemberDTO) session.getAttribute("user");
	    model.addAttribute("isLogin", user != null);  // 로그인 여부 JSP에 전달
	    return "LiveAirMain";
	}

	//login페이지 이동, 아직 회원정보가 없으므로 매개변수x, login페이지로 이동하므로 void 사용
	@RequestMapping("/login")
	public void loginPage() {}
	
	//join(회원가입) 페이지 이동, 회원정보 없으므로 매개변수x, void로 join.jsp로 바로 이동
	@RequestMapping("/join")
	public void joinPage() {}
	
	//login버튼 누르면 이쪽으로 와서 계정 검증 후 dto를 가지고 있음
	@PostMapping("/main")
	public String loginProcess(@RequestParam("id") String id, 
	                           @RequestParam("password") String pw, 
	                           HttpSession session) {
	    
	    MemberDTO user = userDAO.loginCheck(id, pw);
	    
	    if (user != null) {
	        session.setAttribute("user", user);

	        // temp == 1이면 관리자, calendar.jsp로 이동
	        if (user.getTemp() == 1) {  
	            return "redirect:/calendar";  // 관리자 전용 캘린더 페이지로 리디렉트
	        }

	        return "redirect:/";  // 일반 사용자 메인 페이지로
	    } else {
	        return "redirect:/login?error=true";
	    }
	}
	
	//메인화면에서 바로 조회화면으로 이동
	@GetMapping("/check")
	public String reserveCheck(HttpSession session, HttpServletResponse response, Model model) 
	        throws IOException {

	    try {
	        MemberDTO dto = (MemberDTO) session.getAttribute("user");

	        if (dto == null) {
	            throw new Exception("로그인 필요");
	        }

	        // 예약 정보 가져오기
	        ReservationDTO reserve = userDAO.reserveCheck(dto.getId());

	        // Model에 두 개의 객체를 담기
	        model.addAttribute("reserve", reserve);
	        model.addAttribute("member", dto);  // 회원 정보도 같이 전달

	        return "check"; 

	    } catch (Exception e) {
	        response.setContentType("text/html; charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        out.println("<script>alert('로그인 후 이용해주세요.'); location.href='/login';</script>");
	        out.flush();
	        return null;
	    }
	}


	@PostMapping("/joinToLogin")
	public String joinToLogin(MemberDTO dto)
	{
		int result = 0;
		result = userDAO.join(dto);
		log.info("컨트롤러 내에서 result : " + result);
		if (result == 1)
		{
			return "/login";
		}
		else {
			return "/join";
		}

	}
}
