package org.zerock.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.domain.ReservationDTO;
import org.zerock.service.ReserveService;

@Controller
public class CalendarController {

	 @Autowired
	    private ReserveService reserveService;
	 
	 @GetMapping("/calendar")
	    public String showAdminCalendar(Model model) {
	        List<ReservationDTO> reservations = reserveService.getAllReservations();
	        model.addAttribute("reservations", reservations);
	        return "/calendar/calendar"; // calendar.jap로 이동 
	    }
	
	    @RequestMapping("/userCalendar")
	    public String userCalendar() {
	        return "/calendar/userCalendar";  // userCalendar.jsp로 이동
    }
}    