	package com.example.demo.member;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.util.JSONPObject;

@Controller
public class MemController {
	
	@Autowired
	private MemberService service;

	@GetMapping(value = "/member/loginForm")
	public void loginForm() {
		
	}
	
	@RequestMapping(value = "/member/joinForm")
	public void form(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.setAttribute("idCheck", false);
	}

	@RequestMapping(value = "/member/idCheck")
	public ModelAndView idCheck(HttpServletRequest req, 
			@RequestParam(value = "user_id") String user_id) {
		System.out.println(user_id);
		HttpSession session = req.getSession(false);
		ModelAndView mav = new ModelAndView("member/idCheck");
		String result = "";
		Member m = service.getMember(user_id);
		if (m == null) {
			result = "OK";
			session.setAttribute("idCheck", true);
		} else {
			result = "NO";
			session.setAttribute("idCheck", false);
		}
		System.out.println(session.getAttribute("idCheck"));
		mav.addObject("result", result);
		return mav;
	}

	@RequestMapping(value = "/member/join")
	public String join(Member m) {
		service.addMember(m);
		return "member/loginForm";
	}

	@RequestMapping(value = "/member/login")
	public String login(HttpServletRequest req, Member m) {
	    Member m2 = service.getMember(m.getUser_id());
	    if (m2 == null) {
	        System.out.println("아이디에 해당하는 회원이 존재하지 않습니다.");
	        return "member/loginForm"; 
	    } else if (!m2.getUser_pwd().equals(m.getUser_pwd())) {
	        System.out.println("비밀번호가 일치하지 않습니다.");
	        return "member/loginForm"; 
	    } else {
	        HttpSession session = req.getSession();
	        session.setAttribute("user_id", m2.getUser_id());
	        session.setAttribute("user_type", m2.getUser_type());
	        return "member/main"; 
	    }
	}

		
	@RequestMapping(value = "/member/editForm")
	public ModelAndView editForm(HttpServletRequest req){
		ModelAndView mav = new ModelAndView("member/editForm");
		HttpSession session = req.getSession(false);
		String user_id = (String)session.getAttribute("user_id");
		Member m = service.getMember(user_id);
		mav.addObject("m", m);
		return mav;
	}
	
	@RequestMapping(value = "/member/edit")
	public String edit(Member m){
		service.editMember(m);
		return "member/main";
	}
	
	@RequestMapping(value = "/member/logout")
	public String logout(HttpServletRequest req){
		HttpSession session = req.getSession(false);
		session.removeAttribute("user_id");
		session.invalidate();
		return "member/loginForm";
	}
	
	@RequestMapping(value = "/member/out")
	public String out(HttpServletRequest req){
		HttpSession session = req.getSession(false);
		String user_id = (String)session.getAttribute("user_id");
		service.delMember(user_id);
		session.removeAttribute("user_id");
		session.invalidate();
		return "member/loginForm";
	}
	
	@RequestMapping(value = "/member/del")
	public String del(@RequestParam("user_id") String userId, HttpServletRequest req){
	    // userId를 사용하여 해당 유저를 탈퇴시키는 코드 작성
	    service.delMember(userId);

	    // 세션 처리
	    HttpSession session = req.getSession(false);
	    if (session != null) {
	        String currentUserId = (String) session.getAttribute("user_id");
	        if (currentUserId != null && currentUserId.equals(userId)) {
	            session.invalidate(); // 현재 세션을 삭제합니다.
	        }
	    }

	    return "redirect:/admin/memberList"; // 탈퇴 후 관리자 페이지로 리다이렉트 또는 적절한 페이지로 이동
	}

	
	@RequestMapping(value = "/gmproduct/gmallList")
	public String gmallList() {
		
		return "gmproduct/gmallList";
	}
	//상단 메뉴바 불러오기 입니다.
	@GetMapping(value = "/member/mainMenu")
	public String mainMenu() {
		
		return "member/main";
	}
	//메인 이동입니다.
	@RequestMapping(value = "/member/main")
	public String main() {
		
		return "member/main";
	}
	
	//회원 전체출력 
	@RequestMapping(value = "/admin/memberList")
	public ModelAndView memList() {
		ModelAndView mav = new ModelAndView("admin/memberList");
		ArrayList<Member> list = (ArrayList<Member>) service.selectAll();		
		mav.addObject("list", list);
		return mav;
	}
	
	//취소클릭
	@PostMapping(value = "/member/reset")
	public String reset() {
		return "member/main";
	}
}
