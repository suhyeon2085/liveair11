package org.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.domain.SliderImageDTO;
import org.zerock.mapper.SliderImageMapper;

import java.util.List;

@Service
public class SliderImageServiceImpl implements SliderImageService {

    @Autowired
    private SliderImageMapper sliderImageMapper;

    public List<SliderImageDTO> getAllSliderImages() {
        return sliderImageMapper.getAllSliderImages();
    }

    public void addSliderImage(SliderImageDTO dto) {
        sliderImageMapper.insertSliderImage(dto);
    }

    public void deleteSliderImage(Long id) {
        sliderImageMapper.updateSliderImage(id);
    }

    public void updateSliderImage(SliderImageDTO dto) {
        sliderImageMapper.updateSliderImage(dto);
    }

    public SliderImageDTO getSliderImageById(Long id) {
        return sliderImageMapper.getSliderImageById(id);
    }

	@Override
	public void saveImage(MultipartFile file) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteImage(int id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateImage(int id, MultipartFile newFile) {
		// TODO Auto-generated method stub
		
	}
}