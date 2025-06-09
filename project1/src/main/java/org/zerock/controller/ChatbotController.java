package org.zerock.controller;

import javax.management.loading.PrivateClassLoader;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.MemberDTO;
import org.zerock.domain.ReservationDTO;
import org.zerock.persistence.UserDAO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class ChatbotController {

	@RequestMapping("/chatbot")
	public String chatbotMain()
	{
		return "/chatbot/chatbot";
	}
	
	@RequestMapping("/toReserve")
	public String toReserve(HttpSession session, Model model)
	{
		try {
			MemberDTO dto = (MemberDTO) session.getAttribute("user");

		     return "/calendar/userCalendar";
		} catch (Exception e) {
			model.addAttribute("msg", "해당 서비스는 로그인이 필요합니다.");
			model.addAttribute("url", "/login");
			return "/chatbot/alert";
		}
	}
	
	@RequestMapping("/check")
	public String toCheck(HttpSession session, Model model)
	{
		try {

			MemberDTO dto = (MemberDTO) session.getAttribute("user");

		    return "/check";
		} catch (Exception e) {
			model.addAttribute("msg", "해당 서비스는 로그인이 필요합니다.");
			model.addAttribute("url", "/login");
			return "/chatbot/alert";
		}
	}

}
