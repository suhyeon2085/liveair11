package org.zerock.mapper;
<<<<<<< HEAD

import org.zerock.domain.MemberDTO;

=======

import org.zerock.domain.MemberDTO;

>>>>>>> refs/remotes/origin/master
import java.util.List;

import org.zerock.domain.ReservationDTO;

public interface ReserveMapper {

	public ReservationDTO read(int num);
	
	public void insert(ReservationDTO reserve);
	
	public void insertSelectKey(ReservationDTO reserve);

	public int delete(int num);
	
<<<<<<< HEAD
	public MemberDTO user(String id);
=======
	public MemberDTO user(String id);
>>>>>>> refs/remotes/origin/master

	public List<ReservationDTO> getAllReservations();
	
	 
}