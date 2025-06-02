package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.ReservationDTO;

public interface ReserveMapper {

	public ReservationDTO read(int num);
	
	public void insert(ReservationDTO reserve);
	
	public void insertSelectKey(ReservationDTO reserve);

	public int delete(int num);

	public List<ReservationDTO> getAllReservations();
	
	 
}