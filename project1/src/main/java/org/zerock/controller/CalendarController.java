package org.zerock.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
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
    public String userCalendar(HttpSession session, HttpServletResponse response, Model model) throws IOException {
        MemberDTO dto = (MemberDTO) session.getAttribute("user");

        if (dto == null) {
            // 로그인 안 된 상태: alert 후 로그인 페이지로 이동
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('로그인 후 이용해주세요.'); location.href='/login';</script>");
            out.flush();
            return null;
        }

        // 로그인 된 상태
        ReservationDTO reserve = reserveService.read(dto.getId());
        model.addAttribute("reserve", reserve);  // 수정
        model.addAttribute("isModify", true);

        return "/calendar/userCalendar";
    }


    // 여기서부터 추가
    @GetMapping("/calendar/main")
    public void showMainPage(Model model) {
        model.addAttribute("sliderImages", sliderImageService.getAllSliderImages());
    }
}