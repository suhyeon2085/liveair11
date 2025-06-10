package org.zerock.service;

import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.domain.SliderImageDTO;
import org.zerock.mapper.SliderImageMapper;

@Service
public class SliderImageServiceImpl implements SliderImageService {

    private final SliderImageMapper mapper;

    public SliderImageServiceImpl(SliderImageMapper mapper) {
        this.mapper = mapper;
    }

    @Override
    public List<SliderImageDTO> getAllSliderImages() {
        return mapper.getAllSliderImages();
    }

    @Override
    public void addSliderImage(SliderImageDTO dto) {
        mapper.insertSliderImage(dto);
    }

    @Override
    public void addSliderImage(MultipartFile file) throws IOException {
        if (file == null || file.isEmpty()) {
            throw new IllegalArgumentException("파일이 비어있습니다.");
        }

        SliderImageDTO dto = new SliderImageDTO();
        dto.setFileName(file.getOriginalFilename());
        dto.setContentType(file.getContentType());
        dto.setData(file.getBytes());
        dto.setTimestamp(System.currentTimeMillis());

        mapper.insertSliderImage(dto);
    }

    @Override
    public void deleteSliderImage(Long id) {
        mapper.deleteSliderImage(id);
    }

    @Override
    public void updateSliderImage(SliderImageDTO dto) {
        mapper.updateSliderImage(dto);
    }

    @Override
    public SliderImageDTO getSliderImageById(Long id) {
        return mapper.getSliderImageById(id);
    }
}