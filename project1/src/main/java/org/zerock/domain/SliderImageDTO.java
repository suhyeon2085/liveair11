package org.zerock.domain;

import lombok.Data;

@Data
public class SliderImageDTO {
    private Long id;
    private String fileName;
    private String contentType;
    private byte[] data;   // BLOB으로 저장할 이미지 데이터
    private long timestamp;

    // 확장 필드 예시 (필요하면 추가)
    // private String imageType;
    // private String extension;
}