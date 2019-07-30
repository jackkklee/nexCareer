package com.ch.my.dao;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.my.model.Charge;
import com.ch.my.model.Text;
@Repository
public class TextDaoImpl implements TextDao {
	@Autowired
	private SqlSessionTemplate sst;
	@Override
	public int insert(Text text) {
		return sst.insert("textns.insert",text);
	}
	@Override
	public List<Text> list() {
		return sst.selectList("textns.list");
	}
	@Override
	public void delete(int num2) {
		sst.delete("textns.delete",num2);
	}
}



