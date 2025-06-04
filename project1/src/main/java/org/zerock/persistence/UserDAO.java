package org.zerock.persistence;

import org.zerock.domain.MemberDTO;

public interface UserDAO {

	void insertUser(MemberDTO user);
	MemberDTO getUserByUsernameAndPassword(String id, String password);
}
