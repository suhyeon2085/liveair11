package org.zerock.persistence;

import org.zerock.domain.MemberDTO;
import org.zerock.domain.ReservationDTO;

public interface UserDAO {

	//일반 로그인용
	void insertUser(MemberDTO user);
	MemberDTO getUserByUsernameAndPassword(String id, String password);
	////
    // 관리자 로그인용 
    MemberDTO getAdminByUsernameAndPassword(String id, String password);

    
    //login 확인용
    public MemberDTO loginCheck(String id, String password);
    
    //메인페이지에서 바로 조회페이지로 이동
    public ReservationDTO reserveCheck(String id);
    
    public int join(MemberDTO dto);
} 
