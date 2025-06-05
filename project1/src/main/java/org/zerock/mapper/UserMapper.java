package org.zerock.mapper;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.MemberDTO;

public interface UserMapper {

	public MemberDTO loginCheck(@Param("id") String id, @Param("password") String password);
}
