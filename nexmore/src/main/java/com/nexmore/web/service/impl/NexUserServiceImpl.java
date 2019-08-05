package com.nexmore.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nexmore.web.mapper.NexUserMapper;
import com.nexmore.web.model.NexUserVo;
import com.nexmore.web.service.NexUserService;



@Service("user")
public class NexUserServiceImpl implements NexUserService{
	@Autowired
	private NexUserMapper user;

	public List<NexUserVo> list() {
		return user.list();
	}
	
	
}
