package com.nexmore.web.mapper;

import java.util.List;


import org.springframework.stereotype.Repository;

import com.nexmore.web.model.ProfileVo;

@Repository
public interface ProfileMapper {
	List<ProfileVo> list();
}
