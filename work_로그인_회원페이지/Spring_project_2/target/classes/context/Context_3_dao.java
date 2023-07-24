package context;

import org.apache.ibatis.session.SqlSession;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import dao.MapDAO;

//DAO에 관련된 객체만 관리할 설정파일
@Configuration
public class Context_3_dao {
	
	@Bean
	public MapDAO map_dao(SqlSession sqlSession) {
		return new MapDAO(sqlSession);
	}
}
