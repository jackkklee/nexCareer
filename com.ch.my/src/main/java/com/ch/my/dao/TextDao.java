package com.ch.my.dao;
import java.util.Collection;
import java.util.List;

import com.ch.my.model.Text;
public interface TextDao {

	int insert(Text text);

	List<Text> list();

	void delete(int num2);




}