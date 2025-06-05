package org.zerock.persistence;

import org.zerock.domain.MemberDTO;

public interface UserDAO {

	//일반 로그인용
	void insertUser(MemberDTO user);
	MemberDTO getUserByUsernameAndPassword(String id, String password);
	
    // 관리자 로그인용 
    MemberDTO getAdminByUsernameAndPassword(String id, String password);

}
