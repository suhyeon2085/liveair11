package org.zerock.service;


import org.zerock.domain.MemberDTO;
import org.zerock.domain.ReservationDTO;


import java.util.List;

import org.zerock.domain.ReservationDTO;

public interface ReserveService {

	public ReservationDTO read(int num);

	public void insert(ReservationDTO reserve);

	public boolean delete(int num);

	
	public MemberDTO user(String id);

	


	
    // 모든 예약 가져오기
    public List<ReservationDTO> getAllReservations(); 
	

}
