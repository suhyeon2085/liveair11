package org.zerock.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.domain.MemberDTO;
import org.zerock.domain.ReservationDTO;
import org.zerock.service.ReserveService;

@Controller
public class CalendarController {

	 @Autowired
	    private ReserveService reserveService;
	 
	 @GetMapping("/calendar")
		 public String adminCalendar(Model model) {
			    List<Map<String, Object>> list = reserveService.getAllReservationsWithMember();
			    model.addAttribute("reservations", list);
	        return "/calendar/calendar"; // calendar.jap로 이동
	    }
	 
	 @GetMapping("/userCalendar")
	 public String userCalendar(HttpSession session, Model model) {
		 MemberDTO dto = (MemberDTO) session.getAttribute("user");
	     if (dto != null) {
	         model.addAttribute("reserve", reserveService.read(dto.getId())); // 수정
	         model.addAttribute("isModify", true);
	     } else {
	         model.addAttribute("reservationDTO", new ReservationDTO()); // 신규
	         model.addAttribute("isModify", false);
	     }
	     return "/calendar/userCalendar";
	 }
    
}    