package com.ch.my.service;
import java.util.Collection;
import java.util.List;

import com.ch.my.model.Charge;
import com.ch.my.model.Text;
public interface TextService {

	int insert(Text text);

	List<Text> list();

	void delete(int num2);

}