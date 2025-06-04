package org.zerock.domain;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReservationDTO {

	private int num;  // 번호
	private String model;  // 기종
	private String type;  // 증상
	private String detail;  // 상세증상
	private String loc;  // 실외기 위치
	private Timestamp date;  // 시간
}
