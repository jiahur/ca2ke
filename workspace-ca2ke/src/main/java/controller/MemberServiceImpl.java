package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.MemberDAO;
import dto.MemberDTO;


@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO memberDAO;

	@Override
	public MemberDTO getMember(String m_id) {
		return memberDAO.getMember(m_id);
	}
}
