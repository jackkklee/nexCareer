package com.ch.my.service;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.my.dao.Req_BoardDao;
import com.ch.my.model.Req_Board;
@Service
public class Req_BoardServiceImpl implements Req_BoardService{
	@Autowired
	private Req_BoardDao rd;

	@Override
	public List<Req_Board> list(int startRow, int endRow) {
		return rd.list(startRow, endRow);
	}

	@Override
	public int total() {
		return rd.total();
	}
	@Override
	public void readcountUpdate(int board_num) {
		rd.readcountUpdate(board_num);
	}

	@Override
	public Req_Board select(int board_num) {
		return rd.select(board_num);
	}

	@Override
	public int insert(Req_Board req_board) {
		return rd.insert(req_board);
	}

	@Override
	public void increaseAncestor(int board_num) {
		rd.increaseAncestor(board_num);
	}

	@Override
	public int maxStep(int board_ref) {
		return rd.maxStep(board_ref);
	}

	@Override
	public void numupdate(Req_Board req_board) {
		rd.numupdate(req_board);
	}

	@Override
	public int reSelect(Req_Board req_board) {
		return rd.reSelect(req_board);
	}

	@Override
	public int reInsert(Req_Board req_board) {
		return rd.reInsert(req_board);
	}

	@Override
	public int update(Req_Board req_board) {
		return rd.update(req_board);
	}

	@Override
	public int delete(int board_num) {
		return rd.delete(board_num);
	}
	
}