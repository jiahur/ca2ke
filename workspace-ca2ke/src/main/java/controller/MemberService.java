package controller;

import dto.MemberDTO;

public interface MemberService {
	
	//회원 1명 정보 조회
	MemberDTO getMember(String m_id);
}
