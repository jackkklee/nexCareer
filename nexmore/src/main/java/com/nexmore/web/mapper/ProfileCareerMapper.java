package com.nexmore.web.mapper;

import java.util.List;


import org.springframework.stereotype.Repository;

import com.nexmore.web.model.ProfileCareerVo;

@Repository
public interface ProfileCareerMapper {
	List<ProfileCareerVo> list();
}
