package org.zerock.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.zerock.domain.MemberDTO;
import org.zerock.domain.ReservationDTO;
import org.zerock.service.ReserveService;
import org.zerock.service.SliderImageService;  // 추가 import

@Controller
public class CalendarController {

    @Autowired
    private ReserveService reserveService;
    
    @Autowired
    private SliderImageService sliderImageService;  // 슬라이더 서비스 주입

    @GetMapping("/calendar")
    public String adminCalendar(Model model) {
        List<Map<String, Object>> list = reserveService.getAllReservationsWithMember();
        model.addAttribute("reservations", list);
        return "/calendar/calendar"; // calendar.jsp로 이동
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

    // 여기서부터 추가
    @GetMapping("/calendar/main")
    public void showMainPage(Model model) {
        // sliderImages 리스트를 model에 담아서 JSP로 전달
        model.addAttribute("sliderImages", SliderImageService.getAllSliderImages());
    }
}