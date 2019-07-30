package com.ch.my.service;
import java.util.Collection;
import java.util.List;

import com.ch.my.model.Req_Board;
public interface Req_BoardService {

	List<Req_Board> list(int startRow, int endRow);

	int total();

	void readcountUpdate(int board_num);

	Req_Board select(int board_num);

	int insert(Req_Board req_board);

	void increaseAncestor(int board_num);

	int maxStep(int board_ref);

	void numupdate(Req_Board req_board);

	int reSelect(Req_Board req_board);

	int reInsert(Req_Board req_board);

	int update(Req_Board req_board);

	int delete(int board_num);


}