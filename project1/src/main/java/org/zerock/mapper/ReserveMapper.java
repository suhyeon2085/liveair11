package org.zerock.mapper;

import org.zerock.domain.ReservationDTO;

public interface ReserveMapper {

	public ReservationDTO read(int num);
	
	public void insert(ReservationDTO reserve);
	
	public void insertSelectKey(ReservationDTO reserve);

	public int delete(int num);
	 
}