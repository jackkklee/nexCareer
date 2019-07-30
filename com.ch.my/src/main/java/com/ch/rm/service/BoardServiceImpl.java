package com.ch.rm.service;
import java.util.Collection;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ch.rm.dao.BoardDao;
import com.ch.rm.model.Board;
@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDao bd;

	
	/*public Collection<Board> list(int startRow, int endRow) {
		return bd.list(startRow, endRow);
	}
*/
	
	public int getTotal(Board board) {
		return bd.getTotal(board);
	}

	@Override
	public Collection<Board> list(Board board) {
		return bd.list(board);
	}

	
	@Override
	public Board select(int num) {
		return bd.select(num);
	}

	@Override
	public void updateReadcount(int num) {
		bd.updateReadcount(num);
		
	}

	
	public int maxNum() {
		return bd.maxNum();
	}

	@Override
	public int insert(Board board) {
		return bd.insert(board);
	}

	@Override
	public int update(Board board) {
		return bd.update(board);
	}

	@Override
	public int delete(Board board) {
		return bd.delete(board);
	}

	@Override
	public void updateStep(Board board) {
		bd.updateStep(board);
		
	}

	
	}
