package org.zerock.service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.MemberDTO;
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
	public ReservationDTO read(String id) {
		
		return mapper.read(id);
	}

	@Override
	public void insert(ReservationDTO reserve) {
		mapper.insert(reserve);
		// mapper.insertSelectKey(reserve);
	}
	
	@Override
	public int update(ReservationDTO reserve) {

		return mapper.update(reserve);
	}

	@Override
	public boolean delete(int num) {		
		return mapper.delete(num) == 1;
	}


	@Override
	public MemberDTO member(String id) {

		return mapper.member(id);
	}
	

	public List<ReservationDTO> getAllReservations() {
	    return mapper.getAllReservations();
	}

	@Override
	public List<Timestamp> findAllReservedDates() {
		return mapper.findAllReservedDates();
	}

	
	// 조인 결과
	@Override
	public List<Map<String, Object>> getAllReservationsWithMember() {
	    return mapper.getAllReservationsWithMember();
	}




}
