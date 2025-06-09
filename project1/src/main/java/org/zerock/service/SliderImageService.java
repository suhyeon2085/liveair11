package org.zerock.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.zerock.domain.SliderImageDTO;

public interface SliderImageService {
    static List<SliderImageDTO> getAllSliderImages() {
		// TODO Auto-generated method stub
		return null;
	}
    void saveImage(MultipartFile file);
    void deleteImage(int id);
    void updateImage(int id, MultipartFile newFile);
	void addSliderImage(SliderImageDTO dto);
	void deleteSliderImage(Long id);
	void updateSliderImage(SliderImageDTO dto);
	SliderImageDTO getSliderImageById(Long id);
}