package org.zerock.service;

import org.zerock.domain.ReservationDTO;

public interface ReserveService {

	public ReservationDTO read(int num);

	public void insert(ReservationDTO reserve);
	
}
