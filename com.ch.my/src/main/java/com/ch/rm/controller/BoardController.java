package com.ch.rm.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.Collection;

import javax.inject.Inject;
import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.my.model.Member;
import com.ch.my.service.MemberService;
import com.ch.rm.model.Board;
import com.ch.rm.service.BoardService;
import com.ch.rm.service.PagingBean;

@Controller
public class BoardController {
	@Autowired
	private BoardService bs;
	@Inject
	private MemberService ms;
	@RequestMapping("list")
	public String list(String pageNum,Board board, Model model) {
		// �꽭�뀡id�뿉 留욎떠 �닔�젙�븘
		
		if (pageNum==null || pageNum.contentEquals("")) pageNum= "1";
		int currentPage= Integer.parseInt(pageNum);
		int rowPerPage = 10;
		int total = bs.getTotal(board);
		int startRow = (currentPage-1)*rowPerPage +1;
		int endRow = startRow + rowPerPage - 1;
		board.setStartRow(startRow);
		board.setEndRow(endRow);
		//Collection<Board> list = bs.list(startRow, endRow);
		Collection<Board> list = bs.list(board);
		int no = total - startRow + 1 ;
		PagingBean pb = new PagingBean(currentPage,rowPerPage,total);
		
		String []tit = {"작성자","제목","내용","댓글"};
		model.addAttribute("list", list);
		model.addAttribute("board", board);
		model.addAttribute("tit",tit);
		model.addAttribute("no", no);
		model.addAttribute("pb", pb);
		return "list";
	}
	@RequestMapping("insertForm")
	public String insertForm(String nm, String pageNum, Model model,HttpServletRequest request) {
		if((String)request.getSession().getAttribute("id")!=null) {
			String id = (String)request.getSession().getAttribute("id");
			System.out.println("id="+id);
			request.getSession().setAttribute("id", id);
			Member member = ms.select(id);
			model.addAttribute("member", member);
		}else {return "../logon/logonForm";}
		int ref = 0, re_level=0, re_step=0, num=0;
		if (nm!=null && !nm.equals("")) {
		/*Integer.parseInt(req.getParameter(nm));*/
		
		num = Integer.parseInt(nm);
		Board board= bs.select(num);
		ref = board.getRef();
		re_level = board.getRe_level();
		re_step = board.getRe_step();
		}
		/*System.out.println(req.getSession().getAttribute("id"));*/
		model.addAttribute("ref",ref);	
		model.addAttribute("re_level",re_level);
		model.addAttribute("re_step",re_step);
		model.addAttribute("num",num);
		model.addAttribute("pageNum",pageNum);
		return "insertForm";
	}
	@RequestMapping("insert")
	public String insert(Board board, String pageNum, 
			Model model, HttpServletRequest req) {
		board.setIp(req.getRemoteAddr());
		int number = bs.maxNum();
		//�떟蹂�湲�
		if (board.getNum() !=0) {
			//理쒖떊�떟湲��쓣 �쐞濡� �넃湲곗쐞�빐 step 利앷�
			bs.updateStep(board);
			// �쁽�옱 �씫��湲�蹂대떎 step�씠 level�쓣 1利앷�
			board.setRe_level(board.getRe_level()+1);
			board.setRe_step(board.getRe_step()+1);
		} else
		board.setRef(number);
		board.setNum(number);
		int result = bs.insert(board);
		model.addAttribute("result",result);
		model.addAttribute("pageNum",pageNum);
		return "insert" ;
	}
	@RequestMapping("updateForm")
	public String updateForm(int num, String pageNum, Model model,
			HttpServletRequest req) {
		String id = (String) req.getSession().getAttribute("id");
		Member member = ms.select(id);
		model.addAttribute("member", member);
		Board board= bs.select(num);
		model.addAttribute("board", board);
		model.addAttribute("pageNum", pageNum);
		return "updateForm";
	}
	@RequestMapping("update")
	public String update(Board board, String pageNum, Model model) {
		int result = bs.update(board);
		model.addAttribute("result",result);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("board", board);
		return "update";
	}
	@RequestMapping("deleteForm")
	public String deleteForm(int num, String pageNum, Model model,
			HttpServletRequest req) {
		
		String id = (String) req.getSession().getAttribute("id");
		Member member = ms.select(id);
		model.addAttribute("member", member);
		Board board= bs.select(num);
		model.addAttribute("board", board);
		model.addAttribute("pageNum", pageNum);
		return "deleteForm";
	}
	@RequestMapping("delete")
	public String delete(Board board, String pageNum, Model model,
			HttpServletRequest req) {
		int result = bs.delete(board);
		String id = (String) req.getSession().getAttribute("id");
		Member member = ms.select(id);
		model.addAttribute("member", member);
		model.addAttribute("result",result);
		model.addAttribute("pageNum",pageNum);
		return "delete";
	}
		
	@RequestMapping("view")
	public String view(int num, String pageNum, Model model,
			HttpServletRequest req) {
		if((String)req.getSession().getAttribute("id")==null) {
			return "../logon/logonForm";
		}
		String id = (String) req.getSession().getAttribute("id");
		Member member = ms.select(id);
		model.addAttribute("member", member);
		bs.updateReadcount(num);
		Board board = bs.select(num);
		model.addAttribute("id", id);
		model.addAttribute("board",board);
		model.addAttribute("pageNum", pageNum);
		return "view";
	}
			
	
}
