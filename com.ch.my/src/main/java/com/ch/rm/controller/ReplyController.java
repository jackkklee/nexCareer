package com.ch.rm.controller;

import java.util.Collection;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.my.model.Member;
import com.ch.my.service.MemberService;
import com.ch.rm.model.Board;
import com.ch.rm.model.ReplyBoard;
import com.ch.rm.service.BoardService;
import com.ch.rm.service.ReplyBoardService;

@Controller
public class ReplyController {
	@Autowired
	private BoardService bs;
	@Autowired
	private ReplyBoardService rbs;
	@Inject
	private MemberService ms;
	@RequestMapping("replyList")
	public String replyList(ReplyBoard rb, Model model, HttpServletRequest req) {
		int bno = rb.getBno();
		Board board = bs.select(bno);
		String id = (String) req.getSession().getAttribute("id");
		Member member = ms.select(id);
		model.addAttribute("member", member);
		Collection<ReplyBoard> rbdList = rbs.list(bno);
		model.addAttribute("board", board);
		model.addAttribute("rbdList", rbdList);
		model.addAttribute("id", id);
		return "replyList";
	}
	@RequestMapping("rUpdate")
	public String rUpdate(ReplyBoard rb, Model model,
			HttpServletRequest req) {
		String id = (String) req.getSession().getAttribute("id");
		Member member = ms.select(id);
		model.addAttribute("member", member);
		rbs.update(rb);
		model.addAttribute(rb);
		int bno = rb.getBno();
		return "redirect:replyList.rb?bno="+bno;
		//redirect => controller로 전달
	}
	@RequestMapping("rInsert")
	public String rInsert(ReplyBoard rb, 
			Model model) {
		int bno = rb.getBno();
		
		rbs.insert(rb);
		return "redirect:replyList.rb?bno="+bno;
	}
	@RequestMapping("rDelete")
	public String rDelete(ReplyBoard rb, Model model) {
		int bno = rb.getBno();
		rbs.delete(rb.getRno());
		return "redirect:replyList.rb?bno="+bno;
	}
}
