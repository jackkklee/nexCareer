package kr.co.ucp.neww.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ucp.neww.dao.NewDao;

@Service
public class NewServiceImpl implements NewService{
	@Autowired
	private NewDao nd;
	
	
}
