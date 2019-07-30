package com.ch.rm.dao;

import java.util.Collection;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.rm.model.ReplyBoard;

@Repository
public class ReplyBoardDaoImpl implements ReplyBoardDao{
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public Collection<ReplyBoard> list(int bno) {
		return sst.selectList("rbdns.list",bno);
	}

	@Override
	public void insert(ReplyBoard rb) {
		sst.insert("rbdns.insert", rb);
	}

	@Override
	public void delete(int rno) {
		sst.update("rbdns.delete",rno);
		
	}

	@Override
	public void update(ReplyBoard rb) {
		sst.update("rbdns.update", rb);
		
	}
}
