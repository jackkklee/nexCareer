package com.ch.my.dao;
import java.util.Collection;
import java.util.List;

import com.ch.my.model.Req_Board;
public interface Req_BoardDao {

	int delete(int board_num);

	int update(Req_Board req_board);

	int reInsert(Req_Board req_board);

	int reSelect(Req_Board req_board);

	int maxStep(int board_ref);

	void numupdate(Req_Board req_board);

	int insert(Req_Board req_board);

	void increaseAncestor(int board_num);

	Req_Board select(int board_num);

	int total();

	void readcountUpdate(int board_num);

	List<Req_Board> list(int startRow, int endRow);
}