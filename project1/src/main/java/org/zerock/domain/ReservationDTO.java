package org.zerock.domain;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReservationDTO {

	private int num;
	private String model;
	private String type;
	private String detail;
	private String loc;
	private Timestamp date;
}
