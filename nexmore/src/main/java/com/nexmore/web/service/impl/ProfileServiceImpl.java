package com.nexmore.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nexmore.web.mapper.ProfileMapper;
import com.nexmore.web.model.ProfileVo;
import com.nexmore.web.service.ProfileService;



@Service("profile")
public class ProfileServiceImpl implements ProfileService{
	@Autowired
	private ProfileMapper profile;

	public List<ProfileVo> list() {
		return profile.list();
	}
	
	
}
