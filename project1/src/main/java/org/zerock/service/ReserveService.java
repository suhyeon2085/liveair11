package org.zerock.service;
<<<<<<< HEAD

import org.zerock.domain.MemberDTO;

=======

import org.zerock.domain.MemberDTO;

>>>>>>> refs/remotes/origin/master
import java.util.List;

import org.zerock.domain.ReservationDTO;

public interface ReserveService {

	public ReservationDTO read(int num);

	public void insert(ReservationDTO reserve);

	public boolean delete(int num);
<<<<<<< HEAD
	
	public MemberDTO user(String id);
=======
	
	public MemberDTO user(String id);
>>>>>>> refs/remotes/origin/master
	
    // 모든 예약 가져오기
    public List<ReservationDTO> getAllReservations(); 
	
<<<<<<< HEAD

=======

>>>>>>> refs/remotes/origin/master
}
