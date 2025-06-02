package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserCalendarController {

    @RequestMapping("/userCalendar")
    public String home() {
        return "/calendar/userCalendar";  // calendar.jsp로 이동
    }
}