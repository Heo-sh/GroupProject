package com.project.pro;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IntroController {

	@RequestMapping("intro.do")
	public String intro() {
		return path.MyCommon.INTRO_PATH + "intro.jsp";
	}
}
