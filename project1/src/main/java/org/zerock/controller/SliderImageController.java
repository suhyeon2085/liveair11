package org.zerock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.domain.SliderImageDTO;
import org.zerock.service.SliderImageService;

import java.io.IOException;
import java.util.List;

@Controller
public class SliderImageController {

    @Autowired
    private SliderImageService sliderImageService;

    // 메인 페이지 ("/") - DB에서 슬라이더 이미지 리스트 가져와 JSP로 전달
    @GetMapping("/")
    public String main(Model model) {
        List<SliderImageDTO> sliderImages = sliderImageService.getAllSliderImages();
        model.addAttribute("sliderImages", sliderImages);
        return "LiveAirMain";  // 기존 JSP 이름 유지
    }

    // 이미지 서빙 API ("/slider/image")
    @GetMapping("/slider/image")
    public ResponseEntity<byte[]> displayImage(@RequestParam("id") Long id) {
        SliderImageDTO image = sliderImageService.getSliderImageById(id);
        if (image != null && image.getData() != null) {
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.parseMediaType(image.getContentType()));
            return new ResponseEntity<>(image.getData(), headers, HttpStatus.OK);
        }
        return ResponseEntity.notFound().build();
    }

    // 관리자용 슬라이더 이미지 관리 화면 (예: /slider/manage)
    @GetMapping("/slider/manage")
    public String showSliderImages(Model model) {
        List<SliderImageDTO> list = sliderImageService.getAllSliderImages();
        model.addAttribute("imageList", list);
        return "/calendar/slider_image"; // 실제 경로에 맞게 수정
    }

    // 이미지 업로드
    @PostMapping("/uploadSliderImage")
    public String upload(@RequestParam("file") MultipartFile file) {
        SliderImageDTO dto = new SliderImageDTO();
        try {
            dto.setFileName(file.getOriginalFilename());
            dto.setData(file.getBytes());
            dto.setContentType(file.getContentType());
            dto.setTimestamp(System.currentTimeMillis());
            sliderImageService.addSliderImage(dto);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "redirect:/slider/manage";
    }

    // 이미지 삭제
    @PostMapping("/deleteSliderImage")
    public String delete(@RequestParam("id") long id) {
        sliderImageService.deleteSliderImage(id);
        return "redirect:/slider/manage";
    }

    // 이미지 수정
    @PostMapping("/updateImage")
    public String update(@RequestParam("id") long id,
                         @RequestParam("newFile") MultipartFile newFile) {
        SliderImageDTO dto = convertToDTO(newFile);
        dto.setId(id);
        dto.setTimestamp(System.currentTimeMillis()); // 수정 시점 저장
        sliderImageService.updateSliderImage(dto);
        return "redirect:/slider/manage";
    }

    private SliderImageDTO convertToDTO(MultipartFile file) {
        SliderImageDTO dto = new SliderImageDTO();
        try {
            dto.setFileName(file.getOriginalFilename());
            dto.setData(file.getBytes());
            dto.setContentType(file.getContentType());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dto;
    }
}