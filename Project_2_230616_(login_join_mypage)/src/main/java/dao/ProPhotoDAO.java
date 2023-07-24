package dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public class ProPhotoDAO {
	
	SqlSession sqlSession;
	
	public ProPhotoDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int insert(Map<String, Object> map) {
		int res = sqlSession.insert("p.insert", map);
		return res;
	}
	
	public int delete(int member_idx) {
		int res = sqlSession.delete("p.delete", member_idx);
		return res;
	}
}
