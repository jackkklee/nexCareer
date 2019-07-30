package com.ch.my.controller;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.io.UnsupportedEncodingException;
import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.my.model.Member;
import com.ch.my.service.MemberService;
@Controller
public class loController {
	@Autowired
	private MemberService ms;
	@RequestMapping("logonForm")
	public String logonForm() {
		// 로그인 입력 페이지로 이동
		return "logonForm";
	}
	@RequestMapping("logon")
	public String logon(Member member1,Model model,HttpSession session) {
		Member member  = ms.select(member1.getMem_id());
		int result = 0;
		if (member == null || member.getMem_del().equals("y")) {
			result = -1;
		} else {
			if (member.getMem_passwd().equals(member1.getMem_passwd())) {				
				session.setAttribute("id", member1.getMem_id());
				result = 1;
				String id = (String)session.getAttribute("id");
				int selectNum = ms.selectNum(id);
				if (selectNum>0) {
					session.setAttribute("roomNum", selectNum);
					model.addAttribute("num",selectNum);
				}
			} else result = 0;
		}
		model.addAttribute("result", result);
		return "logon";
	}
	@RequestMapping("logon2")
	public String logon2(Member member1,Model model,HttpSession session) {
		Member member  = ms.select(member1.getMem_id());
		int result = 0;
		if (member == null || member.getMem_del().equals("y")) {
			result = -1;
		} else {
			if (member.getMem_passwd().equals(member1.getMem_passwd())) {				
				session.setAttribute("id", member1.getMem_id());
				result = 1;
		 		String id = (String)session.getAttribute("id");
				int selectNum = ms.selectNum(id);
				if (selectNum>0) {
					session.setAttribute("roomNum", selectNum);
					model.addAttribute("num",selectNum);
				}
			} else result = 0;
		}
		model.addAttribute("result", result);
		return "../room/logon2";
	}
	@RequestMapping("logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		/*session.removeAttribute("id");*/
		session.invalidate();
		return "logout";
	}
	@RequestMapping("joinForm")
	public String joinForm() {
		return "joinForm";
	}
	@RequestMapping("join")
	public String join(HttpServletRequest request,Model model) {
		try{request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {	}
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String address = request.getParameter("address");
		String birth = request.getParameter("birth");
		
		Member member = new Member();
		
		member.setMem_id(id);
		member.setMem_passwd(password);
		member.setMem_name(name);
		member.setMem_email(email);
		member.setMem_tel(tel);
		member.setMem_addr(address);
		member.setMem_birth(birth);
		
		int result = ms.insert(member);
		model.addAttribute("result", result);
		return "join";
	}
	@RequestMapping("idChk")
	public String idChk(HttpServletRequest request,Model model) {

		String id = request.getParameter("id");
		int result = 0;
		Member member = ms.select(id);
		if(member != null) result = 1;
		model.addAttribute("result", result);
		model.addAttribute("id", id);
		/*return "idChk";*/
		return "idChk2";
	}
}

