package com.nexmore.web.mapper;

import java.util.List;


import org.springframework.stereotype.Repository;

import com.nexmore.web.model.ProfileLicenseVo;

@Repository
public interface ProfileLicenseMapper {
	List<ProfileLicenseVo> list();
}
