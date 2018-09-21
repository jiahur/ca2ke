package dao;



import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.MemberDTO;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//회원 1명 정보 조회
	public MemberDTO getMember(String m_id){
		return sqlSession.selectOne("mybatis.memberMapper.getMember", m_id);
	}
	

}
