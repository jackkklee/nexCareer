package com.ch.my.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.my.model.Member;
import com.ch.my.model.Room;
import com.ch.my.model.Text;
import com.ch.my.service.MemberService;
import com.ch.my.service.RoomService;
import com.ch.my.service.TextService;
@Controller
public class rmController{
	@Autowired
	private MemberService ms;
	@Autowired
	private RoomService rs;
	@Autowired
	private TextService ts;
	@RequestMapping("logonNeed")
	public String logonNeed() {
		return "logonNeed";
	}
	@RequestMapping("text2")
	public String text2(HttpSession session,Model model, Text text) {
		if(session.getAttribute("id")==null) {
			return "logonNeed";
		}
		String id = (String) session.getAttribute("id");
		int num = ms.selectNum(id);
		if (num==0) {
			return "roomMain";
		}
		List<Text> list = ts.list();
		model.addAttribute("list",list);
		return "text2";
	}
	@RequestMapping("text3")
	public String text3(HttpSession session,Model model, Text text) {
		if(session.getAttribute("id")==null) {
			return "logonNeed";
		}
		String id = (String) session.getAttribute("id");
		int num = ms.selectNum(id);
		if (num==0) {
			return "roomMain";
		}
		int num2 = (int)session.getAttribute("roomNum");
		ts.delete(num2);
		List<Text> list = ts.list();
		model.addAttribute("list",list);
		return "text2";
	}
	@RequestMapping("text")
	public String text(HttpSession session,HttpServletRequest request,Text text,Model model) {
		if(session.getAttribute("id")==null) {
			return "logonNeed";
		}
		String id = (String) session.getAttribute("id");
		int num = ms.selectNum(id);
		if (num==0) {
			return "roomMain";
		}
		text.setText_mem_id(id);
		text.setText_room_num(num);
		int result = ts.insert(text);
		
		model.addAttribute("num",num);
		List<Text> list = ts.list();
		model.addAttribute("list",list);
		model.addAttribute("result",result);
		return "text";
	}
	@RequestMapping("exitRoom")
	public String exitRoom(HttpSession session, HttpServletRequest request,Model model) {
		session.removeAttribute("roomNum");
		int count = Integer.parseInt(request.getParameter("count"));
		String id = (String)session.getAttribute("id");
		int selectNum = ms.selectNum(id);
		if (selectNum>0) {
			rs.downCount(selectNum);
			ms.removeNum(id);
		}
		model.addAttribute("count", count);
		return "exitRoom";
	}
	@RequestMapping("roomInsertForm")
	public String roomInsertForm(Member member, Model model,HttpSession session) {
		if(session.getAttribute("id")==null) {
			return "logonNeed";
		}
		String id = (String)session.getAttribute("id");
		
		int selectNum = ms.selectNum(id);
		if (selectNum>0) {
			model.addAttribute("num",selectNum);
			return "insertCheck";
		}
		
		member = ms.select(id);
		model.addAttribute("member", member);
		return "roomInsertForm";
	}	
	@RequestMapping("roomInsertForm2")
	public String roomInsertForm2(Member member, Model model,HttpSession session) {
		if(session.getAttribute("id")==null) {
			return "logonNeed";
		}
 		String id = (String)session.getAttribute("id");
  		if(session.getAttribute("roomNum")!=null) {
			session.removeAttribute("roomNum");
		}
		int selectNum = ms.selectNum(id);
		if (selectNum>0) {
			rs.downCount(selectNum);
			ms.removeNum(id);
		}
		return "roomInsertForm2";
	}
	@RequestMapping("roomList")
	public String roomList(Room room,Member member, Model model,HttpSession session, HttpServletRequest request) {
		if(session.getAttribute("id")!=null) {
			String id = (String)session.getAttribute("id");
			member = ms.select(id);
			model.addAttribute("member", member);
			int num = member.getRoom_num();
			room = rs.select(num);
			model.addAttribute("room",room);
/*			if (num>0) {
				String subject = rs.selectSubject(num);
				model.addAttribute("subject",subject);
			}*/
		}
		rs.delete();
		List<Room> list = rs.list();
		
		model.addAttribute("count", list.size());
		model.addAttribute("list",list);
		return "roomList";
	}
	@RequestMapping("roomMain")
	public String roomMain(Member member, Model model,HttpSession session,HttpServletRequest request) {
		if(session.getAttribute("id")!=null) {
			String id = (String)session.getAttribute("id");
			member = ms.select(id);
			model.addAttribute("member", member);
		}
/*		if(session.getAttribute("roomMain")!=null) {
			String rm = (String)session.getAttribute("roomMain");
			int roomNum = Integer.parseInt(rm);
			model.addAttribute("roomNum", roomNum);
		}*/
		return "roomMain";
	}
	@RequestMapping("roomInsert")
	public String roomInsert(Room room, Model model, HttpSession session, HttpServletRequest request) {
		int room_num = rs.maxNum();
		session.setAttribute("roomNum", room_num);
		String id = (String)session.getAttribute("id");
		room.setRoom_num(room_num);
		room.setRoom_mem_id(id);	
		int result = rs.insert(room);
		rs.upCount(room_num);
		ms.setRoomNum(room_num,id);
		model.addAttribute("result",result);
		model.addAttribute("num",room_num);
		return "roomInsert";
	}
/*	@RequestMapping("chargeForm")
	public String chargeform(Member member, Model model,HttpServletRequest request) {
		if((String)request.getSession().getAttribute("id")!=null) {
			String id = (String)request.getSession().getAttribute("id");
			member = ms.select(id);
			model.addAttribute("member", member);
		}
		return "../chargeForm";
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
		return "../charge";
	}*/
}

