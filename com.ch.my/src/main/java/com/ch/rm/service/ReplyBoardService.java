package com.ch.rm.service;

import java.util.Collection;

import com.ch.rm.model.ReplyBoard;

public interface ReplyBoardService {

	Collection<ReplyBoard> list(int bno);

	void insert(ReplyBoard rb);

	void delete(int rno);

	void update(ReplyBoard rb);

}
