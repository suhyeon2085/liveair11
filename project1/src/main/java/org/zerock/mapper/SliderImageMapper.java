package org.zerock.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.zerock.domain.SliderImageDTO;

import java.util.List;

@Mapper
public interface SliderImageMapper {
    List<SliderImageDTO> getAllSliderImages();

    void insertSliderImage(SliderImageDTO dto);

    SliderImageDTO getSliderImageById(Long id);

    void deleteSliderImage(Long id);

    void updateSliderImage(SliderImageDTO dto);
}