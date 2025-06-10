package org.zerock.service;

import org.springframework.web.multipart.MultipartFile;
import org.zerock.domain.SliderImageDTO;

import java.io.IOException;
import java.util.List;

public interface SliderImageService {
    List<SliderImageDTO> getAllSliderImages();
    void addSliderImage(SliderImageDTO dto);
    void addSliderImage(MultipartFile file) throws IOException;
    void deleteSliderImage(Long id);
    void updateSliderImage(SliderImageDTO dto);
    SliderImageDTO getSliderImageById(Long id);
}