package org.zerock.service;

import org.springframework.stereotype.Service;
import org.zerock.domain.ReservationDTO;
import org.zerock.mapper.ReserveMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class ReserveServiceImpl implements ReserveService {
	
	private ReserveMapper mapper;
	
	@Override
	public ReservationDTO read(int num) {
		
		return mapper.read(num);
	}

	@Override
	public void insert(ReservationDTO reserve) {
		mapper.insert(reserve);
		mapper.insertSelectKey(reserve);
	}

	
}
