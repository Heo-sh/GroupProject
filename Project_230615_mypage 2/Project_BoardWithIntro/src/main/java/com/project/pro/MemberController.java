package com.project.pro;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.Board_PhotoDAO;
import dao.ProMemberDAO;
import dao.ProPhotoDAO;
import path.MyCommon;
import vo.Board_PhotoVO;
import vo.ProMemberVO;

@Controller
public class MemberController {
	
	@Autowired
	HttpSession session;
	
	ProMemberDAO proMember_dao;
	
	ProPhotoDAO proPhoto_dao;
	
	Board_PhotoDAO board_photo_dao;
	
	public MemberController(ProMemberDAO proMember_dao, 
							ProPhotoDAO proPhoto_dao, 
							Board_PhotoDAO board_photo_dao) {
		
		this.proMember_dao = proMember_dao;
		this.proPhoto_dao = proPhoto_dao;
		this.board_photo_dao = board_photo_dao;
	}
	
	// 메인페이지
	@RequestMapping(value= {"/","main_test"})
	public String main_test(Model model) {
		List<Board_PhotoVO> list = board_photo_dao.selectListLikeB();
		model.addAttribute("list", list);
		return MyCommon.PATH + "main_test.jsp";
	}
	
	@RequestMapping("mymy")
	public String mymy() {
		
		return "/WEB-INF/views/mymy.jsp";
	}
	
	@RequestMapping("mymy2")
	public String mymy2() {
		
		return "/WEB-INF/views/mymy2.jsp";
	}
	
	@RequestMapping("mymy3")
	public String mymy3() {
		
		return "/WEB-INF/views/mymy3.jsp";
	}
	
//	@RequestMapping("mypage")
//	public String real_mypage() {
//		
//		return "/WEB-INF/views/mypage.jsp";
//	}
	
	@RequestMapping("pagemy")
	public String pagemy() {
		
		return "/WEB-INF/views/pagemy.jsp";
	}
	@RequestMapping("pagemy2")
	public String pagemy2() {
		
		return "/WEB-INF/views/pagemy2.jsp";
	}
	
	// 로그인&회원가입 페이지
	@RequestMapping("login_join")
	public String login_join() {
		
		// 로그인 했을 때 로그인&회원가입 페이지로 이동 불가
		if (session.getAttribute("email") != null) {
			
			return "redirect:real_mypage";
		}
		
		return MyCommon.LOGIN_PATH + "login_join.jsp";

	}
	
	// 마이페이지
	@RequestMapping("real_mypage")
	public String real_mypage(Model model) {
		
		// 로그인 하지 않았을 때 마이 페이지로 이동 불가 
		if (session.getAttribute("email") == null) {
			
			// return MyCommon.LOGIN_PATH + "login_join.jsp";
			// 위 처럼 jsp로 바로가려고 시도 하기 때문에 값을 받아오지 못한다
			// redirect로 입력해야 함
			return "redirect:login_join";
		}
		
		ProMemberVO vo = (ProMemberVO)session.getAttribute("email");
		
		//System.out.println(vo.getEmail());
		
		List<Board_PhotoVO> list = board_photo_dao.selectList();
		model.addAttribute("list", list);
		
		
		model.addAttribute("vo", vo);
		
		return "/WEB-INF/views/real_mypage.jsp";
	}
	
	
	// 마이페이지
//	@RequestMapping("mypage")
//	public String mypage(Model model) {
//		
//		// 로그인 하지 않았을 때 마이 페이지로 이동 불가 
//		if (session.getAttribute("email") == null) {
//			
//			// return MyCommon.LOGIN_PATH + "login_join.jsp";
//			// 위 처럼 jsp로 바로가려고 시도 하기 때문에 값을 받아오지 못한다
//			// redirect로 입력해야 함
//			return "redirect:login_join";
//		}
//		
//		ProMemberVO vo = (ProMemberVO)session.getAttribute("email");
//		
//		//System.out.println(vo.getEmail());
//		
//		model.addAttribute("vo", vo);
//		
//		return MyCommon.LOGIN_PATH + "mypage.jsp";
//	}
	
	// 회원수정 페이지
	@RequestMapping("mypage_modify")
	public String test_mypage() {
		
		// 로그인 하지 않았을 때 마이 페이지로 이동 불가 
		if (session.getAttribute("email") == null) {
			
			return "redirect:login_join";
		}
		
		return MyCommon.LOGIN_PATH + "mypage_modify.jsp";
	}
	
	// 이메일 중복 처리
	@PostMapping("check_email")
	@ResponseBody
	// 중복이 안되면 yes, 중복이 되면 no라는 문자열 보내기
	public String check_email(String email) {
		
		int res = proMember_dao.check_email(email);
		
		if (res > 0) {
			
			return "[{'result':'no'}]";
			
		}
		
		return "[{'result':'yes'}]";
	}
 
	// 별명 중복 처리
	// 중복이 안되면 yes, 중복이 되면 no라는 문자열 보내기
	@PostMapping("check_nickname")
	@ResponseBody
	public String check_nickname(String nickname) {
		
		int res = proMember_dao.check_nickname(nickname);
		
		if (res > 0) {
			
			return "[{'result':'no'}]";
			
		}
		
		return "[{'result':'yes'}]";
	}
	
				
	// 회원가입
	@PostMapping("member_insert")
	public String member_insert(ProMemberVO vo) {
		
		int res = proMember_dao.insert(vo);
		
		if (res > 0) {
			
			return "redirect:login_join";
		}
		
		return null;
	}
	
	// 로그인
	@PostMapping("login.do")
	@ResponseBody
	public String login(String email, String pw) {
		
		// 여러 개의 로그인 페이지가 열려 있을 때
		if (session.getAttribute("email") != null) {
			
			return "[{'result':'session_conn'}]";
		}
		
		// 이메일 존재 확인
		ProMemberVO vo = proMember_dao.loginCheck(email);
		
		// 이메일이 존재하지 않는 경우
		if(vo == null) {
			
			return "[{'result':'no_email'}]";
		}
		
		// 비밀번호가 일치하지 않는 경우
		if(!vo.getPw().equals(pw)) {
			
			return "[{'result':'no_pw'}]";
		}
		
		// 세션 유지
		session.setAttribute("email", vo);
		
		return "[{'result':'clear'}]";
	}
	
	// 로그아웃
	@RequestMapping("logout.do")
	public String logout() {
		
		// 세션 제거
		session.removeAttribute("email");
		
		// 세션에 들어있는 모든 속성을 제거한다
		// session.invalidate();
		
		return "redirect:main_test";
	}
	
	// 수정을 위한 회원정보 가져오기
	@RequestMapping("member_form")
	public String member_form(Model model) {
		
		ProMemberVO vo = (ProMemberVO)session.getAttribute("email");

		//System.out.println(vo.getNickname());
		
		model.addAttribute("vo",vo);
		
		return MyCommon.LOGIN_PATH + "mypage_modify.jsp";
				
	}
	
	// 회원수정
	@PostMapping("update.do")
	public String member_update(ProMemberVO vo) {
				
		int res = proMember_dao.update(vo);
	
		//System.out.println(vo.getNickname());
		
		if(res > 0) {
			
			// 수정 후 세션 재생성
			session.setAttribute("email", vo);
			//return "redirect:mypage";
			return "redirect:real_mypage";
		}
		
		session.invalidate();
		return "redirect:main_test";
				
	}
	
	// 회원탈퇴 페이지
	@RequestMapping("mypage_del")
	public String mypage_del() {
		
		// 로그인 하지 않았을 때 마이 페이지로 이동 불가 
		if (session.getAttribute("email") == null) {
			
			return "redirect:login_join";
		}
		
		return MyCommon.LOGIN_PATH + "mypage_del.jsp";
	}
	
	// 회원탈퇴
	@RequestMapping("meb_del.do")
	public String member_delete() {
				
		ProMemberVO vo = (ProMemberVO)session.getAttribute("email");
						
		int res = proMember_dao.delete(vo);
		
		if(res > 0) {
			
			session.invalidate();
			return "redirect:main_test";
		}
		
		return null;
	}
	
	// 마이페이지 나의 게시물 조회
//	@RequestMapping("mypage_list")
//	public String mypage_list(Model model) {
//		
//		ProMemberVO vo = (ProMemberVO)session.getAttribute("email");
//		
//		int idx = vo.getMember_idx();
//		
//		List<Board_PhotoVO> mylist = board_photo_dao.selectMylist(idx);
//		
//		model.addAttribute("mylist",mylist);
//		
//		return "redirect:real_mypage";
//		
//	}
	
	
}
