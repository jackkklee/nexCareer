package com.nexmore.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nexmore.web.mapper.ProfileLicenseMapper;
import com.nexmore.web.model.ProfileLicenseVo;
import com.nexmore.web.service.ProfileLicenseService;



@Service("license")
public class ProfileLicenseServiceImpl implements ProfileLicenseService{
	@Autowired
	private ProfileLicenseMapper license;
	public List<ProfileLicenseVo> list() {
		return license.list();
	}
	
}
