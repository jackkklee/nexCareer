package com.ch.my.service;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.my.dao.ManagerDao;
import com.ch.my.model.Manager;
@Service
public class ManagerServiceImpl implements ManagerService{
	@Autowired
	private ManagerDao md;
	@Override
	public Manager select(String managerid) {
		return md.select(managerid);
	}
}