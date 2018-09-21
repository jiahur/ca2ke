package member.controller;

import member.bean.MemberDTO;

public interface MemberService {
	
	//현호
	public boolean isExisId(String id);
	public int join(MemberDTO memberDTO);
	public String login(String m_id, String m_pwd);
	public MemberDTO modifyView(String memId);
	public int modifyUpdate(MemberDTO memberDTO);
	public int memberDelete(String m_pwd);
}
