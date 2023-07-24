package dao;

import org.apache.ibatis.session.SqlSession;

import vo.ProMemberVO;

public class ProMemberDAO {
	
	SqlSession sqlSession;
	
	public ProMemberDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// 로그인 검증
	public ProMemberVO loginCheck(String email) {
		
		ProMemberVO vo = sqlSession.selectOne("m.loginCheck", email);
		return vo;
	}
	
	// 아이디 중복체크
	public int check_id(String id) {
		
		int res = sqlSession.selectOne("m.check_id", id);
		return res;
	}
	
	// 별명 중복체크
	public int check_nickname(String nickname) {
		
		int res = sqlSession.selectOne("m.check_nickname", nickname);
		return res;
	}
	
	// 이메일 중복체크
	public int check_email(String email) {
		
		int res = sqlSession.selectOne("m.check_email", email);
		return res;
	}
	
	// 회원추가
	public int insert(ProMemberVO vo) {
		
		int res = sqlSession.insert("m.member_insert",vo);
		return res;
	}

}
