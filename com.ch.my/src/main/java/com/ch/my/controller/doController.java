package com.ch.my.controller;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.io.UnsupportedEncodingException;
import java.util.Collection;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.my.model.Charge;
import com.ch.my.model.Member;
import com.ch.my.model.Room;
import com.ch.my.service.ChargeService;
import com.ch.my.service.MemberService;
import com.ch.my.service.RoomService;
import com.ch.my.service.TextService;
@Controller
public class doController{
	@Autowired
	private ChargeService cs;
	@Autowired
	private MemberService ms;
	@Autowired
	private RoomService rs;
	@Autowired
	private TextService ts;
	@RequestMapping("chat")
	public String chat(Model model,Member member,HttpServletRequest request,HttpSession session,Room room) {
		if(session.getAttribute("id")==null) {
			return "../room/logonNeed";
		}
		String id = (String)session.getAttribute("id");
		int selectNum = ms.selectNum(id);
		int num = Integer.parseInt(request.getParameter("num"));
		/*String delete = request.getParameter("delete");*/
		/*세션에 방번호가 있을떄*/
		if(session.getAttribute("roomNum")!=null) {
			int num2 = (int)session.getAttribute("roomNum");
			/*중복입장을 하려할 떄*/
			if (num!=num2) {
				model.addAttribute("num",num2);
				return "../room/redu";
			}
			/*자기방으로 들어갈 떄*/
			else if (num==num2) {
				room = rs.select(num);
				model.addAttribute("room",room);
				List<Member> list = ms.list();
				model.addAttribute("list",list);
				model.addAttribute("num",num);
				return "chat";
			}	
		/*세션에 방번호가 없을떄*/
		} else {
			/*입장중인 방이 없을떄*/
			if (selectNum<=0) {
			/*방지정*/
			rs.upCount(num);
			ms.setRoomNum(num,id);
			}
		room = rs.select(num);
		model.addAttribute("room",room);
		List<Member> list = ms.list();
		model.addAttribute("list",list);
		session.setAttribute("roomNum", num);
		model.addAttribute("num",num);
		return "chat";
		}
		return null;
	}
	@RequestMapping("main")
	public String main(Member member, Model model,HttpSession session) {
		if(session.getAttribute("id")!=null) {
			String id = (String)session.getAttribute("id");
			member = ms.select(id);
			model.addAttribute("member", member);
		}
		return "pandoraMain";
	}
	@RequestMapping("chargeForm")
	public String chargeform(Member member, Model model,HttpServletRequest request) {
		if((String)request.getSession().getAttribute("id")!=null) {
			String id = (String)request.getSession().getAttribute("id");
			member = ms.select(id);
			model.addAttribute("member", member);
		}
		return "chargeForm";
	}
	@RequestMapping("charge")
	public String charge(Member member, Model model,HttpServletRequest request,Charge charge) {
		try{request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {	}
		if((String)request.getSession().getAttribute("id")!=null) {
			String id = (String)request.getSession().getAttribute("id");

			int charge_option = Integer.parseInt(request.getParameter("charge"));
			String acc_number = request.getParameter("acc_number");
			
			charge.setMem_id(id);
			charge.setCharge_option(charge_option);
			charge.setCharge_account(acc_number);
			
			int result1 = cs.insert(charge);
			model.addAttribute("result1", result1);
			
			int charge_point = cs.point(charge_option);
			
			member.setMem_id(id);
			member.setMem_point(charge_point);
			
			int result2 = ms.charge(member);
			model.addAttribute("result2", result2);
		}
		return "charge";
	}
}

