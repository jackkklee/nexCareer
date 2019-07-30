package com.ch.my.controller;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.my.model.Charge;
import com.ch.my.model.Manager;
import com.ch.my.model.Member;
import com.ch.my.service.ChargeService;
import com.ch.my.service.ManagerService;
import com.ch.my.service.MemberService;
@Controller
public class maContoller {
	@Autowired
	private ChargeService cs;
	@Autowired
	private ManagerService mns;
	@Autowired
	private MemberService ms;
	@RequestMapping("mainManager")
	public String mainManager() {
		return "managerMain";
	}
	@RequestMapping("managerLoginForm")
	public String managerLoginForm() {
		return "logon/managerLoginForm";
	}
	@RequestMapping("managerLogin")
	public String logon(Manager manager1,Model model,HttpSession session) {
		Manager manager  = mns.select(manager1.getManagerid());
		int result = 0;
		if (manager == null) {
			result = -1;
		} else {
			if (manager.getManagerpasswd().equals(manager1.getManagerpasswd())) {				
				session.setAttribute("id", manager1.getManagerid());
					result = 1;
			} else result = 0;
		}
		model.addAttribute("result", result);
		return "logon/managerLogin";
	}
	@RequestMapping("managerLogout")
	public String managerLogout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "logon/managerLogout";
	}
	@RequestMapping("memberList")
	public String memberList(Model model) {
		
		List<Member> list = ms.list(); 
		model.addAttribute("list", list);
		
		return "super/memberList";
	}
	@RequestMapping("memberVipList")
	public String memberVipList(Model model) {
		List<Member> list = ms.list2(); 
		model.addAttribute("list", list);
		
		return "super/memberVipList";
	}
	@RequestMapping("vipAccept")
	public String vipAccept(HttpServletRequest request,Model model) {
		
		String id = request.getParameter("mem_id");
		Member member = ms.select(id);
		int result = ms.vipAccept(member);
		
		List<Member> list = ms.list2(); 
		model.addAttribute("list", list);
		return "super/memberVipList";
	}
	@RequestMapping("vipReject")
	public String vipReject(HttpServletRequest request,Model model) {
		
		String id = request.getParameter("mem_id");
		Member member = ms.select(id);
		int result = ms.vipReject(member);
		
		List<Member> list = ms.list2(); 
		model.addAttribute("list", list);
		return "super/memberVipList";
	}
	@RequestMapping("chargeList")
	public String chargeList(Model model) {
		
		List<Charge> list = cs.chargeList();
		
		model.addAttribute("list", list);
		
		return "sales/chargeList";
	}
	@RequestMapping("salesSum")
	public String salesSum() {
		// 데이터 불러와서 충전 금액 합산하여 jsp로 보내기
		return "sales/salesSum";
	}
}

