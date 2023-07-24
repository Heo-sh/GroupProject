package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.Board_PhotoVO;

public class Board_PhotoDAO {
	SqlSession sqlSession;
	
	public Board_PhotoDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	};
	
	//게시글 전체 조회
	public List<Board_PhotoVO> selectList() {
		List<Board_PhotoVO> list = sqlSession.selectList("bp.selectList");
		return list;
	}
	
	//게시글 한건 조회
	public Board_PhotoVO selectOne(Map<String, Object> map) {
		Board_PhotoVO vo = sqlSession.selectOne("bp.selectOne", map);
		return vo;
	}
	
	//게시물 1건 삭제
	public int delete(int board_id) {
		int res = sqlSession.delete("bp.delete", board_id);
		return res;
	}	
}
