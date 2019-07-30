package com.ch.my.service;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.my.dao.TextDao;
import com.ch.my.model.Text;
@Service
public class TextServiceImpl implements TextService{
	@Autowired
	private TextDao td;
	@Override
	public int insert(Text text) {
		return td.insert(text);
	}
	@Override
	public List<Text> list() {
		return td.list();
	}
	@Override
	public void delete(int num2) {
		td.delete(num2);
	}
}