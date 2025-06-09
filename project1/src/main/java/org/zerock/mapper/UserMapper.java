package org.zerock.mapper;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.MemberDTO;
import org.zerock.domain.ReservationDTO;

public interface UserMapper {

	public MemberDTO loginCheck(@Param("id") String id, @Param("password") String password);
	
	public ReservationDTO reserveCheck(String id);
	
	public int join(MemberDTO dto);
}
