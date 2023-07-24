package dao;

import org.apache.ibatis.session.SqlSession;

public class ProPhotoDAO {
	
	SqlSession sqlSession;
	
	public ProPhotoDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

}
