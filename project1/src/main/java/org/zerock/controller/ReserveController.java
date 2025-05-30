package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

	// 조회
	@GetMapping("inquiry")
	public void inquiry(@RequestParam("num") int num, Model model) {
		model.addAttribute("reserve", service.read(num));
	}
	
	// 삽입
	@PostMapping("reserve")
	public String reserve(ReservationDTO reserve) {

		service.insert(reserve);
		
		return "redirect:/inquiry?num=" + reserve.getNum();

	}
	
	// 수정
	
	
	// 삭제
	
	
}
