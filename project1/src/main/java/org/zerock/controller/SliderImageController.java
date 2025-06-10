package org.zerock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.service.SliderImageService;

@Controller
public class SliderImageController {

    @Autowired
    private SliderImageService sliderImageService;

    @PostMapping("/uploadSliderImage")
    public String upload(@RequestParam("file") MultipartFile file) {
        sliderImageService.saveImage(file);
        return "redirect:/views/calendar/main.jsp";
    }

    @PostMapping("/deleteSliderImage")
    public String delete(@RequestParam("id") int id) {
        sliderImageService.deleteImage(id);
        return "redirect:/views/calendar/main.jsp";
    }

    @PostMapping("/updateImage")
    public String update(@RequestParam("id") int id,
                         @RequestParam("newFile") MultipartFile newFile) {
        sliderImageService.updateImage(id, newFile);
        return "redirect:/views/calendar/main.jsp";
    }
}