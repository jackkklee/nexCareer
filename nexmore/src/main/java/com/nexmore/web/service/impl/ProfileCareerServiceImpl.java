package com.nexmore.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nexmore.web.mapper.ProfileCareerMapper;
import com.nexmore.web.model.ProfileCareerVo;
import com.nexmore.web.service.ProfileCareerService;



@Service("career")
public class ProfileCareerServiceImpl implements ProfileCareerService{
	@Autowired
	private ProfileCareerMapper career;

	public List<ProfileCareerVo> list() {
		return career.list();
	}
	
	
}
