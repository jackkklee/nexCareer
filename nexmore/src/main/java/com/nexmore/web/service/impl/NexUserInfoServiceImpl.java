package com.nexmore.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nexmore.web.mapper.NexUserInfoMapper;
import com.nexmore.web.model.NexUserInfoVo;
import com.nexmore.web.service.NexUserInfoService;



@Service("userInfo")
public class NexUserInfoServiceImpl implements NexUserInfoService{
	@Autowired
	private NexUserInfoMapper userInfo;

	public List<NexUserInfoVo> list() {
		return userInfo.list();
	}
	
	
}
