package org.zerock.service;

import java.util.List;

import org.zerock.domain.ReservationDTO;

public interface ReserveService {

	public ReservationDTO read(int num);

	public void insert(ReservationDTO reserve);

	public boolean delete(int num);
	
	
    // 모든 예약 가져오기
    public List<ReservationDTO> getAllReservations(); 
	
	
}
