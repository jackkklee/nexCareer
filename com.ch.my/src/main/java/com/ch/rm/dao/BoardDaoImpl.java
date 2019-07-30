package com.ch.rm.dao;

import java.util.Collection;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.rm.model.Board;

@Repository
public class BoardDaoImpl implements BoardDao{
	@Autowired
	private SqlSessionTemplate sst;

	
	/*public Collection<Board> list(int startRow, int endRow) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return sst.selectList("boardns.list", map);
	}*/
	public Collection<Board> list(Board board) {
		return sst.selectList("boardns.list", board);
	}

	@Override
	public int getTotal(Board board) {
		return sst.selectOne("boardns.getTotal", board);
	}
	

	@Override
	public Board select(int num) {
		return sst.selectOne("boardns.select", num);
	}

	@Override
	public void updateReadcount(int num) {
		sst.update("boardns.updateReadcount", num);
		
	}

	public int maxNum() {
		return sst.selectOne("boardns.maxNum");
	}

	@Override
	public int insert(Board board) {
		return sst.insert("boardns.insert",board);
	}

	@Override
	public int update(Board board) {
		return sst.update("boardns.update", board);
	}

	@Override
	public int delete(Board board) {
		return sst.update("boardns.delete",board);
	}

	@Override
	public void updateStep(Board board) {
		sst.update("boardns.updateStep", board);
		
	}

	
	}

	
	

