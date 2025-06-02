package org.zerock.controller;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.ReservationDTO;
import org.zerock.service.ReserveService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/reserve/*")
@AllArgsConstructor
public class ReserveController {
	
	private ReserveService service;

	// 세션에 저장할 ReservationDTO 생성
	@ModelAttribute("reservationDTO")
	public ReservationDTO reservationDTO() {
		return new ReservationDTO();
	}
	
	// 날짜 선택 후 예약 페이지로 이동
	@PostMapping("/userCalendar")
	public String selectDate(@RequestParam("date") @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm") Date date,
		                     @ModelAttribute("reservationDTO") ReservationDTO dto) {
		dto.setDate(date); // DTO에 날짜 설정
		return "redirect:/reserve";
	}

	// 예약 입력 페이지
	@GetMapping("/reserve")
	public String reservePage(@ModelAttribute("reservationDTO") ReservationDTO dto, Model model) {
		model.addAttribute("date", dto.getDate()); // 날짜 뷰에 넘김
		return "reserve"; // reserve.jsp
	}
	
	// 예약 제출 -> DB 저장
	@PostMapping("/reserve")
	public String reserve(ReservationDTO dto) {
		service.insert(dto); // 예약 정보 저장
		return "redirect:/inquiry?num=" + dto.getNum(); // 저장 후 예약 조회 페이지로 이동
	}

	// 예약 조회
	@GetMapping("/inquiry")
	public void inquiry(@RequestParam("num") int num, Model model) {
		model.addAttribute("reserve", service.read(num));
	}
	
	// 예약 수정
	
	
	// 예약 삭제
	@PostMapping("/delete")
	public String remove(@RequestParam("num") int num, RedirectAttributes rttr) {
		if(service.delete(num)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/LiveAirMain";
	}
	

	}
	
//	메인 페이지에 추가할 내용
//	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
//
//	<c:if test="${not empty result}">
//	    <div>
//	        게시글이 성공적으로 삭제되었습니다.
//	    </div>
//	</c:if>
	

