package org.zerock.controller;

import java.util.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserCalendarController {

	@GetMapping("/userCalendar")
	public String showCalendar(Model model) {
        Calendar cal = Calendar.getInstance();
        int year = cal.get(Calendar.YEAR);
        int month = cal.get(Calendar.MONTH) + 1; // 0-based

        model.addAttribute("year", year);
        model.addAttribute("month", month);

        List<String> days = buildCalendarDays(year, month);
        model.addAttribute("days", days);

        return "/calendar/userCalendar"; // → userCalendar.jsp
    }

    private List<String> buildCalendarDays(int year, int month) {
        List<String> list = new ArrayList<>();

        Calendar cal = Calendar.getInstance();
        cal.set(year, month - 1, 1);
        int startDay = cal.get(Calendar.DAY_OF_WEEK); // 1 = Sunday

        int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);

        // 빈칸 먼저 추가 (1일의 요일 전까지)
        for (int i = 1; i < startDay; i++) {
            list.add("");
        }

        // 날짜 추가
        for (int i = 1; i <= endDay; i++) {
            list.add(String.valueOf(i));
        }

        return list;
    }
}