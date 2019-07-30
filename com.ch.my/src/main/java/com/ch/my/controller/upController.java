package com.ch.my.controller;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ch.my.model.Charge;
import com.ch.my.model.Download;
import com.ch.my.model.FileUp;
import com.ch.my.model.Member;
import com.ch.my.model.Req_Board;
import com.ch.my.service.ChargeService;
import com.ch.my.service.DownloadService;
import com.ch.my.service.FileUpService;
import com.ch.my.service.MemberService;
import com.ch.my.service.Req_BoardService;
@Controller
public class upController {
	@Autowired
	private ChargeService cs;
	@Autowired
	private DownloadService ds;
	@Autowired
	private FileUpService fs;
	@Autowired
	private MemberService ms;
	@Autowired
	private Req_BoardService rs;
	@RequestMapping("reqBoardList")
	public String reqBoardList(Member member, Model model,HttpServletRequest request) {
		if((String)request.getSession().getAttribute("id")!=null) {
			String id = (String)request.getSession().getAttribute("id");
			member = ms.select(id);
			model.addAttribute("member", member);
		}
		int rowPerPage = 10;
		int pagePerBlock = 10;
		String pageNum = request.getParameter("pageNum");
		if (pageNum==null || pageNum.equals("")) {
			pageNum="1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1)*rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		List<Req_Board> list = rs.list(startRow, endRow);
		int tot = rs.total();
		int total = rs.total() - startRow+1;	
		int startPage = currentPage - (currentPage - 1)%pagePerBlock;
		int endPage = startPage + pagePerBlock -1;
		int totPage = (int)Math.ceil((double)tot/rowPerPage);
		if (endPage > totPage) endPage = totPage;

		model.addAttribute("list", list);
		model.addAttribute("rowPerPage",rowPerPage );
		model.addAttribute("pagePerBlock",pagePerBlock );
		model.addAttribute("pageNum",pageNum );
		model.addAttribute("currentPage",currentPage );
		model.addAttribute("startRow",startRow );
		model.addAttribute("endRow",endRow );
		model.addAttribute("tot",tot );
		model.addAttribute("total",total );
		model.addAttribute("startPage",startPage );
		model.addAttribute("endPage",endPage );
		model.addAttribute("totPage",totPage );
		return "../req_board/reqBoardList";
	}
	@RequestMapping("requestView")
	public String requestView(Model model,HttpServletRequest request,Member member) {
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		rs.readcountUpdate(board_num);
		Req_Board req_board = rs.select(board_num);
		if((String)request.getSession().getAttribute("id")!=null) {
			String id = (String)request.getSession().getAttribute("id");
			member = ms.select(id);
			model.addAttribute("member", member);
		}
		model.addAttribute("req_board", req_board);
		return "../req_board/requestView";
	}
	@RequestMapping("requestForm")
	public String requestForm(HttpSession session) {
		if(session.getAttribute("id")==null) {
			return "../logon/logonForm";
		}
		return "../req_board/requestForm";
	}
	@RequestMapping("request")
	public String request(Model model,HttpServletRequest request) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			System.out.println(e.getMessage());
		}
		String writer = request.getParameter("writer");
		String subject = request.getParameter("subject");
		String category = request.getParameter("category");
		String content = request.getParameter("content");
		Req_Board req_board = new Req_Board();
		req_board.setMem_id(writer);
		req_board.setBoard_subject(subject);
		req_board.setCategory(category);
		req_board.setBoard_content(content);
		int result = rs.insert(req_board);
		model.addAttribute("result", result);
		System.out.println("result = "+result);
		return "../req_board/requestInsert";
	}
	@RequestMapping("requestReplyForm")
	public String requestReplyForm(Model model,HttpServletRequest request,HttpSession session) {
		if(session.getAttribute("id")==null) {
			return "../logon/logonForm";
		}
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		int board_ref = Integer.parseInt(request.getParameter("board_ref"));
		int board_re_step = Integer.parseInt(request.getParameter("board_re_step"));
		int board_re_level = Integer.parseInt(request.getParameter("board_re_level"));
		Req_Board req_board = new Req_Board();
		req_board.setBoard_num(board_num);
		req_board.setBoard_ref(board_ref);
		req_board.setBoard_re_step(board_re_step);
		req_board.setBoard_re_level(board_re_level);
		model.addAttribute("req_board", req_board);
		return "../req_board/requestReplyForm";
	}
	@RequestMapping("requestReply")
	public String requestReply(Model model,HttpServletRequest request) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			System.out.println(e.getMessage());
		}
		String writer = request.getParameter("writer");
		String subject = request.getParameter("subject");
		String category = request.getParameter("category");
		String content = request.getParameter("content");
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		int board_ref = Integer.parseInt(request.getParameter("board_ref"));
		int board_re_step = Integer.parseInt(request.getParameter("board_re_step"));
		int board_re_level = Integer.parseInt(request.getParameter("board_re_level"));
		int step_max = rs.maxStep(board_ref);
		rs.increaseAncestor(board_num);
		if (step_max==0) { 
				board_re_step=(step_max+1);
				board_num-=1; 
		}
		else {
			//재답글
			Req_Board req_board = new Req_Board();
			rs.numupdate(req_board);
			int result2 = rs.reSelect(req_board);
			result2 = board_num;
			board_re_level+=1;
		}//재답글끝
		Req_Board req_board = new Req_Board();
		req_board.setMem_id(writer);
		String a = "";
		for (int i = 0; i < board_re_level; i++) {
			a +="  "; 
		}//이거안된다
		req_board.setBoard_subject(a+subject);
		req_board.setCategory(category);
		req_board.setBoard_content(content);
		
		req_board.setBoard_ref(board_ref);
		req_board.setBoard_re_step(board_re_step);
		req_board.setBoard_re_level(board_re_level);
		req_board.setBoard_num(board_num);
		int result = rs.reInsert(req_board);
		model.addAttribute("req_board", req_board);
		model.addAttribute("result", result);
		return "../req_board/requestReply";
	}
	@RequestMapping("requestUpdateForm")
	public String requestUpdateForm(HttpSession session, Model model,HttpServletRequest request) {
		if(session.getAttribute("id")==null) {
			return "../logon/logonForm";
		}
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		Req_Board req_board = rs.select(board_num);
		model.addAttribute("req_board", req_board);
		return "../req_board/requestUpdateForm";
	}
	@RequestMapping("requestUpdate")
	public String requestUpdate(Model model,HttpServletRequest request) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			System.out.println(e.getMessage());
		}
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		String subject = request.getParameter("subject");
		String category = request.getParameter("category");
		String content = request.getParameter("content");
		Req_Board req_board = new Req_Board();
		req_board.setBoard_num(board_num);
		req_board.setBoard_subject(subject);
		req_board.setCategory(category);
		req_board.setBoard_content(content);
		int result = rs.update(req_board);
		model.addAttribute("result", result);
		System.out.println("에러result="+result);
		return "../req_board/requestUpdate";
	}
	@RequestMapping("requestDelete")
	public String requestDelete(Model model,HttpServletRequest request) {
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		int result = rs.delete(board_num);
		
		model.addAttribute("result", result);
		return "../req_board/requestDelete";
	}
	@RequestMapping("myPage")
	public String myPage(Model model,HttpServletRequest request,Member member) {
		// 로그인된 아이디를 이용하여 member로부터 객체를 생성하여 정보를 뿌린다
		if((String)request.getSession().getAttribute("id")!=null) {
			String id = (String)request.getSession().getAttribute("id");
			member = ms.select(id);
			model.addAttribute("member", member);
		}
		return "../mem_info/myPage";
	}
	@RequestMapping("updateForm")
	public String updateForm(Model model,HttpServletRequest request) {
		String id = (String)request.getSession().getAttribute("id");
		Member member = ms.select(id);
		model.addAttribute("member", member);
		return "../mem_info/updateForm";
	}
	@RequestMapping("update")
	public String update(Model model,HttpServletRequest request) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {e.getMessage();}
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String tel = request.getParameter("tel");
		String birth = request.getParameter("birth");
		
		Member member = new Member();
		member.setMem_id(id);
		member.setMem_passwd(password);
		member.setMem_name(name);
		member.setMem_email(email);
		member.setMem_addr(address);
		member.setMem_tel(tel);
		member.setMem_birth(birth);
		
		int result = ms.update(member);
		model.addAttribute("result", result);
		return "../mem_info/update";
	}
	@RequestMapping("vipApplyForm")
	public String vipApplyForm(Model model,HttpServletRequest request) {
		return "../mem_info/vipApplyForm";
	}
	@RequestMapping("vipApply")
	public String vipApply(Model model,HttpServletRequest request) {
		String id = (String) request.getSession().getAttribute("id");	// session으로부터 id 받아오기
		Member member = ms.select(id);
		int result = ms.vipApp(member);
		model.addAttribute("result", result);
		return "../mem_info/vipApply";
	}
	@RequestMapping("myChargeList")
	public String myChargeList(Model model,HttpServletRequest request) {
		
		String id = (String) request.getSession().getAttribute("id");
		
		int rowPerPage = 12;
		int pagePerBlock = 5;
		String pageNum = request.getParameter("pageNum");
		if (pageNum==null || pageNum.equals("")) {
			pageNum="1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1)*rowPerPage + 1;
		int endRow = startRow + rowPerPage + 1;
		/*List<Charge> list2 = cs.myChargeList(id);*/
		List<Charge> list = cs.myChargeList(startRow, endRow, id);
		int tot = cs.total(id);
		int total = cs.total(id) - startRow+1;
		int startPage = currentPage - (currentPage - 1)%pagePerBlock;
		int endPage = startPage + pagePerBlock -1;
		int totPage = (int)Math.ceil((double)tot/rowPerPage);
		if (endPage > totPage) endPage = totPage;

		model.addAttribute("list", list);
		/*model.addAttribute("list2", list2);*/
		model.addAttribute("rowPerPage",rowPerPage );
		model.addAttribute("pagePerBlock",pagePerBlock );
		model.addAttribute("pageNum",pageNum );
		model.addAttribute("currentPage",currentPage );
		model.addAttribute("startRow",startRow );
		model.addAttribute("endRow",endRow );
		model.addAttribute("tot",tot );
		model.addAttribute("total",total );
		model.addAttribute("startPage",startPage );
		model.addAttribute("endPage",endPage );
		model.addAttribute("totPage",totPage );

		Member member = ms.select(id);
		model.addAttribute("member", member);
		
		return "../mem_info/myChargeList";
	}
	@RequestMapping("myDownList")
	public String myDownList(Model model,HttpServletRequest request) {
		
		String id = (String) request.getSession().getAttribute("id");
		
		int rowPerPage = 12;
		int pagePerBlock = 5;
		String pageNum = request.getParameter("pageNum");
		if (pageNum==null || pageNum.equals("")) {
			pageNum="1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1)*rowPerPage + 1;
		int endRow = startRow + rowPerPage + 1;
		
		int tot = ds.total(id);
		int total = ds.total(id) - startRow+1;	
		int startPage = currentPage - (currentPage - 1)%pagePerBlock;
		int endPage = startPage + pagePerBlock -1;
		int totPage = (int)Math.ceil((double)tot/rowPerPage);
		if (endPage > totPage) endPage = totPage;
		
		Member member = ms.select(id);
		model.addAttribute("member", member);
		
		List<Download> list = ds.myDownList(startRow, endRow, id);
		
		model.addAttribute("list", list);
		
		model.addAttribute("rowPerPage",rowPerPage );
		model.addAttribute("pagePerBlock",pagePerBlock );
		model.addAttribute("pageNum",pageNum );
		model.addAttribute("currentPage",currentPage );
		model.addAttribute("startRow",startRow );
		model.addAttribute("endRow",endRow );
		model.addAttribute("tot",tot );
		model.addAttribute("total",total );
		model.addAttribute("startPage",startPage );
		model.addAttribute("endPage",endPage );
		model.addAttribute("totPage",totPage );
		
		return "../mem_info/myDownList";
	}
	@RequestMapping("delete")
	public String delete(Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();	// 탈퇴시킨놈이 깽판못치게끔 invalidate() 시킨다
		String id = (String) request.getSession().getAttribute("id");
		int result = ms.delete(id);
		if(result>0)
			session.invalidate();
		model.addAttribute("result", result);
		return "../mem_info/delete";
	}
	@RequestMapping("fileSelect")
	public String fileSelect(Model model,HttpServletRequest request) {
		
		// String id = (String)request.getSession().getAttribute("id");
		String id = request.getParameter("id");
		int file_num = Integer.parseInt(request.getParameter("file_num"));
		FileUp fileup = fs.select(file_num);
		Member member = ms.select(id);
		
		model.addAttribute("file_num", file_num);
		model.addAttribute("fileup", fileup);
		model.addAttribute("member", member);
		
		return "fileSelect";
	}
	@RequestMapping("fileList")
	public String fileList(Model model,HttpServletRequest request) {
		// paging 을 위한 변수
		int rowPerPage = 10;
		int pagePerBlock = 10;
		String pageNum = request.getParameter("pageNum");
		if (pageNum==null || pageNum.equals("")) {
			pageNum = "1";}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1)*rowPerPage + 1;
		int endRow  = startRow + rowPerPage - 1;
		
		// 파일리스트를 받아올 fd 생성
		String category = request.getParameter("category");
		if (category == null || category == "")	{
			List<FileUp> list = fs.list(startRow, endRow);	
			
			int tot = fs.total();
			int total = fs.total() - startRow + 1;
			int startPage = currentPage - (currentPage -1)% pagePerBlock;
			int endPage = startPage + pagePerBlock -1;
			int totPage = (int)Math.ceil((double)tot/rowPerPage);
			if (endPage>totPage) endPage = totPage;
			
			model.addAttribute("list", list);
			model.addAttribute("rowPerPage", rowPerPage);
			model.addAttribute("pagePerBlock", pagePerBlock);
			model.addAttribute("pageNum", pageNum);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("startRow", startRow);
			model.addAttribute("endRow", endRow);
			model.addAttribute("tot", tot);
			model.addAttribute("total", total);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("totPage", totPage);
			
		}else if (category.equals("Top15"))	{
			List<FileUp> list = fs.list6();	
			model.addAttribute("list", list);
			return "top15";
		}
		else	{
			List<FileUp> list2 = fs.list2(category, startRow, endRow);
			
			int totCategory = fs.total(category);
			int totalCategory = fs.total(category) - startRow + 1;
			int startPage = currentPage - (currentPage -1)% pagePerBlock;
			int endPage = startPage + pagePerBlock -1;
			int totPage = (int)Math.ceil((double)totCategory/rowPerPage);
			if (endPage>totPage) endPage = totPage;
			
			model.addAttribute("list", list2);
			model.addAttribute("rowPerPage", rowPerPage);
			model.addAttribute("pagePerBlock", pagePerBlock);
			model.addAttribute("pageNum", pageNum);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("startRow", startRow);
			model.addAttribute("endRow", endRow);
			model.addAttribute("tot", totCategory);
			model.addAttribute("total", totalCategory);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("totPage", totPage);
			model.addAttribute("category", category);
		}
		return "fileList";
	}
	@RequestMapping("fileListSlide")
	public String fileListSlide(Model model,HttpServletRequest request) {
		// paging 을 위한 변수
		int rowPerPage = 50;
		int pagePerBlock = 10;
		String pageNum = request.getParameter("pageNum");
		if (pageNum==null || pageNum.equals("")) {
			pageNum = "1";}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1)*rowPerPage + 1;
		int endRow  = startRow + rowPerPage - 1;
		
		// 파일리스트를 받아올 fd 생성
		String category = request.getParameter("category");
		if (category == null || category == "")	{
			List<FileUp> list = fs.list(startRow, endRow);	
			
			int tot = fs.total();
			int total = fs.total() - startRow + 1;
			int startPage = currentPage - (currentPage -1)% pagePerBlock;
			int endPage = startPage + pagePerBlock -1;
			int totPage = (int)Math.ceil((double)tot/rowPerPage);
			if (endPage>totPage) endPage = totPage;
			
			model.addAttribute("list", list);
			model.addAttribute("rowPerPage", rowPerPage);
			model.addAttribute("pagePerBlock", pagePerBlock);
			model.addAttribute("pageNum", pageNum);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("startRow", startRow);
			model.addAttribute("endRow", endRow);
			model.addAttribute("tot", tot);
			model.addAttribute("total", total);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("totPage", totPage);
			
		}	else	{
			List<FileUp> list2 = fs.list2(category, startRow, endRow);
			
			int totCategory = fs.total(category);
			int totalCategory = fs.total(category) - startRow + 1;
			int startPage = currentPage - (currentPage -1)% pagePerBlock;
			int endPage = startPage + pagePerBlock -1;
			int totPage = (int)Math.ceil((double)totCategory/rowPerPage);
			if (endPage>totPage) endPage = totPage;
			
			model.addAttribute("list", list2);
			model.addAttribute("rowPerPage", rowPerPage);
			model.addAttribute("pagePerBlock", pagePerBlock);
			model.addAttribute("pageNum", pageNum);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("startRow", startRow);
			model.addAttribute("endRow", endRow);
			model.addAttribute("tot", totCategory);
			model.addAttribute("total", totalCategory);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("totPage", totPage);
			model.addAttribute("category", category);
		}
		return "fileListSlide";
	}
	@RequestMapping("fileSearch")
	public String fileSearch(Model model,HttpServletRequest request) {

		// paging 을 위한 변수
		int rowPerPage = 15;
		int pagePerBlock = 10;
		String pageNum = request.getParameter("pageNum");
		if (pageNum==null || pageNum.equals("")) {
			pageNum = "1";}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1)*rowPerPage + 1;
		int endRow  = startRow + rowPerPage - 1;


		// 해쉬맵을 통한 변수 전달
		HashMap<String, Object> hm = new HashMap<String, Object>();
		String category = request.getParameter("cate");
		String subject = request.getParameter("subject");
		String keyword = request.getParameter("keyword");
		hm.put("category", category);
		hm.put("subject", subject);
		hm.put("keyword", keyword);
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		
		// 파일리스트 객체 생성
		if (category == null || category == "")	{	// 검색시 카테고리가 없는 경우(전체 선택 시)
			List<FileUp> list1 = fs.listSearch1(hm);
			model.addAttribute("list", list1);
			
			int tot = fs.totalSearch(hm);
			int startPage = currentPage - (currentPage -1)% pagePerBlock;
			int endPage = startPage + pagePerBlock -1;
			int totPage = (int)Math.ceil((double)tot/rowPerPage);
			if (endPage>totPage) endPage = totPage;
			
			model.addAttribute("rowPerPage", rowPerPage);
			model.addAttribute("pagePerBlock", pagePerBlock);
			model.addAttribute("pageNum", pageNum);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("startRow", startRow);
			model.addAttribute("endRow", endRow);
			model.addAttribute("tot", tot);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("totPage", totPage);
			model.addAttribute("subject", subject);
			model.addAttribute("keyword", keyword);
			
		}	else	{	// 검색시 카테고리가 있는 경우
			List<FileUp> list2 = fs.listSearch2(hm);
			model.addAttribute("list", list2);
			
			int tot = fs.totalSearch2(hm);
			int startPage = currentPage - (currentPage -1)% pagePerBlock;
			int endPage = startPage + pagePerBlock -1;
			int totPage = (int)Math.ceil((double)tot/rowPerPage);
			if (endPage>totPage) endPage = totPage;		
			
			model.addAttribute("rowPerPage", rowPerPage);
			model.addAttribute("pagePerBlock", pagePerBlock);
			model.addAttribute("pageNum", pageNum);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("startRow", startRow);
			model.addAttribute("endRow", endRow);
			model.addAttribute("tot", tot);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("totPage", totPage);
			model.addAttribute("category", category); // category를 보내야 함
			model.addAttribute("subject", subject);
			model.addAttribute("keyword", keyword);
		}
		
		/*오류 검출을 위한 출력 메시지 코드*/
		/*System.out.println("오류 검출 해보자");
		System.out.println(hm.get("category"));
		System.out.println(hm.get("subject"));
		System.out.println(hm.get("keyword"));*/
		return "fileSearch";
	}
	@RequestMapping("fileUpdateForm")
	public String fileUpdateForm(Model model,HttpServletRequest request,Member member) {
		// 로그인 정보(판매자 아이디 정보) 가지고   업데이트 파일 폼 jsp로 보낸다
		if((String)request.getSession().getAttribute("id")!=null) {
			String id = (String)request.getSession().getAttribute("id");
			
			// String id = (String)request.getSession().getAttribute("id");
			int file_num = Integer.parseInt(request.getParameter("file_num"));
			FileUp fileup = fs.select(file_num);
			member = ms.select(id);
			
			model.addAttribute("file_num", file_num);
			model.addAttribute("fileup", fileup);
			model.addAttribute("member", member);
			
			
		}
		return "fileUpdateForm";
	}
	
	@RequestMapping("fileUpdate")
	public String fileUpdate(Model model,HttpServletRequest request,Member member,FileUp file) throws IOException {
		// 업로드 데이터를 받아서 sql 써서 인서트 시키고 전달
		if(!file.getFile1().isEmpty()&&!file.getFile2().isEmpty()){		
			String fname1 = file.getFile1().getOriginalFilename();
			String fname2 = file.getFile2().getOriginalFilename();
			int file_num = Integer.parseInt(request.getParameter("file_num"));
			int file_point = Integer.parseInt(request.getParameter("file_point"));
			String mem_id = request.getParameter("mem_id");
			String file_name = request.getParameter("file_name");
			String category = request.getParameter("category");
			String file_desc = request.getParameter("file_desc");
			
			String path = request.getSession().getServletContext().getRealPath("/fileSave");
			String fpath1 = path + "\\" + fname1;
			String fpath2 = path + "\\" + fname2;
//			System.out.println("fpath1 = "+fpath1);
//			System.out.println("fpath2 = "+fpath2);
			FileOutputStream fos1 = new FileOutputStream(fpath1);
			fos1.write(file.getFile1().getBytes());
			fos1.close();
			FileOutputStream fos2 = new FileOutputStream(fpath2);
			fos2.write(file.getFile2().getBytes());
			fos2.close();

			String file_upload = fname1;
			String file_shot = fname2;
			File filedata = new File(fpath1);
			int file_size = (int)filedata.length();
			
			file.setFile_name(file_name);
			file.setCategory(category);
			file.setFile_desc(file_desc);
			file.setMem_id(mem_id);
			file.setFile_num(file_num);
			file.setFile_shot(file_shot);
			file.setFile_upload(file_upload);
			file.setFile_size(file_size);
			file.setFile_point(file_point);
			
			System.out.println(mem_id);
			System.out.println(file_num);
			System.out.println(file_shot);
			System.out.println(file_upload);
			System.out.println(file_size);
			System.out.println(category);
		
		}
		int result = fs.update(file);
		model.addAttribute("result", result);
		return "fileUpdate";
	}
	@RequestMapping("fileDelete")
	public String fileDelete(Model model,HttpServletRequest request,Member member) {
		// 로그인 정보(판매자 아이디 정보) 가지고   업데이트 파일 폼 jsp로 보낸다
		if((String)request.getSession().getAttribute("id")!=null) {
			String id = (String)request.getSession().getAttribute("id");
			
			// String id = (String)request.getSession().getAttribute("id");
			int file_num = Integer.parseInt(request.getParameter("file_num"));
			FileUp fileup = fs.select(file_num);
			member = ms.select(id);
			
			model.addAttribute("file_num", file_num);
			model.addAttribute("fileup", fileup);
			model.addAttribute("member", member);
			int result = fs.delete(file_num);
			model.addAttribute("result", result);
			
		}
		return "fileDelete";
	}
	
	@RequestMapping("fileUploadForm")
	public String fileUploadForm(Model model,HttpServletRequest request,Member member) {
		// 로그인 정보(판매자 아이디 정보) 가지고   업로드 파일 폼 jsp로 보낸다
		if((String)request.getSession().getAttribute("id")!=null) {
			String id = (String)request.getSession().getAttribute("id");
			member = ms.select(id);
			model.addAttribute("member", member);
		}
		return "fileUpForm";
	}
	
	@RequestMapping("fileUpload")
	public String fileUpload(Model model,HttpServletRequest request,Member member,FileUp file) throws IOException {
		// 업로드 데이터를 받아서 sql 써서 인서트 시키고 전달
		if(!file.getFile1().isEmpty()&&!file.getFile2().isEmpty()){		
			String fname1 = file.getFile1().getOriginalFilename();
			String fname2 = file.getFile2().getOriginalFilename();
			String path = request.getSession().getServletContext().getRealPath("/fileSave");
			String fpath1 = path + "\\" + fname1;
			String fpath2 = path + "\\" + fname2;
			
			FileOutputStream fos1 = new FileOutputStream(fpath1);
			fos1.write(file.getFile1().getBytes());
			fos1.close();
			FileOutputStream fos2 = new FileOutputStream(fpath2);
			fos2.write(file.getFile2().getBytes());
			fos2.close();

		String file_upload = fname1;
		String file_shot = fname2;
		File filedata = new File(fpath1);
		int file_size = (int)filedata.length();
		
/*		file.setFile_name(file_name);
		file.setCategory(category);
		file.setMem_id(mem_id);
		file.setFile_desc(file_desc);
		file.setFile_point(file_point);*/
		file.setFile_shot(file_shot);
		file.setFile_upload(file_upload);
		file.setFile_size(file_size);
		}
		int result = fs.insert(file);
		model.addAttribute("result", result);
		return "fileUpload";
	}
	@RequestMapping("fileDown")
	public String fileDown(Model model,HttpServletRequest request) {
		// 파일다운이 제대로 되는지(검색및 다운수를 늘려줌) 알려주는 변수 생성해서 보냄
		int file_num = Integer.parseInt(request.getParameter("file_num"));
		String mem_id = request.getParameter("mem_id");	// 구매자 아이디
		
		Download download = new Download();
		download.setFile_num(file_num);
		download.setDown_id(mem_id);
		int result = ds.insert(download);
		
		Member member = ms.select(mem_id);
		
		// 파일 다운로드시 구매자 포인트 차감 구현
		FileUp fileup = fs.select(file_num);
		int down_point = fileup.getFile_point();
/*		int charge_point = Integer.parseInt(request.getParameter("charge"));*/
		member.setMem_point(down_point);
		// member객체 포인트 값을 기존에 갖고 있던 값이 아닌 다운로드 받을 파일의 포인트로 바꾸어(데이터에는 반영이 안됨 지니기만 함)
		// 별도의 변수 생성없이 가지고 가서 sql문에서 반영시키도록 한다
		int result2 = ms.down(member);
		
		// 파일 다운로드시 판매자 포인트 상승 구현
		String mem_id2 = fileup.getMem_id();
		Member member2 = ms.select(mem_id2);
		int up_point = down_point/2;		// 판매 수수료 50%
		member2.setMem_point(up_point);
		int result3 = ms.upload(member2);
		
		// 파일 다운로드 시 파일 다운로드 수 +1 구현
		int result4 = fs.down(file_num);
		

		model.addAttribute("result", result);
		model.addAttribute("result2", result2);
		model.addAttribute("result3", result3);
		
		return "fileDown";
	}
	@RequestMapping("fileReSelect")
	public String fileReSelect(Model model,HttpServletRequest request) {
		String id = request.getParameter("id");
		int file_num = Integer.parseInt(request.getParameter("file_num"));
		FileUp fileup = fs.select(file_num);
		Member member = ms.select(id);
		
		model.addAttribute("file_num", file_num);
		model.addAttribute("fileup", fileup);
		model.addAttribute("member", member);
		return "fileReSelect";
	}
	@RequestMapping("fileReDown")
	public String fileReDown(Model model,HttpServletRequest request) {
		// 다시받기는 download 내역을 추가할 필요도, 포인트를 변동시킬 필요도 없음
		return "fileReDown";
	}
	@RequestMapping("weather")
	public String weather() {
		
		return "weather";
	}
}

