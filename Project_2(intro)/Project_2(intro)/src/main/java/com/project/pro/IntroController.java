package com.project.pro;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IntroController {
	SqlSession sqlSession;
	
	public IntroController(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@RequestMapping(value={"/","intro.do"})
	public String intro() {
		return "/WEB-INF/views/intro.jsp";
	}
}
