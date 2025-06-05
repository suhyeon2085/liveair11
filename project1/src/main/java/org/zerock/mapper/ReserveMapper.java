package org.zerock.mapper;


import org.zerock.domain.MemberDTO;


import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.zerock.domain.ReservationDTO;

public interface ReserveMapper {

	public ReservationDTO read(int num);
	
	public void insert(ReservationDTO reserve);
	
	// public void insertSelectKey(ReservationDTO reserve);
	
	public int update(ReservationDTO reserve);

	public int delete(int num);
	

	public MemberDTO member(String id);


	// 모든 예약 가져오기
	public List<ReservationDTO> getAllReservations();
	
	// 조인된 예약정보 가져오기 06-04
	public List<Map<String, Object>> getAllReservationsWithMember();
	
	public List<Timestamp> findAllReservedDates();
 

}