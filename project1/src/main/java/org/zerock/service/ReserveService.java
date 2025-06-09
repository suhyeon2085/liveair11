package org.zerock.service;


import org.zerock.domain.MemberDTO;

import java.sql.Timestamp;

import org.zerock.domain.ReservationDTO;
import java.util.List;
import java.util.Map;


public interface ReserveService {

	public ReservationDTO read(String id);

	public void insert(ReservationDTO reserve);
	
	public int update(ReservationDTO reserve);

	public boolean delete(int num);

	
	public MemberDTO member(String id);

	


	
    // 모든 예약 가져오기
    public List<ReservationDTO> getAllReservations(); 

    
    // 조인된 예약정보 가져오기 06-04
    public List<Map<String, Object>> getAllReservationsWithMember();
	

	
    public List<Timestamp> findAllReservedDates();


}
