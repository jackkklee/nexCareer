package com.ch.my.dao;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.my.model.Req_Board;
@Repository
public class Req_BoardDaoImpl implements Req_BoardDao {
	@Autowired
	private SqlSessionTemplate sst;
	public List<Req_Board> list(int startRow,int endRow) {
		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		return sst.selectList("req_boardns.list",hm);
	}	
	public int insert(Req_Board req_board) {
		return sst.insert("req_boardns.insert", req_board);
	}
	public Req_Board select(int board_num) {
		return (Req_Board)sst.selectOne("req_boardns.getBoard", board_num);
	}
	public void readcountUpdate(int board_num) {
		Req_Board req_board = null;
		try {
			req_board = (Req_Board)sst.selectOne("req_boardns.readcount", board_num);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	public int update(Req_Board req_board) {
		return sst.update("req_boardns.update", req_board);
	}
	public int delete(int board_num) {
		return sst.update("req_boardns.delete",board_num);
	}
	public int maxStep(int board_ref) {
		return sst.selectOne("req_boardns.maxStep", board_ref);
	}
	public void increaseAncestor(int board_num) {
		sst.update("req_boardns.increaseAncestor",board_num);
	}
	public void numupdate(Req_Board req_board) {
		sst.update("req_boardns.numupdate", req_board);
	}
	public int reSelect(Req_Board req_board) {
		return sst.selectOne("req_boardns.reSelect",req_board);
	}
	public int reInsert(Req_Board req_board) {
		return sst.insert("req_boardns.reInsert",req_board);
	}
	public int total() {
		return sst.selectOne("req_boardns.total");
	}
}



