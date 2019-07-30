package com.ch.rm.dao;

import java.util.Collection;

import com.ch.rm.model.ReplyBoard;

public interface ReplyBoardDao {

	Collection<ReplyBoard> list(int bno);

	void insert(ReplyBoard rb);

	void delete(int rno);

	void update(ReplyBoard rb);

}
