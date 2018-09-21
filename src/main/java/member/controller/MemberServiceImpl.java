package member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.bean.MemberDTO;
import member.dao.MemberDAO;


@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO memberDAO;


	@Override
	public boolean isExisId(String m_id) {
		return memberDAO.isExisId(m_id);
	}

	@Override
	public int join(MemberDTO memberDTO) {
		return memberDAO.join(memberDTO);
	}

	@Override
	public String login(String m_id, String m_pwd) {
		return memberDAO.login(m_id, m_pwd);
	}
	public MemberDTO modifyView(String memId) {
		return memberDAO.modifyView(memId);
	}

	@Override
	public int modifyUpdate(MemberDTO memberDTO) {
		return memberDAO.modifyUpdate(memberDTO);
	}

	@Override
	public int memberDelete(String m_pwd) {
		return memberDAO.memberDelete(m_pwd);
	}
}

