package member.dao;



import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import member.bean.MemberDTO;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//회원 1명 정보 조회
	public MemberDTO getMember(String m_id){
		return sqlSession.selectOne("mybatis.memberMapper.getMember", m_id);
	}

		public boolean isExisId(String m_id) {
		boolean exist = false;
		if(sqlSession.selectOne("mybatis.memberMapper.idcheck", m_id) != null) {
			exist = true;
		}
		return exist;
	}
	
	public int join(MemberDTO memberDTO) {
		return sqlSession.insert("mybatis.memberMapper.join", memberDTO);
	}
	
	public String login(String m_id, String m_pwd) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("m_id", m_id);
		map.put("m_pwd", m_pwd);
		return sqlSession.selectOne("mybatis.memberMapper.login", map);
	}
	
	public MemberDTO modifyView(String memId) {
		return sqlSession.selectOne("mybatis.memberMapper.modifyView", memId);
	}
	
	public int modifyUpdate(MemberDTO memberDTO) {
		return sqlSession.update("mybatis.memberMapper.modifyUpdate", memberDTO);
	}
	public int memberDelete(String m_pwd) {
		return sqlSession.delete("mybatis.memberMapper.memberDelete", m_pwd);
	}
	

}
