package com.ch.rm.service;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.rm.dao.ReplyBoardDao;
import com.ch.rm.model.ReplyBoard;

@Service
public class ReplyBoardServiceImpl implements ReplyBoardService{
	@Autowired
	private ReplyBoardDao rbd;

	public Collection<ReplyBoard> list(int bno) {
		return rbd.list(bno);
	}

	@Override
	public void insert(ReplyBoard rb) {
		rbd.insert(rb);
	}

	@Override
	public void delete(int rno) {
		rbd.delete(rno);
		
	}

	@Override
	public void update(ReplyBoard rb) {
		rbd.update(rb);
		
	}
}
