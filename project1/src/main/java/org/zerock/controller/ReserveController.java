package org.zerock.controller;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.Timestamp;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.MemberDTO;
import org.zerock.domain.ReservationDTO;
import org.zerock.service.ReserveService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
//@RequestMapping("/reserve/*")
@AllArgsConstructor
public class ReserveController {
	
	private ReserveService service;

	// 세션에 저장할 ReservationDTO 생성
	@ModelAttribute("reservationDTO")
	public ReservationDTO reservationDTO() {
		return new ReservationDTO();
	}	
	
	// 이미 다른 사용자가 선택한 날짜 선택X
	@GetMapping(value = "/reserved-datetimes", produces = "application/json")
	@ResponseBody
	public List<String> findAllReservedDates() {
	    List<Timestamp> reserved = service.findAllReservedDates(); // 예: DB에서 예약된 Timestamp 목록 가져옴

	    // JS에서 비교할 수 있도록 ISO 문자열로 변환 (예: 2025-06-05T14:00)
	    return reserved.stream()
	                   .map(ts -> ts.toLocalDateTime().toString())
	                   .collect(Collectors.toList());
	}

	// 날짜 선택 후 예약 입력 페이지
	@GetMapping("/reserve")
	public String reservePage(@RequestParam("date") String dateStr, Model model, HttpSession session) {
		String formatted = dateStr.replace("T", " ") + ":00";
	    Timestamp date = Timestamp.valueOf(formatted);
	    MemberDTO user = (MemberDTO) session.getAttribute("user");
	    
		model.addAttribute("date", date); // 날짜 뷰에 넘김
		model.addAttribute("member", user);
		
		return "reserve/reserve"; // reserve.jsp
	}	
	
	// 예약 제출 후 조회 페이지로 이동
	@PostMapping("/reserve")
	public String reserve(ReservationDTO dto) {
		service.insert(dto); // 예약 정보 저장
		return "redirect:/check";
	}

	// 예약 수정
	@PostMapping("/modReserve")
	public String modReserve(HttpSession session, Model model) {
		MemberDTO dto = (MemberDTO) session.getAttribute("user");
		ReservationDTO reserve = service.read(dto.getId());
		
		model.addAttribute("reserve", reserve);
		model.addAttribute("member", dto);
		return "reserve/modReserve";
	}
	
	@PostMapping("/update")
	public String update(ReservationDTO dto) {
		int temp =  service.update(dto);
		
		return "/check";	
	}
	
	// 예약 삭제
	@PostMapping("/delete")
	public String delete(@RequestParam("num") int num, RedirectAttributes rttr) {
		if(service.delete(num)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "/LiveAirMain";
	}
	
}
	
//	메인 페이지에 추가할 내용
//	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
//
//	<c:if test="${not empty result}">
//	    <div>
//	        예약이 성공적으로 삭제되었습니다.
//	    </div>
//	</c:if>
	

